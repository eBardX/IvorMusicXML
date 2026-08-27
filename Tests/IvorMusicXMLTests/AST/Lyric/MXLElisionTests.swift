// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLElisionTests {
}

// MARK: -

extension MXLElisionTests {
    @Test
    func equality() {
        #expect(MXLElision(value: "‿") == MXLElision(value: "‿"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLElision> = [MXLElision(value: "‿"), MXLElision(value: "‿"), MXLElision(value: "_")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLElision(value: "‿") != MXLElision(value: "_"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLElision(value: "‿")

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.smufl == nil)
        #expect(value.value == "‿")
    }

    @Test
    func init_explicitValues() {
        let value = MXLElision(value: "‿",
                               font: MXLFont(style: .italic),
                               color: MXLColor(stringValue: "#800080"),
                               smufl: MXLSmuflLyricsGlyphName(stringValue: "lyricsElisionNarrow"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.smufl == MXLSmuflLyricsGlyphName(stringValue: "lyricsElisionNarrow"))
        #expect(value.value == "‿")
    }
}
