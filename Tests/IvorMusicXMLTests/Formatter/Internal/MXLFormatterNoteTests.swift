// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterNoteTests {
}

// MARK: -

extension MXLFormatterNoteTests {
    @Test
    func format_roundTripsGraceNotes() throws {
        let pitch = MXLPitch(step: .d,
                             octave: 5)
        let grace = MXLNote(content: .graceNote(fullNote: MXLFullNote(isChord: false,
                                                                      content: .pitch(pitch)),
                                                grace: MXLGrace(stealTimePrevious: 25,
                                                                makeTime: 2,
                                                                isSlashed: true),
                                                tie: [MXLTie(kind: .start)]))
        let graceCue = MXLNote(content: .graceNoteCue(fullNote: MXLFullNote(isChord: false,
                                                                            content: .pitch(pitch)),
                                                      grace: MXLGrace(isSlashed: false)))

        try expectRoundTrip(items: [.note(grace), .note(graceCue)])
    }

    @Test
    func format_roundTripsRestUnpitchedAndCue() throws {
        let displayStepOctave = MXLDisplayStepOctave(displayStep: .g,
                                                     displayOctave: 4)
        let restFullNote = MXLFullNote(isChord: false,
                                       content: .rest(MXLRest(displayStepOctave: displayStepOctave,
                                                              measure: true)))
        let rest = MXLNote(content: .regularNote(fullNote: restFullNote,
                                                 duration: 8,
                                                 tie: []))
        let unpitchedFullNote = MXLFullNote(isChord: false,
                                            content: .unpitched(MXLUnpitched(displayStepOctave: displayStepOctave)))
        let unpitched = MXLNote(content: .regularNote(fullNote: unpitchedFullNote,
                                                      duration: 4,
                                                      tie: []))
        let cueFullNote = MXLFullNote(isChord: false,
                                      content: .rest(MXLRest()))
        let cue = MXLNote(content: .regularNoteCue(fullNote: cueFullNote,
                                                   duration: 2))

        try expectRoundTrip(items: [.note(rest), .note(unpitched), .note(cue)])
    }

    @Test
    func format_roundTripsRichNote() throws {
        let pitch = MXLPitch(step: .c,
                             alter: 1,
                             octave: 4)
        let printStyle = MXLPrintStyle(position: MXLPosition(defaultX: 1.5),
                                       color: "#111111")
        let dot = MXLEmptyPlacement(printStyle: printStyle,
                                    placement: .above)
        let accidental = MXLAccidental(value: .sharp,
                                       isCautionary: true,
                                       isEditorial: false,
                                       levelDisplay: MXLLevel.Display(hasParentheses: true,
                                                                      hasBracket: false,
                                                                      size: .large),
                                       smufl: "accidentalSharp")
        let timeModification = MXLTimeModification(actualNotes: 3,
                                                   normalNotes: 2,
                                                   group: MXLTimeModification.Group(normalKind: .eighth,
                                                                                    normalDot: 1))
        let notehead = MXLNote.Notehead(value: .diamond,
                                        isFilled: true,
                                        hasParentheses: true)
        let beam = MXLBeam(value: .begin,
                           number: 1,
                           repeater: false,
                           fan: .accel)
        let note = MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: true,
                                                                       content: .pitch(pitch)),
                                                 duration: 4,
                                                 tie: [MXLTie(kind: .start,
                                                              timeOnly: [1, 2])]),
                           voice: MXLVoice(voice: "1"),
                           kind: MXLNote.Kind(value: .quarter,
                                              size: .cue),
                           dot: [dot],
                           accidental: accidental,
                           timeModification: timeModification,
                           stem: MXLStem(value: .up),
                           notehead: notehead,
                           staff: 2,
                           beam: [beam],
                           color: "#223344",
                           printout: MXLPrintout(printsObject: true,
                                                 printsDot: true,
                                                 printsSpacing: false,
                                                 printsLyric: true),
                           printsLeger: true,
                           dynamics: 80,
                           endDynamics: 75,
                           attack: 2,
                           release: 3,
                           timeOnly: [1, 3],
                           isPizzicato: true)

        try expectRoundTrip(items: [.note(note)])
    }
}
