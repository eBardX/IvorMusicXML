// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteKindValueTests {
}

// MARK: -

extension MXLNoteKindValueTests {
    @Test
    func equality() {
        #expect(MXLNoteKindValue.quarter == .quarter)
    }

    @Test
    func hashable() {
        let values: Set<MXLNoteKindValue> = [.quarter, .quarter, .eighth]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNoteKindValue.quarter != .eighth)
    }
}
