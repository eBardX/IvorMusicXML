// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteSizeKindTests {
}

// MARK: -

extension MXLNoteSizeKindTests {
    @Test
    func equality() {
        #expect(MXLNoteSize.Kind.cue == .cue)
    }

    @Test
    func hashable() {
        let values: Set<MXLNoteSize.Kind> = [.cue, .cue, .large]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNoteSize.Kind.cue != .large)
    }
}
