// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFormattedTextIDTests {
}

// MARK: -

extension MXLFormattedTextIDTests {
    @Test
    func equality() {
        #expect(MXLFormattedTextID(value: "Allegro") == MXLFormattedTextID(value: "Allegro"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFormattedTextID> = [MXLFormattedTextID(value: "Allegro"),
                                               MXLFormattedTextID(value: "Allegro"),
                                               MXLFormattedTextID(id: "id1", value: "Allegro")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFormattedTextID(value: "Allegro") != MXLFormattedTextID(id: "id1", value: "Allegro"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFormattedTextID(value: "Allegro")

        #expect(value.color == nil)
        #expect(value.dir == .ltr)
        #expect(value.enclosure == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.justify == nil)
        #expect(value.letterSpacing == .normal)
        #expect(value.lineHeight == .normal)
        #expect(value.lineThrough == nil)
        #expect(value.overline == nil)
        #expect(value.position == MXLPosition())
        #expect(value.rotation == nil)
        #expect(value.underline == nil)
        #expect(value.valign == nil)
        #expect(value.value == "Allegro")
        #expect(value.xmlLang == nil)
        #expect(value.xmlSpace == nil)
    }

    @Test
    func init_explicitValues() {
        let position = MXLPosition(defaultX: 10)
        let font = MXLFont(style: .italic)
        let color = MXLColor(stringValue: "#800080")
        let value = MXLFormattedTextID(id: "id1",
                                       value: "Allegro",
                                       justify: .center,
                                       position: position,
                                       font: font,
                                       color: color,
                                       halign: .center,
                                       valign: .middle,
                                       underline: MXLNumberOfLines(uintValue: 1),
                                       overline: MXLNumberOfLines(uintValue: 1),
                                       lineThrough: MXLNumberOfLines(uintValue: 1),
                                       rotation: 90,
                                       letterSpacing: .number(2),
                                       lineHeight: .number(120),
                                       xmlLang: "en",
                                       xmlSpace: .preserve,
                                       dir: .rtl,
                                       enclosure: .circle)

        #expect(value.color == color)
        #expect(value.dir == .rtl)
        #expect(value.enclosure == .circle)
        #expect(value.font == font)
        #expect(value.halign == .center)
        #expect(value.id == "id1")
        #expect(value.justify == .center)
        #expect(value.letterSpacing == .number(2))
        #expect(value.lineHeight == .number(120))
        #expect(value.lineThrough == MXLNumberOfLines(uintValue: 1))
        #expect(value.overline == MXLNumberOfLines(uintValue: 1))
        #expect(value.position == position)
        #expect(value.rotation == 90)
        #expect(value.underline == MXLNumberOfLines(uintValue: 1))
        #expect(value.valign == .middle)
        #expect(value.value == "Allegro")
        #expect(value.xmlLang == "en")
        #expect(value.xmlSpace == .preserve)
    }
}
