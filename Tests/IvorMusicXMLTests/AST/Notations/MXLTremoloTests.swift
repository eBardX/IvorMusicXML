// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTremoloTests {
}

// MARK: -

extension MXLTremoloTests {
    @Test
    func equality() {
        let value = MXLTremoloMarks(uintValue: 3)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLTremolo(value: value) == MXLTremolo(value: value))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let value = MXLTremoloMarks(uintValue: 3)!    // swiftlint:disable:this force_unwrapping
        let otherValue = MXLTremoloMarks(uintValue: 2)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLTremolo> = [MXLTremolo(value: value), MXLTremolo(value: value), MXLTremolo(value: otherValue)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let value = MXLTremoloMarks(uintValue: 3)!    // swiftlint:disable:this force_unwrapping
        let otherValue = MXLTremoloMarks(uintValue: 2)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLTremolo(value: value) != MXLTremolo(value: otherValue))
    }

    @Test
    func init_defaultValues() {
        let markValue = MXLTremoloMarks(uintValue: 3)!    // swiftlint:disable:this force_unwrapping
        let value = MXLTremolo(value: markValue)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.smufl == nil)
        #expect(value.kind == .single)
        #expect(value.value == markValue)
    }

    @Test
    func init_explicitValues() {
        let markValue = MXLTremoloMarks(uintValue: 2)!    // swiftlint:disable:this force_unwrapping
        let value = MXLTremolo(value: markValue,
                               kind: .start,
                               position: MXLPosition(defaultX: 10),
                               font: MXLFont(style: .italic),
                               color: MXLColor(stringValue: "#800080"),
                               placement: .above,
                               smufl: MXLSmuflGlyphName(stringValue: "buzzRoll"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.smufl == MXLSmuflGlyphName(stringValue: "buzzRoll"))
        #expect(value.kind == .start)
        #expect(value.value == markValue)
    }
}
