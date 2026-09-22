// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTimeModification {

    /// The graphic note type and augmentation dots for the normal-notes portion of a time modification, used when
    /// they differ from the notated type of the current note.
    public struct Group {

        // MARK: Public Initializers

        /// Creates a new `MXLTimeModification.Group`.
        ///
        /// - Parameter normalKind:  If the type associated with the number in the normal-notes element is different than the current note type (e.g., a quarter note within an eighth note triplet), then the normal-notes type (e.g. eighth) is specified in the normal-type and normal-dot elements.
        /// - Parameter normalDot:   The number of augmentation dots that specify dotted normal tuplet types.
        public init(normalKind: MXLNoteKindValue,
                    normalDot: Int) {
            self.normalDot = normalDot
            self.normalKind = normalKind
        }

        // MARK: Public Instance Properties

        /// The number of augmentation dots that specify dotted normal tuplet types.
        ///
        /// Maps to a nested MusicXML `<normal-dot>` element.
        public let normalDot: Int

        /// If the type associated with the number in the normal-notes element is different than the current note type
        /// (e.g., a quarter note within an eighth note triplet), then the normal-notes type (e.g. eighth) is specified in
        /// the normal-type and normal-dot elements.
        ///
        /// Maps to a nested MusicXML `<normal-type>` element.
        public let normalKind: MXLNoteKindValue
    }
}

// MARK: - Equatable

extension MXLTimeModification.Group: Equatable {
}

// MARK: - Hashable

extension MXLTimeModification.Group: Hashable {
}

// MARK: - Sendable

extension MXLTimeModification.Group: Sendable {
}
