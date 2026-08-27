// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTextElementDataTests {
}

// MARK: -

extension MXLTextElementDataTests {
    @Test
    func equality() {
        #expect(MXLTextElementData(value: "Allegro") == MXLTextElementData(value: "Allegro"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTextElementData> = [MXLTextElementData(value: "Allegro"),
                                               MXLTextElementData(value: "Allegro"),
                                               MXLTextElementData(value: "Adagio")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTextElementData(value: "Allegro") != MXLTextElementData(value: "Adagio"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTextElementData(value: "Allegro")

        #expect(value.color == nil)
        #expect(value.dir == .ltr)
        #expect(value.font == MXLFont())
        #expect(value.letterSpacing == .normal)
        #expect(value.lineThrough == nil)
        #expect(value.overline == nil)
        #expect(value.rotation == nil)
        #expect(value.underline == nil)
        #expect(value.value == "Allegro")
        #expect(value.xmlLang == nil)
    }

    @Test
    func init_explicitValues() {
        let font = MXLFont(style: .italic)
        let color = MXLColor(stringValue: "#800080")
        let value = MXLTextElementData(value: "Allegro",
                                       font: font,
                                       color: color,
                                       underline: MXLNumberOfLines(uintValue: 1),
                                       overline: MXLNumberOfLines(uintValue: 1),
                                       lineThrough: MXLNumberOfLines(uintValue: 1),
                                       rotation: 90,
                                       letterSpacing: .number(2),
                                       xmlLang: "en",
                                       dir: .rtl)

        #expect(value.color == color)
        #expect(value.dir == .rtl)
        #expect(value.font == font)
        #expect(value.letterSpacing == .number(2))
        #expect(value.lineThrough == MXLNumberOfLines(uintValue: 1))
        #expect(value.overline == MXLNumberOfLines(uintValue: 1))
        #expect(value.rotation == 90)
        #expect(value.underline == MXLNumberOfLines(uintValue: 1))
        #expect(value.value == "Allegro")
        #expect(value.xmlLang == "en")
    }
}
