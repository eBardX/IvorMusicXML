// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLyricTests {
}

// MARK: -

extension MXLLyricTests {
    @Test
    func equality() {
        #expect(MXLLyric(content: .humming, endsLine: false, endsParagraph: false) ==    // swiftlint:disable:this identical_operands
                 MXLLyric(content: .humming, endsLine: false, endsParagraph: false))
    }

    @Test
    func hashable() {
        let values: Set<MXLLyric> = [MXLLyric(content: .humming, endsLine: false, endsParagraph: false),
                                     MXLLyric(content: .humming, endsLine: false, endsParagraph: false),
                                     MXLLyric(content: .laughing, endsLine: false, endsParagraph: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLyric(content: .humming, endsLine: false, endsParagraph: false) !=
                 MXLLyric(content: .laughing, endsLine: false, endsParagraph: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLLyric(content: .humming, endsLine: false, endsParagraph: false)

        #expect(value.color == nil)
        #expect(value.content == .humming)
        #expect(value.endsLine == false)
        #expect(value.endsParagraph == false)
        #expect(value.footnote == nil)
        #expect(value.id == nil)
        #expect(value.justify == nil)
        #expect(value.level == nil)
        #expect(value.name == nil)
        #expect(value.number == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.timeOnly == nil)
    }

    @Test
    func init_explicitValues() {
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let value = MXLLyric(id: "l1",
                             content: .laughing,
                             endsLine: true,
                             endsParagraph: true,
                             footnote: footnote,
                             level: level,
                             number: "1",
                             name: "verse",
                             justify: .center,
                             position: MXLPosition(defaultX: 10),
                             placement: .below,
                             color: MXLColor(stringValue: "#800080"),
                             printsObject: false,
                             timeOnly: [1])

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == .laughing)
        #expect(value.endsLine == true)
        #expect(value.endsParagraph == true)
        #expect(value.footnote == footnote)
        #expect(value.id == "l1")
        #expect(value.justify == .center)
        #expect(value.level == level)
        #expect(value.name == "verse")
        #expect(value.number == "1")
        #expect(value.placement == .below)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.timeOnly == [1])
    }
}
