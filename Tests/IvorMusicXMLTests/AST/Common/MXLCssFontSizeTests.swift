// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCssFontSizeTests {
}

// MARK: -

extension MXLCssFontSizeTests {
    @Test
    func equality() {
        #expect(MXLCssFontSize.large == .large)
        #expect(MXLCssFontSize.xxSmall == .xxSmall)
    }

    @Test
    func hashable() {
        let values: Set<MXLCssFontSize> = [.large, .large, .medium, .small, .xLarge, .xSmall, .xxLarge, .xxSmall]

        #expect(values.count == 7)
    }

    @Test
    func inequality() {
        #expect(MXLCssFontSize.large != .small)
    }
}
