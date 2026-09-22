// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGlyphTests {
}

// MARK: -

extension MXLGlyphTests {
    @Test
    func equality() {
        #expect(MXLGlyph(value: "restQuarter", kind: "quarter-rest") ==    // swiftlint:disable:this identical_operands
                 MXLGlyph(value: "restQuarter", kind: "quarter-rest"))
    }

    @Test
    func hashable() {
        let values: Set<MXLGlyph> = [MXLGlyph(value: "restQuarter", kind: "quarter-rest"),
                                     MXLGlyph(value: "restQuarter", kind: "quarter-rest"),
                                     MXLGlyph(value: "cClef", kind: "c-clef")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGlyph(value: "restQuarter", kind: "quarter-rest") != MXLGlyph(value: "cClef", kind: "c-clef"))
    }

    @Test
    func init_values() {
        let value = MXLGlyph(value: "restQuarter", kind: "quarter-rest")

        #expect(value.kind == "quarter-rest")
        #expect(value.value == "restQuarter")
    }
}
