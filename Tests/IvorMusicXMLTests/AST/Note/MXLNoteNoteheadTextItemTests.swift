// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteNoteheadTextItemTests {
}

// MARK: -

extension MXLNoteNoteheadTextItemTests {
    @Test
    func equality() {
        let accidentalText = MXLAccidentalText(value: .sharp)

        #expect(MXLNote.NoteheadText.Item.accidentalText(accidentalText) == .accidentalText(accidentalText))
    }

    @Test
    func hashable() {
        let accidentalText = MXLNote.NoteheadText.Item.accidentalText(MXLAccidentalText(value: .sharp))
        let displayText = MXLNote.NoteheadText.Item.displayText(MXLFormattedText(value: "note"))
        let values: Set<MXLNote.NoteheadText.Item> = [accidentalText, accidentalText, displayText]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let accidentalText = MXLNote.NoteheadText.Item.accidentalText(MXLAccidentalText(value: .sharp))
        let displayText = MXLNote.NoteheadText.Item.displayText(MXLFormattedText(value: "note"))

        #expect(accidentalText != displayText)
    }
}
