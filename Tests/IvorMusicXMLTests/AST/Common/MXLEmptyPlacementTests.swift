// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEmptyPlacementTests {
}

// MARK: -

extension MXLEmptyPlacementTests {
    @Test
    func equality() {
        #expect(MXLEmptyPlacement(printStyle: MXLPrintStyle(), placement: .above) ==    // swiftlint:disable:this identical_operands
                 MXLEmptyPlacement(printStyle: MXLPrintStyle(), placement: .above))
    }

    @Test
    func hashable() {
        let values: Set<MXLEmptyPlacement> = [MXLEmptyPlacement(printStyle: MXLPrintStyle(), placement: .above),
                                              MXLEmptyPlacement(printStyle: MXLPrintStyle(), placement: .above),
                                              MXLEmptyPlacement(printStyle: MXLPrintStyle(), placement: .below)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEmptyPlacement(printStyle: MXLPrintStyle(), placement: .above) !=
                 MXLEmptyPlacement(printStyle: MXLPrintStyle(), placement: .below))
    }

    @Test
    func init_defaultValues() {
        let value = MXLEmptyPlacement(printStyle: MXLPrintStyle())

        #expect(value.placement == nil)
        #expect(value.printStyle == MXLPrintStyle())
    }

    @Test
    func init_explicitValues() {
        let printStyle = MXLPrintStyle(color: MXLColor(stringValue: "#800080"))
        let value = MXLEmptyPlacement(printStyle: printStyle,
                                      placement: .above)

        #expect(value.placement == .above)
        #expect(value.printStyle == printStyle)
    }
}
