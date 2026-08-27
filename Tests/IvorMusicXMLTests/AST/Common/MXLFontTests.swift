// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFontTests {
}

// MARK: -

extension MXLFontTests {
    @Test
    func equality() {
        #expect(MXLFont(style: .italic) == MXLFont(style: .italic))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFont> = [MXLFont(style: .italic), MXLFont(style: .italic), MXLFont(style: .normal)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFont(style: .italic) != MXLFont(style: .normal))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFont()

        #expect(value.family == nil)
        #expect(value.size == nil)
        #expect(value.style == nil)
        #expect(value.weight == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLFont(family: ["Maestro", "Opus"],
                            style: .italic,
                            size: .point(12),
                            weight: .bold)

        #expect(value.family == ["Maestro", "Opus"])
        #expect(value.size == .point(12))
        #expect(value.style == .italic)
        #expect(value.weight == .bold)
    }
}
