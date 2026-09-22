// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLElementNameTests {
}

// MARK: -

extension MXLElementNameTests {
    @Test
    func description() {
        #expect(MXLElementName.accent.description == "accent")
        #expect(MXLElementName.clef.description == "clef")
    }

    @Test
    func equality() {
        #expect(MXLElementName.note == .note)
        #expect(MXLElementName.rest == .rest)
    }

    @Test
    func inequality() {
        #expect(MXLElementName.note != .rest)
        #expect(MXLElementName.pitch != .chord)
    }

    @Test
    func staticPropertyStringValues() {
        #expect(MXLElementName.accidentalMark.description == "accidental-mark")
        #expect(MXLElementName.accordionHigh.description == "accordion-high")
        #expect(MXLElementName.scorePartwise.description == "score-partwise")
        #expect(MXLElementName.scoreTimewise.description == "score-timewise")
    }

    @Test
    func stringRepresentable() {
        let elem = MXLElementName("test-elem")

        #expect(elem.description == "test-elem")
    }
}
