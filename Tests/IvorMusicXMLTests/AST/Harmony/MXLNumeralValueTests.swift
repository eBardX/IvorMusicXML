// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumeralValueTests {
}

// MARK: -

extension MXLNumeralValueTests {
    @Test
    func equality() {
        #expect(MXLNumeral.Value(uintValue: 5) == MXLNumeral.Value(uintValue: 5))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLNumeral.Value(uintValue: 5) != MXLNumeral.Value(uintValue: 2))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLNumeral.Value(uintValue: 0) == nil)
        #expect(MXLNumeral.Value(uintValue: 8) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLNumeral.Value(uintValue: 5)

        #expect(value?.uintValue == 5)
    }

    @Test
    func isValid() {
        #expect(MXLNumeral.Value.isValid(1))
        #expect(MXLNumeral.Value.isValid(7))
        #expect(!MXLNumeral.Value.isValid(0))
        #expect(!MXLNumeral.Value.isValid(8))
    }
}
