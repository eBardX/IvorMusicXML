// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScorePartGroup2Tests {
}

// MARK: -

extension MXLScorePartGroup2Tests {
    @Test
    func equality() {
        #expect(MXLScorePart.Group2() == MXLScorePart.Group2())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let midiDevice = MXLMidiDevice(value: "Port 1")
        let values: Set<MXLScorePart.Group2> = [MXLScorePart.Group2(), MXLScorePart.Group2(), MXLScorePart.Group2(midiDevice: midiDevice)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let midiDevice = MXLMidiDevice(value: "Port 1")

        #expect(MXLScorePart.Group2() != MXLScorePart.Group2(midiDevice: midiDevice))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScorePart.Group2()

        #expect(value.midiDevice == nil)
        #expect(value.midiInstrument == nil)
    }

    @Test
    func init_explicitValues() {
        let midiDevice = MXLMidiDevice(value: "Port 1")
        let midiInstrument = MXLMidiInstrument(id: "i1")
        let value = MXLScorePart.Group2(midiDevice: midiDevice, midiInstrument: midiInstrument)

        #expect(value.midiDevice == midiDevice)
        #expect(value.midiInstrument == midiInstrument)
    }
}
