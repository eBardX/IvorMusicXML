// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFigureTests {
}

// MARK: -

extension MXLFigureTests {
    @Test
    func equality() {
        #expect(MXLFigure() == MXLFigure())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let numberText = MXLStyleText(value: "6", printStyle: MXLPrintStyle())
        let values: Set<MXLFigure> = [MXLFigure(), MXLFigure(), MXLFigure(number: numberText)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let numberText = MXLStyleText(value: "6", printStyle: MXLPrintStyle())

        #expect(MXLFigure() != MXLFigure(number: numberText))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFigure()

        #expect(value.extend == nil)
        #expect(value.footnote == nil)
        #expect(value.level == nil)
        #expect(value.number == nil)
        #expect(value.prefix == nil)
        #expect(value.suffix == nil)
    }

    @Test
    func init_explicitValues() {
        let prefix = MXLStyleText(value: "#", printStyle: MXLPrintStyle())
        let number = MXLStyleText(value: "6", printStyle: MXLPrintStyle())
        let suffix = MXLStyleText(value: "+", printStyle: MXLPrintStyle())
        let extend = MXLExtend()
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let value = MXLFigure(prefix: prefix, number: number, suffix: suffix, extend: extend, footnote: footnote, level: level)

        #expect(value.extend == extend)
        #expect(value.footnote == footnote)
        #expect(value.level == level)
        #expect(value.number == number)
        #expect(value.prefix == prefix)
        #expect(value.suffix == suffix)
    }
}
