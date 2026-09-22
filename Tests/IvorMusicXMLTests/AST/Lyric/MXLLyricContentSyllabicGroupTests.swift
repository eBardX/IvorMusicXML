// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLyricContentSyllabicGroupTests {
}

// MARK: -

extension MXLLyricContentSyllabicGroupTests {
    @Test
    func equality() {
        let text = MXLTextElementData(value: "la")

        #expect(MXLLyric.Content.SyllabicGroup(text: text) == MXLLyric.Content.SyllabicGroup(text: text))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let text = MXLTextElementData(value: "la")
        let otherText = MXLTextElementData(value: "di")
        let values: Set<MXLLyric.Content.SyllabicGroup> = [MXLLyric.Content.SyllabicGroup(text: text),
                                                           MXLLyric.Content.SyllabicGroup(text: text),
                                                           MXLLyric.Content.SyllabicGroup(text: otherText)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let text = MXLTextElementData(value: "la")
        let otherText = MXLTextElementData(value: "di")

        #expect(MXLLyric.Content.SyllabicGroup(text: text) != MXLLyric.Content.SyllabicGroup(text: otherText))
    }

    @Test
    func init_defaultValues() {
        let text = MXLTextElementData(value: "la")
        let value = MXLLyric.Content.SyllabicGroup(text: text)

        #expect(value.group == nil)
        #expect(value.text == text)
    }

    @Test
    func init_explicitValues() {
        let text = MXLTextElementData(value: "la")
        let group = MXLLyric.Content.SyllabicGroup.Group(elision: MXLElision(value: "‿"))
        let value = MXLLyric.Content.SyllabicGroup(group: group, text: text)

        #expect(value.group == group)
        #expect(value.text == text)
    }
}
