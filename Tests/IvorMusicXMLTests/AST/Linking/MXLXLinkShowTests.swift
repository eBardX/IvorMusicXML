// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLXLinkShowTests {
}

// MARK: -

extension MXLXLinkShowTests {
    @Test
    func equality() {
        #expect(MXLXLink.Show.replace == .replace)
    }

    @Test
    func hashable() {
        let values: Set<MXLXLink.Show> = [.replace, .replace, .embed]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLXLink.Show.replace != .embed)
    }
}
