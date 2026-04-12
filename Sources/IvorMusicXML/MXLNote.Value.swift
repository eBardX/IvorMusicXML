// © 2025–2026 John Gary Pusey (see LICENSE.md)

extension MXLNote {
    /// The pitch, rest, or unpitched value of a note.
    public enum Value {
        /// A pitched note with the specified pitch.
        case pitch(MXLPitch)

        /// A rest.
        case rest

        /// An unpitched note.
        case unpitched
    }
}

// MARK: - Sendable

extension MXLNote.Value: Sendable {
}
