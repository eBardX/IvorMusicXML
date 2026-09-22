// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSmuflPictogramGlyphNameTests {
}

// MARK: -

extension MXLSmuflPictogramGlyphNameTests {
    @Test
    func equality() {
        #expect(MXLSmuflPictogramGlyphName(stringValue: "pictAgogo") ==    // swiftlint:disable:this identical_operands
                 MXLSmuflPictogramGlyphName(stringValue: "pictAgogo"))
    }

    @Test
    func inequality() {
        #expect(MXLSmuflPictogramGlyphName(stringValue: "pictAgogo") !=
                 MXLSmuflPictogramGlyphName(stringValue: "pictAnvil"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLSmuflPictogramGlyphName(stringValue: "agogo") == nil)
        #expect(MXLSmuflPictogramGlyphName(stringValue: "pict") == nil)
    }

    @Test
    func initStringValue_valid() {
        let name = MXLSmuflPictogramGlyphName(stringValue: "pictAgogo")

        #expect(name?.stringValue == "pictAgogo")
    }

    @Test
    func isValid() {
        #expect(MXLSmuflPictogramGlyphName.isValid("pictAgogo"))
        #expect(!MXLSmuflPictogramGlyphName.isValid("agogo"))
        #expect(!MXLSmuflPictogramGlyphName.isValid("pict"))
    }
}
