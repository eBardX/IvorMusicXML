// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLSwing {

    /// One of the alternatives for Swing.
    public enum Content {
        /// The `first` alternative.
        case first(_ first: Int, second: Int, kind: Kind?)

        /// The `straight` alternative, indicating that no swing is present.
        case straight
    }
}

// MARK: - Equatable

extension MXLSwing.Content: Equatable {
}

// MARK: - Hashable

extension MXLSwing.Content: Hashable {
}

// MARK: - Sendable

extension MXLSwing.Content: Sendable {
}
