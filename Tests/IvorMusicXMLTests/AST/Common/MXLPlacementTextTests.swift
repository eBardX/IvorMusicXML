// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPlacementTextTests {
}

// MARK: -

extension MXLPlacementTextTests {
    @Test
    func equality() {
        #expect(MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle()) ==    // swiftlint:disable:this identical_operands
                 MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle()))
    }

    @Test
    func hashable() {
        let values: Set<MXLPlacementText> = [MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle()),
                                             MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle()),
                                             MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle(), placement: .above)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle()) !=
                 MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle(), placement: .above))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPlacementText(value: "rit.", printStyle: MXLPrintStyle())

        #expect(value.placement == nil)
        #expect(value.printStyle == MXLPrintStyle())
        #expect(value.value == "rit.")
    }

    @Test
    func init_explicitValues() {
        let printStyle = MXLPrintStyle(color: MXLColor(stringValue: "#800080"))
        let value = MXLPlacementText(value: "rit.",
                                     printStyle: printStyle,
                                     placement: .above)

        #expect(value.placement == .above)
        #expect(value.printStyle == printStyle)
        #expect(value.value == "rit.")
    }
}
