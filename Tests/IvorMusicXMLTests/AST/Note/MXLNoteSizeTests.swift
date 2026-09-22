// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteSizeTests {
}

// MARK: -

extension MXLNoteSizeTests {
    @Test
    func equality() {
        #expect(MXLNoteSize(value: 60, kind: .cue) == MXLNoteSize(value: 60, kind: .cue))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLNoteSize> = [MXLNoteSize(value: 60, kind: .cue), MXLNoteSize(value: 60, kind: .cue), MXLNoteSize(value: 70, kind: .large)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNoteSize(value: 60, kind: .cue) != MXLNoteSize(value: 70, kind: .large))
    }

    @Test
    func init_values() {
        let value = MXLNoteSize(value: 60, kind: .cue)

        #expect(value.kind == .cue)
        #expect(value.value == 60)
    }
}
