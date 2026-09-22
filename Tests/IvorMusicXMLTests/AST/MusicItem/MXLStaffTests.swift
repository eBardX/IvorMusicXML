// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffTests {
}

// MARK: -

extension MXLStaffTests {
    @Test
    func equality() {
        #expect(MXLStaff(uintValue: 1) == MXLStaff(uintValue: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLStaff(uintValue: 1) != MXLStaff(uintValue: 2))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLStaff(uintValue: 0) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLStaff(uintValue: 1)

        #expect(value?.uintValue == 1)
    }

    @Test
    func isValid() {
        #expect(MXLStaff.isValid(1))
        #expect(!MXLStaff.isValid(0))
    }
}
