// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStartNoteTests {
}

// MARK: -

extension MXLStartNoteTests {
    @Test
    func equality() {
        #expect(MXLStartNote.main == .main)
    }

    @Test
    func hashable() {
        let values: Set<MXLStartNote> = [.main, .main, .upper]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStartNote.main != .upper)
    }
}
