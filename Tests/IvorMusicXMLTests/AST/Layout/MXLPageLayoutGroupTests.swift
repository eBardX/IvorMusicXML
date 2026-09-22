// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPageLayoutGroupTests {
}

// MARK: -

extension MXLPageLayoutGroupTests {
    @Test
    func equality() {
        #expect(MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200) ==    // swiftlint:disable:this identical_operands
                 MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200))
    }

    @Test
    func hashable() {
        let values: Set<MXLPageLayout.Group> = [MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200),
                                                MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200),
                                                MXLPageLayout.Group(pageHeight: 1_500, pageWidth: 1_100)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200) != MXLPageLayout.Group(pageHeight: 1_500, pageWidth: 1_100))
    }

    @Test
    func init_values() {
        let value = MXLPageLayout.Group(pageHeight: 1_600, pageWidth: 1_200)

        #expect(value.pageHeight == 1_600)
        #expect(value.pageWidth == 1_200)
    }
}
