// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteNoteheadValueTests {
}

// MARK: -

extension MXLNoteNoteheadValueTests {
    @Test
    func equality() {
        #expect(MXLNote.Notehead.Value.normal == .normal)
    }

    @Test
    func hashable() {
        let values: Set<MXLNote.Notehead.Value> = [.normal, .normal, .diamond]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNote.Notehead.Value.normal != .diamond)
    }
}
