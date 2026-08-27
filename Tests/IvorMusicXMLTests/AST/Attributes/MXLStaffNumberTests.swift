// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffNumberTests {
}

// MARK: -

extension MXLStaffNumberTests {
    @Test
    func equality() {
        #expect(MXLStaffNumber(uintValue: 2) == MXLStaffNumber(uintValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLStaffNumber(uintValue: 2) != MXLStaffNumber(uintValue: 3))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLStaffNumber(uintValue: 0) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLStaffNumber(uintValue: 2)

        #expect(value?.uintValue == 2)
    }

    @Test
    func isValid() {
        #expect(MXLStaffNumber.isValid(1))
        #expect(!MXLStaffNumber.isValid(0))
    }
}
