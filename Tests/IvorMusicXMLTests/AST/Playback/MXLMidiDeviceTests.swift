// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMidiDeviceTests {
}

// MARK: -

extension MXLMidiDeviceTests {
    @Test
    func equality() {
        #expect(MXLMidiDevice(value: "Port 1") == MXLMidiDevice(value: "Port 1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMidiDevice> = [MXLMidiDevice(value: "Port 1"), MXLMidiDevice(value: "Port 1"), MXLMidiDevice(value: "Port 2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMidiDevice(value: "Port 1") != MXLMidiDevice(value: "Port 2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMidiDevice(value: "Port 1")

        #expect(value.id == nil)
        #expect(value.port == nil)
        #expect(value.value == "Port 1")
    }

    @Test
    func init_explicitValues() {
        let value = MXLMidiDevice(id: "i1", value: "Port 1", port: MXLMidi16(uintValue: 2))

        #expect(value.id == "i1")
        #expect(value.port == MXLMidi16(uintValue: 2))
        #expect(value.value == "Port 1")
    }
}
