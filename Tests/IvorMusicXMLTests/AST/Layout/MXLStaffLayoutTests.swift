// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffLayoutTests {
}

// MARK: -

extension MXLStaffLayoutTests {
    @Test
    func equality() {
        #expect(MXLStaffLayout() == MXLStaffLayout())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStaffLayout> = [MXLStaffLayout(), MXLStaffLayout(), MXLStaffLayout(staffDistance: 65)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStaffLayout() != MXLStaffLayout(staffDistance: 65))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStaffLayout()

        #expect(value.number == nil)
        #expect(value.staffDistance == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLStaffLayout(staffDistance: 65, number: MXLStaffNumber(uintValue: 2))

        #expect(value.number == MXLStaffNumber(uintValue: 2))
        #expect(value.staffDistance == 65)
    }
}
