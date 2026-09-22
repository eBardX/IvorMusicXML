// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmonic {

    /// One of the alternatives for Harmonic.
    public enum Content {
        /// The artificial element indicates that this is an artificial harmonic.
        case artificial

        /// The natural element indicates that this is a natural harmonic. These are usually notated at base pitch rather
        /// than sounding pitch.
        case natural
    }
}

// MARK: - Equatable

extension MXLHarmonic.Content: Equatable {
}

// MARK: - Hashable

extension MXLHarmonic.Content: Hashable {
}

// MARK: - Sendable

extension MXLHarmonic.Content: Sendable {
}
