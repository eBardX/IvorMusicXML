// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHole.Closed {

    /// The hole-closed-value type represents whether the hole is closed, open, or half-open.
    public enum Value {

        /// The hole is half-open.
        case half

        /// The hole is open.
        case no

        /// The hole is closed.
        case yes
    }
}

// MARK: - Equatable

extension MXLHole.Closed.Value: Equatable {
}

// MARK: - Hashable

extension MXLHole.Closed.Value: Hashable {
}

// MARK: - Sendable

extension MXLHole.Closed.Value: Sendable {
}
