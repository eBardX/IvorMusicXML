// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteNoteheadTextTests {
}

// MARK: -

extension MXLNoteNoteheadTextTests {
    @Test
    func equality() {
        #expect(MXLNote.NoteheadText() == MXLNote.NoteheadText())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let items: [MXLNote.NoteheadText.Item] = [.displayText(MXLFormattedText(value: "1"))]
        let values: Set<MXLNote.NoteheadText> = [MXLNote.NoteheadText(), MXLNote.NoteheadText(), MXLNote.NoteheadText(items: items)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let items: [MXLNote.NoteheadText.Item] = [.displayText(MXLFormattedText(value: "1"))]

        #expect(MXLNote.NoteheadText() != MXLNote.NoteheadText(items: items))
    }

    @Test
    func init_defaultValues() {
        let value = MXLNote.NoteheadText()

        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLNote.NoteheadText.Item] = [.displayText(MXLFormattedText(value: "1"))]
        let value = MXLNote.NoteheadText(items: items)

        #expect(value.items == items)
    }
}
