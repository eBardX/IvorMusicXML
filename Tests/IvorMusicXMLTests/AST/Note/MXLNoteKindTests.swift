// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteKindTests {
}

// MARK: -

extension MXLNoteKindTests {
    @Test
    func equality() {
        #expect(MXLNote.Kind(value: .quarter) == MXLNote.Kind(value: .quarter))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLNote.Kind> = [MXLNote.Kind(value: .quarter), MXLNote.Kind(value: .quarter), MXLNote.Kind(value: .eighth)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNote.Kind(value: .quarter) != MXLNote.Kind(value: .eighth))
    }

    @Test
    func init_defaultValues() {
        let value = MXLNote.Kind(value: .quarter)

        #expect(value.size == nil)
        #expect(value.value == .quarter)
    }

    @Test
    func init_explicitValues() {
        let value = MXLNote.Kind(value: .eighth, size: .cue)

        #expect(value.size == .cue)
        #expect(value.value == .eighth)
    }
}
