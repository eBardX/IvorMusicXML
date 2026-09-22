// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEncodingItemTests {
}

// MARK: -

extension MXLEncodingItemTests {
    @Test
    func equality() {
        #expect(MXLEncoding.Item.software("Finale") == .software("Finale"))
    }

    @Test
    func hashable() {
        let software = MXLEncoding.Item.software("Finale")
        let description = MXLEncoding.Item.encodingDescription("hand-entered")
        let values: Set<MXLEncoding.Item> = [software, software, description]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEncoding.Item.software("Finale") != .encodingDescription("hand-entered"))
    }
}
