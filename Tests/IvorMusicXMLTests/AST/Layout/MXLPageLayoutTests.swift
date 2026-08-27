// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPageLayoutTests {
}

// MARK: -

extension MXLPageLayoutTests {
    @Test
    func equality() {
        #expect(MXLPageLayout() == MXLPageLayout())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let group = MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200)
        let values: Set<MXLPageLayout> = [MXLPageLayout(), MXLPageLayout(), MXLPageLayout(group: group)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let group = MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200)

        #expect(MXLPageLayout() != MXLPageLayout(group: group))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPageLayout()

        #expect(value.group == nil)
        #expect(value.pageMargins.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let group = MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200)
        let allMargins = MXLAllMargins(leftRightMargins: MXLLeftRightMargins(leftMargin: 10, rightMargin: 10), topMargin: 5, bottomMargin: 5)
        let pageMargins = [MXLPageMargins(allMargins: allMargins)]
        let value = MXLPageLayout(group: group, pageMargins: pageMargins)

        #expect(value.group == group)
        #expect(value.pageMargins == pageMargins)
    }
}
