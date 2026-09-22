// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNote.NoteheadText {

    /// One of the alternatives for NoteheadText.
    public enum Item {
        /// The `accidental-text` alternative.
        case accidentalText(MXLAccidentalText)

        /// The `display-text` alternative.
        case displayText(MXLFormattedText)
    }
}

// MARK: - Equatable

extension MXLNote.NoteheadText.Item: Equatable {
}

// MARK: - Hashable

extension MXLNote.NoteheadText.Item: Hashable {
}

// MARK: - Sendable

extension MXLNote.NoteheadText.Item: Sendable {
}
