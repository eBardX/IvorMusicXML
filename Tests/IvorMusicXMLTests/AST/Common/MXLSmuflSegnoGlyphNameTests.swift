// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSmuflSegnoGlyphNameTests {
}

// MARK: -

extension MXLSmuflSegnoGlyphNameTests {
    @Test
    func equality() {
        #expect(MXLSmuflSegnoGlyphName(stringValue: "segno") ==    // swiftlint:disable:this identical_operands
                 MXLSmuflSegnoGlyphName(stringValue: "segno"))
    }

    @Test
    func inequality() {
        #expect(MXLSmuflSegnoGlyphName(stringValue: "segno") != MXLSmuflSegnoGlyphName(stringValue: "segnoSerpent1"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLSmuflSegnoGlyphName(stringValue: "coda") == nil)
        #expect(MXLSmuflSegnoGlyphName(stringValue: "segno serpent") == nil)
    }

    @Test
    func initStringValue_valid() {
        let bare = MXLSmuflSegnoGlyphName(stringValue: "segno")
        let suffixed = MXLSmuflSegnoGlyphName(stringValue: "segnoSerpent1")

        #expect(bare?.stringValue == "segno")
        #expect(suffixed?.stringValue == "segnoSerpent1")
    }

    @Test
    func isValid() {
        #expect(MXLSmuflSegnoGlyphName.isValid("segno"))
        #expect(MXLSmuflSegnoGlyphName.isValid("segnoSerpent1"))
        #expect(!MXLSmuflSegnoGlyphName.isValid("coda"))
        #expect(!MXLSmuflSegnoGlyphName.isValid("segno serpent"))
    }
}
