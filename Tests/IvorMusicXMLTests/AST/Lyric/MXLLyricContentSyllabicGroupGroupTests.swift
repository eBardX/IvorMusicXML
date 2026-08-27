// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLyricContentSyllabicGroupGroupTests {
}

// MARK: -

extension MXLLyricContentSyllabicGroupGroupTests {
    @Test
    func equality() {
        let elision = MXLElision(value: "‿")

        #expect(MXLLyric.Content.SyllabicGroup.Group(elision: elision) ==    // swiftlint:disable:this identical_operands
                 MXLLyric.Content.SyllabicGroup.Group(elision: elision))
    }

    @Test
    func hashable() {
        let elision = MXLElision(value: "‿")
        let values: Set<MXLLyric.Content.SyllabicGroup.Group> = [MXLLyric.Content.SyllabicGroup.Group(elision: elision),
                                                                 MXLLyric.Content.SyllabicGroup.Group(elision: elision),
                                                                 MXLLyric.Content.SyllabicGroup.Group(elision: elision, syllabic: .begin)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let elision = MXLElision(value: "‿")

        #expect(MXLLyric.Content.SyllabicGroup.Group(elision: elision) !=
                 MXLLyric.Content.SyllabicGroup.Group(elision: elision, syllabic: .begin))
    }

    @Test
    func init_defaultValues() {
        let elision = MXLElision(value: "‿")
        let value = MXLLyric.Content.SyllabicGroup.Group(elision: elision)

        #expect(value.elision == elision)
        #expect(value.syllabic == nil)
    }

    @Test
    func init_explicitValues() {
        let elision = MXLElision(value: "‿")
        let value = MXLLyric.Content.SyllabicGroup.Group(elision: elision, syllabic: .begin)

        #expect(value.elision == elision)
        #expect(value.syllabic == .begin)
    }
}
