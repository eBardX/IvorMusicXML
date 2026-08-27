// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLyricLanguageTests {
}

// MARK: -

extension MXLLyricLanguageTests {
    @Test
    func equality() {
        #expect(MXLLyricLanguage() == MXLLyricLanguage())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLLyricLanguage> = [MXLLyricLanguage(), MXLLyricLanguage(), MXLLyricLanguage(number: "1")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLyricLanguage() != MXLLyricLanguage(number: "1"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLLyricLanguage()

        #expect(value.name == nil)
        #expect(value.number == nil)
        #expect(value.xmlLang == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLLyricLanguage(number: "1", name: "verse", xmlLang: "en")

        #expect(value.name == "verse")
        #expect(value.number == "1")
        #expect(value.xmlLang == "en")
    }
}
