// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterLyricTests {
}

// MARK: -

extension MXLFormatterLyricTests {
    @Test
    func format_roundTripsLyricVariantsAndTextFormatting() throws {
        let underline: MXLNumberOfLines = 2
        let overline: MXLNumberOfLines = 1
        let text = MXLTextElementData(value: "oo",
                                      underline: underline,
                                      overline: overline,
                                      rotation: 45,
                                      letterSpacing: .number(2),
                                      dir: .rtl)
        let sung = MXLLyric(content: .syllabic(nil,
                                               text: text,
                                               group: [],
                                               extend: nil),
                            endsLine: false,
                            endsParagraph: true,
                            name: "chorus")
        let humming = MXLLyric(content: .humming,
                               endsLine: false,
                               endsParagraph: false)
        let laughing = MXLLyric(content: .laughing,
                                endsLine: false,
                                endsParagraph: false,
                                number: "2")
        let extended = MXLLyric(content: .extend(MXLExtend(kind: .stop)),
                                endsLine: false,
                                endsParagraph: false)

        try expectRoundTrip(lyric: [sung, humming, laughing, extended])
    }

    @Test
    func format_roundTripsSyllabicLyric() throws {
        let elision = MXLElision(value: "\u{203F}",
                                 smufl: "lyricsElisionDown")
        let groupHead = MXLLyric.Content.SyllabicGroup.Group(elision: elision,
                                                             syllabic: .middle)
        let group = MXLLyric.Content.SyllabicGroup(group: groupHead,
                                                   text: MXLTextElementData(value: "le"))
        let content = MXLLyric.Content.syllabic(.begin,
                                                text: MXLTextElementData(value: "Al"),
                                                group: [group],
                                                extend: MXLExtend(kind: .start))
        let lyric = MXLLyric(content: content,
                             endsLine: true,
                             endsParagraph: false,
                             number: "1",
                             placement: .below)

        try expectRoundTrip(lyric: [lyric])
    }
}
