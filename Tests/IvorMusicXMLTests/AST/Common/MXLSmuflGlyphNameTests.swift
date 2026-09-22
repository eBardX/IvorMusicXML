// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSmuflGlyphNameTests {
}

// MARK: -

extension MXLSmuflGlyphNameTests {
    @Test
    func equality() {
        #expect(MXLSmuflGlyphName(stringValue: "noteheadBlack") ==    // swiftlint:disable:this identical_operands
                 MXLSmuflGlyphName(stringValue: "noteheadBlack"))
    }

    @Test
    func inequality() {
        #expect(MXLSmuflGlyphName(stringValue: "noteheadBlack") != MXLSmuflGlyphName(stringValue: "noteheadHalf"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLSmuflGlyphName(stringValue: "") == nil)
        #expect(MXLSmuflGlyphName(stringValue: "note head") == nil)
    }

    @Test
    func initStringValue_valid() {
        let name = MXLSmuflGlyphName(stringValue: "noteheadBlack")

        #expect(name?.stringValue == "noteheadBlack")
    }

    @Test
    func isValid() {
        #expect(MXLSmuflGlyphName.isValid("noteheadBlack"))
        #expect(MXLSmuflGlyphName.isValid("note-head_1.2:3"))
        #expect(!MXLSmuflGlyphName.isValid(""))
        #expect(!MXLSmuflGlyphName.isValid("note head"))
    }
}
