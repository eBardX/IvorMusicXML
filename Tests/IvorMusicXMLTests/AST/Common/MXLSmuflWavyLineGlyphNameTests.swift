// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSmuflWavyLineGlyphNameTests {
}

// MARK: -

extension MXLSmuflWavyLineGlyphNameTests {
    @Test
    func equality() {
        #expect(MXLSmuflWavyLineGlyphName(stringValue: "wiggleTrill") ==    // swiftlint:disable:this identical_operands
                 MXLSmuflWavyLineGlyphName(stringValue: "wiggleTrill"))
    }

    @Test
    func inequality() {
        #expect(MXLSmuflWavyLineGlyphName(stringValue: "wiggleTrill") !=
                 MXLSmuflWavyLineGlyphName(stringValue: "guitarVibratoStroke"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLSmuflWavyLineGlyphName(stringValue: "trill") == nil)
        #expect(MXLSmuflWavyLineGlyphName(stringValue: "wiggle") == nil)
        #expect(MXLSmuflWavyLineGlyphName(stringValue: "guitarStroke") == nil)
    }

    @Test
    func initStringValue_valid() {
        let wiggle = MXLSmuflWavyLineGlyphName(stringValue: "wiggleTrill")
        let guitar = MXLSmuflWavyLineGlyphName(stringValue: "guitarVibratoStroke")

        #expect(wiggle?.stringValue == "wiggleTrill")
        #expect(guitar?.stringValue == "guitarVibratoStroke")
    }

    @Test
    func isValid() {
        #expect(MXLSmuflWavyLineGlyphName.isValid("wiggleTrill"))
        #expect(MXLSmuflWavyLineGlyphName.isValid("guitarVibratoStroke"))
        #expect(!MXLSmuflWavyLineGlyphName.isValid("trill"))
        #expect(!MXLSmuflWavyLineGlyphName.isValid("wiggle"))
        #expect(!MXLSmuflWavyLineGlyphName.isValid("guitarStroke"))
    }
}
