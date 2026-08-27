// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEmptyPrintStyleAlignIDTests {
}

// MARK: -

extension MXLEmptyPrintStyleAlignIDTests {
    @Test
    func equality() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())

        #expect(MXLEmptyPrintStyleAlignID(printStyleAlign: printStyleAlign) ==    // swiftlint:disable:this identical_operands
                 MXLEmptyPrintStyleAlignID(printStyleAlign: printStyleAlign))
    }

    @Test
    func hashable() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let values: Set<MXLEmptyPrintStyleAlignID> = [MXLEmptyPrintStyleAlignID(printStyleAlign: printStyleAlign),
                                                      MXLEmptyPrintStyleAlignID(printStyleAlign: printStyleAlign),
                                                      MXLEmptyPrintStyleAlignID(id: "id1", printStyleAlign: printStyleAlign)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())

        #expect(MXLEmptyPrintStyleAlignID(printStyleAlign: printStyleAlign) !=
                 MXLEmptyPrintStyleAlignID(id: "id1", printStyleAlign: printStyleAlign))
    }

    @Test
    func init_defaultValues() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let value = MXLEmptyPrintStyleAlignID(printStyleAlign: printStyleAlign)

        #expect(value.id == nil)
        #expect(value.printStyleAlign == printStyleAlign)
    }

    @Test
    func init_explicitValues() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let value = MXLEmptyPrintStyleAlignID(id: "id1",
                                              printStyleAlign: printStyleAlign)

        #expect(value.id == "id1")
        #expect(value.printStyleAlign == printStyleAlign)
    }
}
