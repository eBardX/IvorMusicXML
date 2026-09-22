// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFontSizeTests {
}

// MARK: -

extension MXLFontSizeTests {
    @Test
    func equality() {
        #expect(MXLFont.Size.css(.large) == .css(.large))
        #expect(MXLFont.Size.point(12.0) == .point(12.0))
    }

    @Test
    func hashable() {
        let values: Set<MXLFont.Size> = [.css(.large), .css(.large), .css(.small), .point(12.0)]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLFont.Size.css(.large) != .css(.small))
        #expect(MXLFont.Size.point(12.0) != .point(14.0))
        #expect(MXLFont.Size.css(.large) != .point(12.0))
    }
}
