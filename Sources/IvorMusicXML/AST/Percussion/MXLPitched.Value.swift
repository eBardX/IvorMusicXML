// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPitched {

    /// The pitched-value type represents pictograms for pitched percussion instruments. The chimes and tubular chimes
    /// values distinguish the single-line and double-line versions of the pictogram.
    public enum Value {

        /// A pictogram of a celesta.
        case celesta

        /// A pictogram of chimes, the single-line version of the pictogram.
        case chimes

        /// A pictogram of a glockenspiel.
        case glockenspiel

        /// A pictogram of a lithophone.
        case lithophone

        /// A pictogram of a mallet.
        case mallet

        /// A pictogram of a marimba.
        case marimba

        /// A pictogram of steel drums.
        case steelDrums

        /// A pictogram of a tubaphone.
        case tubaphone

        /// A pictogram of tubular chimes, the double-line version of the pictogram.
        case tubularChimes

        /// A pictogram of a vibraphone.
        case vibraphone

        /// A pictogram of a xylophone.
        case xylophone
    }
}

// MARK: - Equatable

extension MXLPitched.Value: Equatable {
}

// MARK: - Hashable

extension MXLPitched.Value: Hashable {
}

// MARK: - Sendable

extension MXLPitched.Value: Sendable {
}
