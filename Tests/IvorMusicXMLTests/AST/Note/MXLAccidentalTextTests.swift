// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAccidentalTextTests {
}

// MARK: -

extension MXLAccidentalTextTests {
    @Test
    func equality() {
        #expect(MXLAccidentalText(value: .sharp) == MXLAccidentalText(value: .sharp))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLAccidentalText> = [MXLAccidentalText(value: .sharp), MXLAccidentalText(value: .sharp), MXLAccidentalText(value: .flat)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLAccidentalText(value: .sharp) != MXLAccidentalText(value: .flat))
    }

    @Test
    func init_defaultValues() {
        let value = MXLAccidentalText(value: .sharp)

        #expect(value.color == nil)
        #expect(value.dir == .ltr)
        #expect(value.enclosure == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.justify == nil)
        #expect(value.letterSpacing == .normal)
        #expect(value.lineHeight == .normal)
        #expect(value.lineThrough == nil)
        #expect(value.overline == nil)
        #expect(value.position == MXLPosition())
        #expect(value.rotation == nil)
        #expect(value.smufl == nil)
        #expect(value.underline == nil)
        #expect(value.valign == nil)
        #expect(value.value == .sharp)
        #expect(value.xmlLang == nil)
        #expect(value.xmlSpace == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLAccidentalText(value: .flat,
                                      justify: .center,
                                      position: MXLPosition(defaultX: 10),
                                      font: MXLFont(style: .italic),
                                      color: MXLColor(stringValue: "#800080"),
                                      halign: .center,
                                      valign: .middle,
                                      underline: MXLNumberOfLines(uintValue: 1),
                                      overline: MXLNumberOfLines(uintValue: 2),
                                      lineThrough: MXLNumberOfLines(uintValue: 3),
                                      rotation: 45,
                                      letterSpacing: .number(2),
                                      lineHeight: .number(110),
                                      xmlLang: "en",
                                      xmlSpace: .preserve,
                                      dir: .rtl,
                                      enclosure: .circle,
                                      smufl: MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dir == .rtl)
        #expect(value.enclosure == .circle)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.justify == .center)
        #expect(value.letterSpacing == .number(2))
        #expect(value.lineHeight == .number(110))
        #expect(value.lineThrough == MXLNumberOfLines(uintValue: 3))
        #expect(value.overline == MXLNumberOfLines(uintValue: 2))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.rotation == 45)
        #expect(value.smufl == MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat"))
        #expect(value.underline == MXLNumberOfLines(uintValue: 1))
        #expect(value.valign == .middle)
        #expect(value.value == .flat)
        #expect(value.xmlLang == "en")
        #expect(value.xmlSpace == .preserve)
    }
}
