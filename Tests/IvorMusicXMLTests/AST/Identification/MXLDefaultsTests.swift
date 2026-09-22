// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDefaultsTests {
}

// MARK: -

extension MXLDefaultsTests {
    @Test
    func equality() {
        #expect(MXLDefaults(isConcertScore: true) == MXLDefaults(isConcertScore: true))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDefaults> = [MXLDefaults(isConcertScore: true), MXLDefaults(isConcertScore: true), MXLDefaults(isConcertScore: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDefaults(isConcertScore: true) != MXLDefaults(isConcertScore: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDefaults(isConcertScore: true)

        #expect(value.appearance == nil)
        #expect(value.isConcertScore == true)
        #expect(value.layout == MXLLayout())
        #expect(value.lyricFont.isEmpty)
        #expect(value.lyricLanguage.isEmpty)
        #expect(value.musicFont == nil)
        #expect(value.scaling == nil)
        #expect(value.wordFont == nil)
    }

    @Test
    func init_explicitValues() {
        let scaling = MXLScaling(millimeters: 7.2, tenths: 40)
        let appearance = MXLAppearance()
        let lyricFont = [MXLLyricFont(number: "1", name: "verse", font: MXLFont())]
        let lyricLanguage = [MXLLyricLanguage(number: "1", name: "verse", xmlLang: "en")]
        let value = MXLDefaults(scaling: scaling,
                                isConcertScore: false,
                                layout: MXLLayout(),
                                appearance: appearance,
                                musicFont: MXLFont(style: .italic),
                                wordFont: MXLFont(style: .normal),
                                lyricFont: lyricFont,
                                lyricLanguage: lyricLanguage)

        #expect(value.appearance == appearance)
        #expect(value.isConcertScore == false)
        #expect(value.layout == MXLLayout())
        #expect(value.lyricFont == lyricFont)
        #expect(value.lyricLanguage == lyricLanguage)
        #expect(value.musicFont == MXLFont(style: .italic))
        #expect(value.scaling == scaling)
        #expect(value.wordFont == MXLFont(style: .normal))
    }
}
