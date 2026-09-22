// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFontStyleTests {
}

// MARK: -

extension MXLFontStyleTests {
    @Test
    func equality() {
        #expect(MXLFont.Style.italic == .italic)
        #expect(MXLFont.Style.normal == .normal)
    }

    @Test
    func hashable() {
        let values: Set<MXLFont.Style> = [.italic, .italic, .normal]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFont.Style.italic != .normal)
    }
}
