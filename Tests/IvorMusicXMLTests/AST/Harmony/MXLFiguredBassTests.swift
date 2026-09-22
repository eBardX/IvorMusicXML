// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFiguredBassTests {
}

// MARK: -

extension MXLFiguredBassTests {
    @Test
    func equality() {
        #expect(MXLFiguredBass() == MXLFiguredBass())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFiguredBass> = [MXLFiguredBass(), MXLFiguredBass(), MXLFiguredBass(id: "fb2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFiguredBass() != MXLFiguredBass(id: "fb2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFiguredBass()

        #expect(value.color == nil)
        #expect(value.duration == nil)
        #expect(value.figure.isEmpty)
        #expect(value.font == MXLFont())
        #expect(value.footnote == nil)
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.level == nil)
        #expect(value.hasParentheses == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printout == MXLPrintout())
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let figure = [MXLFigure(number: MXLStyleText(value: "6", printStyle: MXLPrintStyle()))]
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let value = MXLFiguredBass(id: "fb1",
                                   figure: figure,
                                   duration: MXLPositiveDivisions(intValue: 4),
                                   footnote: footnote,
                                   level: level,
                                   position: MXLPosition(defaultX: 10),
                                   font: MXLFont(style: .italic),
                                   color: MXLColor(stringValue: "#800080"),
                                   halign: .center,
                                   valign: .middle,
                                   placement: .above,
                                   printout: MXLPrintout(printsObject: false),
                                   hasParentheses: true)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.duration == MXLPositiveDivisions(intValue: 4))
        #expect(value.figure == figure)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.footnote == footnote)
        #expect(value.halign == .center)
        #expect(value.id == "fb1")
        #expect(value.level == level)
        #expect(value.hasParentheses == true)
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printout == MXLPrintout(printsObject: false))
        #expect(value.valign == .middle)
    }
}
