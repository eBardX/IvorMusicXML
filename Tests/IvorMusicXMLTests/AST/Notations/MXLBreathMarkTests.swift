// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBreathMarkTests {
}

// MARK: -

extension MXLBreathMarkTests {
    @Test
    func equality() {
        #expect(MXLBreathMark(value: .comma) == MXLBreathMark(value: .comma))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBreathMark> = [MXLBreathMark(value: .comma), MXLBreathMark(value: .comma), MXLBreathMark(value: .tick)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBreathMark(value: .comma) != MXLBreathMark(value: .tick))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBreathMark(value: .comma)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.value == .comma)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBreathMark(value: .tick,
                                  position: MXLPosition(defaultX: 10),
                                  font: MXLFont(style: .italic),
                                  color: MXLColor(stringValue: "#800080"),
                                  placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value == .tick)
    }
}
