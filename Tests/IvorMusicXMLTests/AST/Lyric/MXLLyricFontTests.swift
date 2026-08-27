// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLyricFontTests {
}

// MARK: -

extension MXLLyricFontTests {
    @Test
    func equality() {
        #expect(MXLLyricFont() == MXLLyricFont())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLLyricFont> = [MXLLyricFont(), MXLLyricFont(), MXLLyricFont(number: "1")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLyricFont() != MXLLyricFont(number: "1"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLLyricFont()

        #expect(value.font == MXLFont())
        #expect(value.name == nil)
        #expect(value.number == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLLyricFont(number: "1", name: "verse", font: MXLFont(style: .italic))

        #expect(value.font == MXLFont(style: .italic))
        #expect(value.name == "verse")
        #expect(value.number == "1")
    }
}
