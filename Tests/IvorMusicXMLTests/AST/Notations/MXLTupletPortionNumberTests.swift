// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTupletPortionNumberTests {
}

// MARK: -

extension MXLTupletPortionNumberTests {
    @Test
    func equality() {
        #expect(MXLTuplet.Portion.Number(value: 3) == MXLTuplet.Portion.Number(value: 3))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTuplet.Portion.Number> = [MXLTuplet.Portion.Number(value: 3),
                                                     MXLTuplet.Portion.Number(value: 3),
                                                     MXLTuplet.Portion.Number(value: 2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTuplet.Portion.Number(value: 3) != MXLTuplet.Portion.Number(value: 2))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTuplet.Portion.Number(value: 3)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.value == 3)
    }

    @Test
    func init_explicitValues() {
        let value = MXLTuplet.Portion.Number(value: 2, font: MXLFont(style: .italic), color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.value == 2)
    }
}
