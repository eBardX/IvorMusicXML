// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHole.Closed {

    /// The hole-closed-location type indicates which portion of the hole is filled in when the corresponding hole-
    /// closed-value is half.
    public enum Location {

        /// The bottom portion of the hole is filled in.
        case bottom

        /// The left portion of the hole is filled in.
        case left

        /// The right portion of the hole is filled in.
        case right

        /// The top portion of the hole is filled in.
        case top
    }
}

// MARK: - Equatable

extension MXLHole.Closed.Location: Equatable {
}

// MARK: - Hashable

extension MXLHole.Closed.Location: Hashable {
}

// MARK: - Sendable

extension MXLHole.Closed.Location: Sendable {
}
