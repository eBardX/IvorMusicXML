// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffLineTests {
}

// MARK: -

extension MXLStaffLineTests {
    @Test
    func equality() {
        #expect(MXLStaffLine(uintValue: 3) == MXLStaffLine(uintValue: 3))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLStaffLine(uintValue: 3) != MXLStaffLine(uintValue: 4))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLStaffLine(uintValue: 0) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLStaffLine(uintValue: 3)

        #expect(value?.uintValue == 3)
    }

    @Test
    func isValid() {
        #expect(MXLStaffLine.isValid(1))
        #expect(!MXLStaffLine.isValid(0))
    }
}
