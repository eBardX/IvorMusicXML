// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAppearanceTests {
}

// MARK: -

extension MXLAppearanceTests {
    @Test
    func equality() {
        #expect(MXLAppearance() == MXLAppearance())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let lineWidth = [MXLLineWidth(value: 1, kind: "beam")]
        let values: Set<MXLAppearance> = [MXLAppearance(), MXLAppearance(), MXLAppearance(lineWidth: lineWidth)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let lineWidth = [MXLLineWidth(value: 1, kind: "beam")]

        #expect(MXLAppearance() != MXLAppearance(lineWidth: lineWidth))
    }

    @Test
    func init_defaultValues() {
        let value = MXLAppearance()

        #expect(value.distance.isEmpty)
        #expect(value.glyph.isEmpty)
        #expect(value.lineWidth.isEmpty)
        #expect(value.noteSize.isEmpty)
        #expect(value.otherAppearance.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let lineWidth = [MXLLineWidth(value: 1, kind: "beam")]
        let noteSize = [MXLNoteSize(value: 60, kind: .cue)]
        let distance = [MXLDistance(value: 8, kind: "hyphen")]
        let glyph = [MXLGlyph(value: "restQuarter", kind: "quarter-rest")]
        let otherAppearance = [MXLOtherAppearance(value: "1", kind: "other")]
        let value = MXLAppearance(lineWidth: lineWidth, noteSize: noteSize, distance: distance, glyph: glyph, otherAppearance: otherAppearance)

        #expect(value.distance == distance)
        #expect(value.glyph == glyph)
        #expect(value.lineWidth == lineWidth)
        #expect(value.noteSize == noteSize)
        #expect(value.otherAppearance == otherAppearance)
    }
}
