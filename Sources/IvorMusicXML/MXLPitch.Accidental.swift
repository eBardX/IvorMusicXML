// © 2025–2026 John Gary Pusey (see LICENSE.md)

extension MXLPitch {
    /// An accidental of a MusicXML pitch.
    public enum Accidental {
        /// A double flat (𝄫).
        case doubleFlat

        /// A flat (♭).
        case flat

        /// A natural (♮).
        case natural

        /// A sharp (♯).
        case sharp

        /// A double sharp (𝄪).
        case doubleSharp
    }
}

// MARK: - Sendable

extension MXLPitch.Accidental: Sendable {
}
