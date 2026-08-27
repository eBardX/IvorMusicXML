// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOtherPlacementTextTests {
}

// MARK: -

extension MXLOtherPlacementTextTests {
    @Test
    func equality() {
        #expect(MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle()) ==    // swiftlint:disable:this identical_operands
                 MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle()))
    }

    @Test
    func hashable() {
        let values: Set<MXLOtherPlacementText> = [MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle()),
                                                  MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle()),
                                                  MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle(), placement: .above)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle()) !=
                 MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle(), placement: .above))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOtherPlacementText(value: "custom", printStyle: MXLPrintStyle())

        #expect(value.placement == nil)
        #expect(value.printStyle == MXLPrintStyle())
        #expect(value.smufl == nil)
        #expect(value.value == "custom")
    }

    @Test
    func init_explicitValues() {
        let printStyle = MXLPrintStyle(color: MXLColor(stringValue: "#800080"))
        let smufl = MXLSmuflGlyphName(stringValue: "noteheadBlack")
        let value = MXLOtherPlacementText(value: "custom",
                                          printStyle: printStyle,
                                          placement: .above,
                                          smufl: smufl)

        #expect(value.placement == .above)
        #expect(value.printStyle == printStyle)
        #expect(value.smufl == smufl)
        #expect(value.value == "custom")
    }
}
