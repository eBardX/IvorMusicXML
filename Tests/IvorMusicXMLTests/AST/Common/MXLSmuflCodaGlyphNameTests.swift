// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSmuflCodaGlyphNameTests {
}

// MARK: -

extension MXLSmuflCodaGlyphNameTests {
    @Test
    func equality() {
        #expect(MXLSmuflCodaGlyphName(stringValue: "coda") ==    // swiftlint:disable:this identical_operands
                 MXLSmuflCodaGlyphName(stringValue: "coda"))
    }

    @Test
    func inequality() {
        #expect(MXLSmuflCodaGlyphName(stringValue: "coda") != MXLSmuflCodaGlyphName(stringValue: "codaSquare"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLSmuflCodaGlyphName(stringValue: "segno") == nil)
        #expect(MXLSmuflCodaGlyphName(stringValue: "coda square") == nil)
    }

    @Test
    func initStringValue_valid() {
        let bare = MXLSmuflCodaGlyphName(stringValue: "coda")
        let suffixed = MXLSmuflCodaGlyphName(stringValue: "codaSquare")

        #expect(bare?.stringValue == "coda")
        #expect(suffixed?.stringValue == "codaSquare")
    }

    @Test
    func isValid() {
        #expect(MXLSmuflCodaGlyphName.isValid("coda"))
        #expect(MXLSmuflCodaGlyphName.isValid("codaSquare"))
        #expect(!MXLSmuflCodaGlyphName.isValid("segno"))
        #expect(!MXLSmuflCodaGlyphName.isValid("coda square"))
    }
}
