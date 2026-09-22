// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStyleTextTests {
}

// MARK: -

extension MXLStyleTextTests {
    @Test
    func equality() {
        #expect(MXLStyleText(value: "Allegro", printStyle: MXLPrintStyle()) ==    // swiftlint:disable:this identical_operands
                 MXLStyleText(value: "Allegro", printStyle: MXLPrintStyle()))
    }

    @Test
    func hashable() {
        let values: Set<MXLStyleText> = [MXLStyleText(value: "Allegro", printStyle: MXLPrintStyle()),
                                         MXLStyleText(value: "Allegro", printStyle: MXLPrintStyle()),
                                         MXLStyleText(value: "Adagio", printStyle: MXLPrintStyle())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStyleText(value: "Allegro", printStyle: MXLPrintStyle()) !=
                 MXLStyleText(value: "Adagio", printStyle: MXLPrintStyle()))
    }

    @Test
    func init_explicitValues() {
        let printStyle = MXLPrintStyle(color: MXLColor(stringValue: "#800080"))
        let value = MXLStyleText(value: "Allegro",
                                 printStyle: printStyle)

        #expect(value.printStyle == printStyle)
        #expect(value.value == "Allegro")
    }
}
