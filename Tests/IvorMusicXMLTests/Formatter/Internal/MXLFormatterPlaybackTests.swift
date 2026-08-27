// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterPlaybackTests {
}

// MARK: -

extension MXLFormatterPlaybackTests {
    @Test
    func format_roundTripsListeningAndNotePlayListen() throws {
        let listening = MXLListening(items: [.sync(MXLSync(kind: .mostlyTempo,
                                                           latency: 20,
                                                           player: "P1",
                                                           timeOnly: [1])),
                                             .otherListening(MXLOtherListening(value: "ol",
                                                                               kind: "custom",
                                                                               player: "P1"))],
                                     offset: MXLOffset(value: -2))
        let note = MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: false,
                                                                       content: .pitch(MXLPitch(step: .c,
                                                                                                octave: 4))),
                                                 duration: 4,
                                                 tie: []),
                           play: MXLPlay(items: [.mute(.straight),
                                                 .semiPitched(.veryLow)]),
                           listen: MXLListen(items: [.assess(MXLAssess(shouldAssess: true,
                                                                       player: "P1")),
                                                     .wait(MXLWait(player: "P1",
                                                                   timeOnly: [2])),
                                                     .otherListen(MXLOtherListening(value: "ol2",
                                                                                    kind: "k"))]))

        try expectRoundTrip(items: [.listening(listening), .note(note)])
    }

    @Test
    func format_roundTripsSoundWithGroupsSwingAndOffset() throws {
        let play = MXLPlay(id: "PL1",
                           items: [.ipa("a"),
                                   .mute(.cup),
                                   .semiPitched(.mediumHigh),
                                   .otherPlay(MXLOtherPlay(value: "buzz",
                                                           kind: "custom"))])
        let instrument = MXLMidiInstrument(id: "P1-I1",
                                           midiChannel: 1,
                                           midiName: "Grand Piano",
                                           midiBank: 15_000,
                                           midiProgram: 1,
                                           midiUnpitched: 40,
                                           volume: 80,
                                           pan: -90,
                                           elevation: 45)
        // The parser fills each child kind from the lowest group index, so the first
        // group carries every kind and the second carries only the extra
        // instrument-change — the shape a parsed sound would have.
        let group0 = MXLSound.Group(instrumentChange: MXLInstrumentChange(id: "IC0"),
                                    midiDevice: MXLMidiDevice(id: "D0",
                                                              value: "SW Synth",
                                                              port: 1),
                                    midiInstrument: instrument,
                                    play: play)
        let group1 = MXLSound.Group(instrumentChange: MXLInstrumentChange(id: "IC1"))
        let sound = MXLSound(id: "S1",
                             group: [group0, group1],
                             swing: MXLSwing(content: .first(2,
                                                             second: 1,
                                                             kind: .eighth),
                                             style: "heavy"),
                             offset: MXLOffset(value: 3,
                                               affectsPlayback: true),
                             tempo: 120,
                             dynamics: 90,
                             isDaCapo: true,
                             segno: "s",
                             dalsegno: "ds",
                             coda: "c",
                             tocoda: "tc",
                             divisions: 24,
                             impliesForwardRepeat: false,
                             fine: "fine",
                             timeOnly: [1, 2],
                             isPizzicato: true,
                             pan: -45,
                             elevation: 30,
                             damperPedal: .yes,
                             softPedal: .number(50),
                             sostenutoPedal: .no)

        try expectRoundTrip(items: [.sound(sound)])
    }
}
