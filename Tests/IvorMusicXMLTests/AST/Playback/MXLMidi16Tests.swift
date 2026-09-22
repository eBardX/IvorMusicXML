// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMidi16Tests {
}

// MARK: -

extension MXLMidi16Tests {
    @Test
    func equality() {
        #expect(MXLMidi16(uintValue: 8) == MXLMidi16(uintValue: 8))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLMidi16(uintValue: 8) != MXLMidi16(uintValue: 9))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLMidi16(uintValue: 0) == nil)
        #expect(MXLMidi16(uintValue: 17) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLMidi16(uintValue: 8)

        #expect(value?.uintValue == 8)
    }

    @Test
    func isValid() {
        #expect(MXLMidi16.isValid(1))
        #expect(MXLMidi16.isValid(16))
        #expect(!MXLMidi16.isValid(0))
        #expect(!MXLMidi16.isValid(17))
    }
}
