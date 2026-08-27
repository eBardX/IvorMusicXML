// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAccidentalMarkTests {
}

// MARK: -

extension MXLAccidentalMarkTests {
    @Test
    func equality() {
        #expect(MXLAccidentalMark(value: .sharp) == MXLAccidentalMark(value: .sharp))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLAccidentalMark> = [MXLAccidentalMark(value: .sharp), MXLAccidentalMark(value: .sharp), MXLAccidentalMark(value: .flat)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLAccidentalMark(value: .sharp) != MXLAccidentalMark(value: .flat))
    }

    @Test
    func init_defaultValues() {
        let value = MXLAccidentalMark(value: .sharp)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.levelDisplay == MXLLevel.Display())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.smufl == nil)
        #expect(value.value == .sharp)
    }

    @Test
    func init_explicitValues() {
        let levelDisplay = MXLLevel.Display(hasParentheses: true)
        let value = MXLAccidentalMark(id: "am1",
                                      value: .flat,
                                      levelDisplay: levelDisplay,
                                      position: MXLPosition(defaultX: 10),
                                      font: MXLFont(style: .italic),
                                      color: MXLColor(stringValue: "#800080"),
                                      placement: .above,
                                      smufl: MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "am1")
        #expect(value.levelDisplay == levelDisplay)
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.smufl == MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat"))
        #expect(value.value == .flat)
    }
}
