// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStringNumberTests {
}

// MARK: -

extension MXLStringNumberTests {
    @Test
    func equality() {
        #expect(MXLStringNumber(uintValue: 1) == MXLStringNumber(uintValue: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLStringNumber(uintValue: 1) != MXLStringNumber(uintValue: 2))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLStringNumber(uintValue: 0) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLStringNumber(uintValue: 1)

        #expect(value?.uintValue == 1)
    }

    @Test
    func isValid() {
        #expect(MXLStringNumber.isValid(1))
        #expect(!MXLStringNumber.isValid(0))
    }
}
