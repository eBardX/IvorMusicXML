// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSmuflAccidentalGlyphNameTests {
}

// MARK: -

extension MXLSmuflAccidentalGlyphNameTests {
    @Test
    func equality() {
        #expect(MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat") ==    // swiftlint:disable:this identical_operands
                 MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat"))
    }

    @Test
    func inequality() {
        #expect(MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat") !=
                 MXLSmuflAccidentalGlyphName(stringValue: "accidentalSharp"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLSmuflAccidentalGlyphName(stringValue: "flat") == nil)
        #expect(MXLSmuflAccidentalGlyphName(stringValue: "acc") == nil)
    }

    @Test
    func initStringValue_valid() {
        let name = MXLSmuflAccidentalGlyphName(stringValue: "accidentalFlat")

        #expect(name?.stringValue == "accidentalFlat")
    }

    @Test
    func isValid() {
        #expect(MXLSmuflAccidentalGlyphName.isValid("accidentalFlat"))
        #expect(MXLSmuflAccidentalGlyphName.isValid("medRenFlaSoft"))
        #expect(!MXLSmuflAccidentalGlyphName.isValid("flat"))
        #expect(!MXLSmuflAccidentalGlyphName.isValid("acc"))
    }
}
