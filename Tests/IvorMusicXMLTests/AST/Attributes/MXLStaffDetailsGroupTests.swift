// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffDetailsGroupTests {
}

// MARK: -

extension MXLStaffDetailsGroupTests {
    @Test
    func equality() {
        #expect(MXLStaffDetails.Group(staffLines: 5) == MXLStaffDetails.Group(staffLines: 5))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStaffDetails.Group> = [MXLStaffDetails.Group(staffLines: 5),
                                                  MXLStaffDetails.Group(staffLines: 5),
                                                  MXLStaffDetails.Group(staffLines: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStaffDetails.Group(staffLines: 5) != MXLStaffDetails.Group(staffLines: 1))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStaffDetails.Group(staffLines: 5)

        #expect(value.lineDetail.isEmpty)
        #expect(value.staffLines == 5)
    }

    @Test
    func init_explicitValues() {
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping
        let lineDetail = [MXLLineDetail(line: line)]
        let value = MXLStaffDetails.Group(staffLines: 5,
                                          lineDetail: lineDetail)

        #expect(value.lineDetail == lineDetail)
        #expect(value.staffLines == 5)
    }
}
