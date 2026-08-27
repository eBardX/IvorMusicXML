// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSmuflLyricsGlyphNameTests {
}

// MARK: -

extension MXLSmuflLyricsGlyphNameTests {
    @Test
    func equality() {
        #expect(MXLSmuflLyricsGlyphName(stringValue: "lyricsElisionNarrow") ==    // swiftlint:disable:this identical_operands
                 MXLSmuflLyricsGlyphName(stringValue: "lyricsElisionNarrow"))
    }

    @Test
    func inequality() {
        #expect(MXLSmuflLyricsGlyphName(stringValue: "lyricsElisionNarrow") !=
                 MXLSmuflLyricsGlyphName(stringValue: "lyricsElisionWide"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLSmuflLyricsGlyphName(stringValue: "elisionNarrow") == nil)
        #expect(MXLSmuflLyricsGlyphName(stringValue: "lyrics") == nil)
    }

    @Test
    func initStringValue_valid() {
        let name = MXLSmuflLyricsGlyphName(stringValue: "lyricsElisionNarrow")

        #expect(name?.stringValue == "lyricsElisionNarrow")
    }

    @Test
    func isValid() {
        #expect(MXLSmuflLyricsGlyphName.isValid("lyricsElisionNarrow"))
        #expect(!MXLSmuflLyricsGlyphName.isValid("elisionNarrow"))
        #expect(!MXLSmuflLyricsGlyphName.isValid("lyrics"))
    }
}
