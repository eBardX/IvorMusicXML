// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMidiInstrumentTests {
}

// MARK: -

extension MXLMidiInstrumentTests {
    @Test
    func equality() {
        #expect(MXLMidiInstrument(id: "i1") == MXLMidiInstrument(id: "i1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMidiInstrument> = [MXLMidiInstrument(id: "i1"), MXLMidiInstrument(id: "i1"), MXLMidiInstrument(id: "i2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMidiInstrument(id: "i1") != MXLMidiInstrument(id: "i2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMidiInstrument(id: "i1")

        #expect(value.elevation == nil)
        #expect(value.id == "i1")
        #expect(value.midiBank == nil)
        #expect(value.midiChannel == nil)
        #expect(value.midiName == nil)
        #expect(value.midiProgram == nil)
        #expect(value.midiUnpitched == nil)
        #expect(value.pan == nil)
        #expect(value.volume == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMidiInstrument(id: "i1",
                                      midiChannel: MXLMidi16(uintValue: 1),
                                      midiName: "Violin",
                                      midiBank: MXLMidi16384(uintValue: 100),
                                      midiProgram: MXLMidi128(uintValue: 1),
                                      midiUnpitched: MXLMidi128(uintValue: 2),
                                      volume: 80,
                                      pan: 10,
                                      elevation: -10)

        #expect(value.elevation == -10)
        #expect(value.id == "i1")
        #expect(value.midiBank == MXLMidi16384(uintValue: 100))
        #expect(value.midiChannel == MXLMidi16(uintValue: 1))
        #expect(value.midiName == "Violin")
        #expect(value.midiProgram == MXLMidi128(uintValue: 1))
        #expect(value.midiUnpitched == MXLMidi128(uintValue: 2))
        #expect(value.pan == 10)
        #expect(value.volume == 80)
    }
}
