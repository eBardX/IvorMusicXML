// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSystemDividersTests {
}

// MARK: -

extension MXLSystemDividersTests {
    @Test
    func equality() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let divider = MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign)

        #expect(MXLSystemDividers(leftDivider: divider, rightDivider: divider) ==    // swiftlint:disable:this identical_operands
                 MXLSystemDividers(leftDivider: divider, rightDivider: divider))
    }

    @Test
    func hashable() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let divider = MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign)
        let otherDivider = MXLEmptyPrintObjectStyleAlign(printsObject: false, printStyleAlign: printStyleAlign)
        let values: Set<MXLSystemDividers> = [MXLSystemDividers(leftDivider: divider, rightDivider: divider),
                                              MXLSystemDividers(leftDivider: divider, rightDivider: divider),
                                              MXLSystemDividers(leftDivider: otherDivider, rightDivider: divider)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let divider = MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign)
        let otherDivider = MXLEmptyPrintObjectStyleAlign(printsObject: false, printStyleAlign: printStyleAlign)

        #expect(MXLSystemDividers(leftDivider: divider, rightDivider: divider) !=
                 MXLSystemDividers(leftDivider: otherDivider, rightDivider: divider))
    }

    @Test
    func init_values() {
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let leftDivider = MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign)
        let rightDivider = MXLEmptyPrintObjectStyleAlign(printsObject: false, printStyleAlign: printStyleAlign)
        let value = MXLSystemDividers(leftDivider: leftDivider, rightDivider: rightDivider)

        #expect(value.leftDivider == leftDivider)
        #expect(value.rightDivider == rightDivider)
    }
}
