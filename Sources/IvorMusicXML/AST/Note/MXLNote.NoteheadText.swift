// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNote {

    /// The notehead-text type represents text that is displayed inside a notehead, as is done in some educational
    /// music. It is not needed for the numbers used in tablature or jianpu notation. The presence of a TAB or jianpu
    /// clefs is sufficient to indicate that numbers are used. The display-text and accidental-text elements allow
    /// display of fully formatted text and accidentals.
    ///
    /// Maps the MusicXML `<notehead-text>` element.
    public struct NoteheadText {

        // MARK: Public Initializers

        /// Creates a new `MXLNote.NoteheadText`.
        ///
        /// - Parameter items:  One of the alternatives for NoteheadText.
        public init(items: [Item] = []) {
            self.items = items
        }

        // MARK: Public Instance Properties

        /// One of the alternatives for NoteheadText.
        public let items: [Item]
    }
}

// MARK: - Equatable

extension MXLNote.NoteheadText: Equatable {
}

// MARK: - Hashable

extension MXLNote.NoteheadText: Hashable {
}

// MARK: - Sendable

extension MXLNote.NoteheadText: Sendable {
}
