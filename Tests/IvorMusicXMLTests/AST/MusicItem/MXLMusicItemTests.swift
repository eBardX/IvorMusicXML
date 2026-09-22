// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMusicItemTests {
}

// MARK: -

extension MXLMusicItemTests {
    @Test
    func equality() {
        let bookmark = MXLBookmark(id: "b1")

        #expect(MXLMusicItem.bookmark(bookmark) == .bookmark(bookmark))
    }

    @Test
    func hashable() {
        let bookmark = MXLMusicItem.bookmark(MXLBookmark(id: "b1"))
        let backup = MXLMusicItem.backup(MXLBackup(duration: MXLPositiveDivisions(intValue: 4)!))    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLMusicItem> = [bookmark, bookmark, backup]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let bookmark = MXLMusicItem.bookmark(MXLBookmark(id: "b1"))
        let backup = MXLMusicItem.backup(MXLBackup(duration: MXLPositiveDivisions(intValue: 4)!))    // swiftlint:disable:this force_unwrapping

        #expect(bookmark != backup)
    }
}
