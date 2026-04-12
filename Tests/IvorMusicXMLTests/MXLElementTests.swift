// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLElementTests {
}

// MARK: -

extension MXLElementTests {
    @Test
    func test_description() {
        #expect(MXLElement.accent.description == "accent")
        #expect(MXLElement.clef.description == "clef")
    }

    @Test
    func test_equality() {
        #expect(MXLElement.note == .note)
        #expect(MXLElement.rest == .rest)
    }

    @Test
    func test_inequality() {
        #expect(MXLElement.note != .rest)
        #expect(MXLElement.pitch != .chord)
    }

    @Test
    func test_staticPropertyStringValues() {
        #expect(MXLElement.accidentalMark.description == "accidental-mark")
        #expect(MXLElement.accordionHigh.description == "accordion-high")
        #expect(MXLElement.scorePartwise.description == "score-partwise")
        #expect(MXLElement.scoreTimewise.description == "score-timewise")
    }

    @Test
    func test_stringRepresentable() {
        let elem = MXLElement("test-elem")

        #expect(elem.description == "test-elem")
    }
}
