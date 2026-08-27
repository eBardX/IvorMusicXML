// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTupletPortionKindTests {
}

// MARK: -

extension MXLTupletPortionKindTests {
    @Test
    func equality() {
        #expect(MXLTuplet.Portion.Kind(value: .quarter) == MXLTuplet.Portion.Kind(value: .quarter))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTuplet.Portion.Kind> = [MXLTuplet.Portion.Kind(value: .quarter),
                                                   MXLTuplet.Portion.Kind(value: .quarter),
                                                   MXLTuplet.Portion.Kind(value: .eighth)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTuplet.Portion.Kind(value: .quarter) != MXLTuplet.Portion.Kind(value: .eighth))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTuplet.Portion.Kind(value: .quarter)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.value == .quarter)
    }

    @Test
    func init_explicitValues() {
        let value = MXLTuplet.Portion.Kind(value: .eighth, font: MXLFont(style: .italic), color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.value == .eighth)
    }
}
