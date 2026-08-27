// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffSizeTests {
}

// MARK: -

extension MXLStaffSizeTests {
    @Test
    func equality() {
        #expect(MXLStaffSize(value: 80) == MXLStaffSize(value: 80))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStaffSize> = [MXLStaffSize(value: 80), MXLStaffSize(value: 80), MXLStaffSize(value: 100)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStaffSize(value: 80) != MXLStaffSize(value: 100))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStaffSize(value: 80)

        #expect(value.scaling == nil)
        #expect(value.value == 80)
    }

    @Test
    func init_explicitValues() {
        let value = MXLStaffSize(value: 80,
                                 scaling: 90)

        #expect(value.scaling == 90)
        #expect(value.value == 80)
    }
}
