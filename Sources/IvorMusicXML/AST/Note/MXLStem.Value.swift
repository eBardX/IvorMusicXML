// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLStem {

    /// The stem-value type represents the notated stem direction.
    public enum Value {

        /// No stem.
        case absent

        /// A double stem.
        case double

        /// A stem pointing down.
        case down

        /// A stem pointing up.
        case up
    }
}

// MARK: - Equatable

extension MXLStem.Value: Equatable {
}

// MARK: - Hashable

extension MXLStem.Value: Hashable {
}

// MARK: - Sendable

extension MXLStem.Value: Sendable {
}
