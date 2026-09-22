// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMidi128Tests {
}

// MARK: -

extension MXLMidi128Tests {
    @Test
    func equality() {
        #expect(MXLMidi128(uintValue: 64) == MXLMidi128(uintValue: 64))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLMidi128(uintValue: 64) != MXLMidi128(uintValue: 65))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLMidi128(uintValue: 0) == nil)
        #expect(MXLMidi128(uintValue: 129) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLMidi128(uintValue: 64)

        #expect(value?.uintValue == 64)
    }

    @Test
    func isValid() {
        #expect(MXLMidi128.isValid(1))
        #expect(MXLMidi128.isValid(128))
        #expect(!MXLMidi128.isValid(0))
        #expect(!MXLMidi128.isValid(129))
    }
}
