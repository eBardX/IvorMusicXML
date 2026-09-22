// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmonClosed {

    /// The harmon-closed-value type represents whether the harmon mute is closed, open, or half-open.
    public enum Value {

        /// The harmon mute is half-open.
        case half

        /// The harmon mute is open.
        case no

        /// The harmon mute is closed.
        case yes
    }
}

// MARK: - Equatable

extension MXLHarmonClosed.Value: Equatable {
}

// MARK: - Hashable

extension MXLHarmonClosed.Value: Hashable {
}

// MARK: - Sendable

extension MXLHarmonClosed.Value: Sendable {
}
