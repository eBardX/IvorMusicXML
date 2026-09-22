// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLSlashContent {

    /// The note type and augmentation dots defining the beat used for the display of repetition marks.
    public struct Group {

        // MARK: Public Initializers

        /// Creates a new `MXLSlashContent.Group`.
        ///
        /// - Parameter slashKind: The slash-type element indicates the graphical note type to use for the display of repetition marks.
        /// - Parameter slashDot: The number of augmentation dots in the note type used to display repetition marks.
        public init(slashKind: MXLNoteKindValue,
                    slashDot: Int) {
            self.slashDot = slashDot
            self.slashKind = slashKind
        }

        // MARK: Public Instance Properties

        /// The number of augmentation dots in the note type used to display repetition marks.
        ///
        /// Maps to a nested MusicXML `<slash-dot>` element.
        public let slashDot: Int

        /// The slash-type element indicates the graphical note type to use for the display of repetition marks.
        ///
        /// Maps to a nested MusicXML `<slash-type>` element.
        public let slashKind: MXLNoteKindValue
    }
}

// MARK: - Equatable

extension MXLSlashContent.Group: Equatable {
}

// MARK: - Hashable

extension MXLSlashContent.Group: Hashable {
}

// MARK: - Sendable

extension MXLSlashContent.Group: Sendable {
}
