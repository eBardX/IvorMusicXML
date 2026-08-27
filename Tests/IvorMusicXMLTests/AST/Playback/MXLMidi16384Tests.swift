// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMidi16384Tests {
}

// MARK: -

extension MXLMidi16384Tests {
    @Test
    func equality() {
        #expect(MXLMidi16384(uintValue: 100) == MXLMidi16384(uintValue: 100))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLMidi16384(uintValue: 100) != MXLMidi16384(uintValue: 101))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLMidi16384(uintValue: 0) == nil)
        #expect(MXLMidi16384(uintValue: 16_385) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLMidi16384(uintValue: 100)

        #expect(value?.uintValue == 100)
    }

    @Test
    func isValid() {
        #expect(MXLMidi16384.isValid(1))
        #expect(MXLMidi16384.isValid(16_384))
        #expect(!MXLMidi16384.isValid(0))
        #expect(!MXLMidi16384.isValid(16_385))
    }
}
