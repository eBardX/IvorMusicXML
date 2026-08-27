// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSoundGroupTests {
}

// MARK: -

extension MXLSoundGroupTests {
    @Test
    func equality() {
        #expect(MXLSound.Group() == MXLSound.Group())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let instrumentChange = MXLInstrumentChange(id: "i1")
        let values: Set<MXLSound.Group> = [MXLSound.Group(), MXLSound.Group(), MXLSound.Group(instrumentChange: instrumentChange)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let instrumentChange = MXLInstrumentChange(id: "i1")

        #expect(MXLSound.Group() != MXLSound.Group(instrumentChange: instrumentChange))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSound.Group()

        #expect(value.instrumentChange == nil)
        #expect(value.midiDevice == nil)
        #expect(value.midiInstrument == nil)
        #expect(value.play == nil)
    }

    @Test
    func init_explicitValues() {
        let instrumentChange = MXLInstrumentChange(id: "i1")
        let midiDevice = MXLMidiDevice(value: "Port 1")
        let midiInstrument = MXLMidiInstrument(id: "i1")
        let play = MXLPlay()
        let value = MXLSound.Group(instrumentChange: instrumentChange, midiDevice: midiDevice, midiInstrument: midiInstrument, play: play)

        #expect(value.instrumentChange == instrumentChange)
        #expect(value.midiDevice == midiDevice)
        #expect(value.midiInstrument == midiInstrument)
        #expect(value.play == play)
    }
}
