// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEmptyPrintObjectStyleAlignTests {
}

// MARK: -

extension MXLEmptyPrintObjectStyleAlignTests {
    @Test
    func equality() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())

        #expect(MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign) ==    // swiftlint:disable:this identical_operands
                 MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign))
    }

    @Test
    func hashable() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let values: Set<MXLEmptyPrintObjectStyleAlign> = [MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign),
                                                          MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign),
                                                          MXLEmptyPrintObjectStyleAlign(printsObject: false,
                                                                                        printStyleAlign: printStyleAlign)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())

        #expect(MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign) !=
                 MXLEmptyPrintObjectStyleAlign(printsObject: false, printStyleAlign: printStyleAlign))
    }

    @Test
    func init_defaultValues() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let value = MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign)

        #expect(value.printsObject == nil)
        #expect(value.printStyleAlign == printStyleAlign)
    }

    @Test
    func init_explicitValues() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let value = MXLEmptyPrintObjectStyleAlign(printsObject: false,
                                                  printStyleAlign: printStyleAlign)

        #expect(value.printsObject == false)
        #expect(value.printStyleAlign == printStyleAlign)
    }
}
