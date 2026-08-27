// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPrintAttributesTests {
}

// MARK: -

extension MXLPrintAttributesTests {
    @Test
    func equality() {
        #expect(MXLPrint.Attributes() == MXLPrint.Attributes())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPrint.Attributes> = [MXLPrint.Attributes(), MXLPrint.Attributes(), MXLPrint.Attributes(startsNewSystem: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPrint.Attributes() != MXLPrint.Attributes(startsNewSystem: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPrint.Attributes()

        #expect(value.blankPage == nil)
        #expect(value.startsNewPage == nil)
        #expect(value.startsNewSystem == nil)
        #expect(value.pageNumber == nil)
        #expect(value.staffSpacing == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLPrint.Attributes(staffSpacing: 12,
                                        startsNewSystem: true,
                                        startsNewPage: true,
                                        blankPage: 1,
                                        pageNumber: "5")

        #expect(value.blankPage == 1)
        #expect(value.startsNewPage == true)
        #expect(value.startsNewSystem == true)
        #expect(value.pageNumber == "5")
        #expect(value.staffSpacing == 12)
    }
}
