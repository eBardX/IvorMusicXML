// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLayoutTests {
}

// MARK: -

extension MXLLayoutTests {
    @Test
    func equality() {
        #expect(MXLLayout() == MXLLayout())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let staffLayout = [MXLStaffLayout(staffDistance: 65)]
        let values: Set<MXLLayout> = [MXLLayout(), MXLLayout(), MXLLayout(staffLayout: staffLayout)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let staffLayout = [MXLStaffLayout(staffDistance: 65)]

        #expect(MXLLayout() != MXLLayout(staffLayout: staffLayout))
    }

    @Test
    func init_defaultValues() {
        let value = MXLLayout()

        #expect(value.pageLayout == nil)
        #expect(value.staffLayout.isEmpty)
        #expect(value.systemLayout == nil)
    }

    @Test
    func init_explicitValues() {
        let pageLayout = MXLPageLayout()
        let systemLayout = MXLSystemLayout()
        let staffLayout = [MXLStaffLayout(staffDistance: 65)]
        let value = MXLLayout(pageLayout: pageLayout, systemLayout: systemLayout, staffLayout: staffLayout)

        #expect(value.pageLayout == pageLayout)
        #expect(value.staffLayout == staffLayout)
        #expect(value.systemLayout == systemLayout)
    }
}
