// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPrintStyleAlignTests {
}

// MARK: -

extension MXLPrintStyleAlignTests {
    @Test
    func equality() {
        #expect(MXLPrintStyleAlign(printStyle: MXLPrintStyle(), halign: .center) ==    // swiftlint:disable:this identical_operands
                 MXLPrintStyleAlign(printStyle: MXLPrintStyle(), halign: .center))
    }

    @Test
    func hashable() {
        let values: Set<MXLPrintStyleAlign> = [MXLPrintStyleAlign(printStyle: MXLPrintStyle(), halign: .center),
                                               MXLPrintStyleAlign(printStyle: MXLPrintStyle(), halign: .center),
                                               MXLPrintStyleAlign(printStyle: MXLPrintStyle())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPrintStyleAlign(printStyle: MXLPrintStyle(), halign: .center) !=
                 MXLPrintStyleAlign(printStyle: MXLPrintStyle()))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPrintStyleAlign(printStyle: MXLPrintStyle())

        #expect(value.halign == nil)
        #expect(value.printStyle == MXLPrintStyle())
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let printStyle = MXLPrintStyle(color: MXLColor(stringValue: "#800080"))
        let value = MXLPrintStyleAlign(printStyle: printStyle,
                                       halign: .center,
                                       valign: .middle)

        #expect(value.halign == .center)
        #expect(value.printStyle == printStyle)
        #expect(value.valign == .middle)
    }
}
