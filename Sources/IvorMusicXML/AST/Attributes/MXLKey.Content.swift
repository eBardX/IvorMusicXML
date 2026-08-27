// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLKey {

    /// One of the alternatives for Key.
    public enum Content {
        /// The non-traditional-key group represents a single alteration within a non-traditional key signature. A
        /// sequence of these groups makes up a non-traditional key signature
        case nonTraditionalKey(MXLNonTraditionalKey)

        /// The traditional-key group represents a traditional key signature using the cycle of fifths.
        case traditionalKey(MXLTraditionalKey)
    }
}

// MARK: - Equatable

extension MXLKey.Content: Equatable {
}

// MARK: - Hashable

extension MXLKey.Content: Hashable {
}

// MARK: - Sendable

extension MXLKey.Content: Sendable {
}
