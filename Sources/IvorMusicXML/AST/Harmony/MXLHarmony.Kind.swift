// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmony {

    /// The harmony-type type differentiates different types of harmonies when alternate harmonies are possible.
    /// Explicit harmonies have all note present in the music; implied have some notes missing but implied;
    /// alternate represents alternate analyses.
    public enum Kind {

        /// An alternate analysis of the harmony.
        case alternate

        /// A harmony with all notes present in the music.
        case explicit

        /// A harmony with some notes missing but implied.
        case implied
    }
}

// MARK: - Equatable

extension MXLHarmony.Kind: Equatable {
}

// MARK: - Hashable

extension MXLHarmony.Kind: Hashable {
}

// MARK: - Sendable

extension MXLHarmony.Kind: Sendable {
}
