// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFullNote {

    /// One of the alternatives for FullNote.
    public enum Content {
        /// A pitched note.
        case pitch(MXLPitch)

        /// A rest (no pitch), possibly a complete measure rest.
        case rest(MXLRest)

        /// A note notated on the staff but lacking definite pitch, such as unpitched percussion or a speaking voice.
        case unpitched(MXLUnpitched)
    }
}

// MARK: - Equatable

extension MXLFullNote.Content: Equatable {
}

// MARK: - Hashable

extension MXLFullNote.Content: Hashable {
}

// MARK: - Sendable

extension MXLFullNote.Content: Sendable {
}
