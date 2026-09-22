// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffLinePositionTests {
}

// MARK: -

extension MXLStaffLinePositionTests {
    @Test
    func equality() {
        #expect(MXLStaffLinePosition(intValue: 2) == MXLStaffLinePosition(intValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLStaffLinePosition(intValue: 2) != MXLStaffLinePosition(intValue: -2))
    }

    @Test
    func initIntValue_negative() {
        let value = MXLStaffLinePosition(intValue: -2)

        #expect(value?.intValue == -2)
    }

    @Test
    func initIntValue_positive() {
        let value = MXLStaffLinePosition(intValue: 2)

        #expect(value?.intValue == 2)
    }
}
