// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAccidentalTests {
}

// MARK: -

extension MXLAccidentalTests {
    @Test
    func equality() {
        #expect(MXLAccidental(value: .sharp) == MXLAccidental(value: .sharp))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLAccidental> = [MXLAccidental(value: .sharp), MXLAccidental(value: .sharp), MXLAccidental(value: .flat)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLAccidental(value: .sharp) != MXLAccidental(value: .flat))
    }

    @Test
    func init_defaultValues() {
        let value = MXLAccidental(value: .sharp)

        #expect(value.isCautionary == nil)
        #expect(value.color == nil)
        #expect(value.isEditorial == nil)
        #expect(value.font == MXLFont())
        #expect(value.levelDisplay == MXLLevel.Display())
        #expect(value.position == MXLPosition())
        #expect(value.smufl == nil)
        #expect(value.value == .sharp)
    }

    @Test
    func init_explicitValues() {
        let levelDisplay = MXLLevel.Display(hasParentheses: true)
        let value = MXLAccidental(value: .flat,
                                  isCautionary: true,
                                  isEditorial: true,
                                  levelDisplay: levelDisplay,
                                  position: MXLPosition(defaultX: 10),
                                  font: MXLFont(style: .italic),
                                  color: MXLColor(stringValue: "#800080"),
                                  smufl: MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat"))

        #expect(value.isCautionary == true)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.isEditorial == true)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.levelDisplay == levelDisplay)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.smufl == MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat"))
        #expect(value.value == .flat)
    }
}
