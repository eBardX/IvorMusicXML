// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFormattedSymbolIDTests {
}

// MARK: -

extension MXLFormattedSymbolIDTests {
    @Test
    func equality() {
        #expect(MXLFormattedSymbolID(value: "noteheadBlack") ==    // swiftlint:disable:this identical_operands
                 MXLFormattedSymbolID(value: "noteheadBlack"))
    }

    @Test
    func hashable() {
        let values: Set<MXLFormattedSymbolID> = [MXLFormattedSymbolID(value: "noteheadBlack"),
                                                 MXLFormattedSymbolID(value: "noteheadBlack"),
                                                 MXLFormattedSymbolID(id: "id1", value: "noteheadBlack")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFormattedSymbolID(value: "noteheadBlack") !=
                 MXLFormattedSymbolID(id: "id1", value: "noteheadBlack"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFormattedSymbolID(value: "noteheadBlack")

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
        #expect(value.value == "noteheadBlack")
    }

    @Test
    func init_explicitValues() {
        let position = MXLPosition(defaultX: 10)
        let font = MXLFont(style: .italic)
        let color = MXLColor(stringValue: "#800080")
        let value = MXLFormattedSymbolID(id: "id1",
                                         value: "noteheadBlack",
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
        #expect(value.value == "noteheadBlack")
    }
}
