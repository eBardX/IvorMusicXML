// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHandbellTests {
}

// MARK: -

extension MXLHandbellTests {
    @Test
    func equality() {
        #expect(MXLHandbell(value: .damp) == MXLHandbell(value: .damp))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHandbell> = [MXLHandbell(value: .damp), MXLHandbell(value: .damp), MXLHandbell(value: .echo)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHandbell(value: .damp) != MXLHandbell(value: .echo))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHandbell(value: .damp)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.value == .damp)
    }

    @Test
    func init_explicitValues() {
        let value = MXLHandbell(value: .echo,
                                position: MXLPosition(defaultX: 10),
                                font: MXLFont(style: .italic),
                                color: MXLColor(stringValue: "#800080"),
                                placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value == .echo)
    }
}
