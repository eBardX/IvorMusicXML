// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTupletPortionDotTests {
}

// MARK: -

extension MXLTupletPortionDotTests {
    @Test
    func equality() {
        #expect(MXLTuplet.Portion.Dot() == MXLTuplet.Portion.Dot())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTuplet.Portion.Dot> = [MXLTuplet.Portion.Dot(), MXLTuplet.Portion.Dot(), MXLTuplet.Portion.Dot(color: MXLColor(stringValue: "#800080"))]    // swiftlint:disable:this line_length

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTuplet.Portion.Dot() != MXLTuplet.Portion.Dot(color: MXLColor(stringValue: "#800080")))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTuplet.Portion.Dot()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
    }

    @Test
    func init_explicitValues() {
        let value = MXLTuplet.Portion.Dot(font: MXLFont(style: .italic), color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
    }
}
