// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLRepeat {

    /// The backward-forward type is used to specify repeat directions. The start of the repeat has a forward
    /// direction while the end of the repeat has a backward direction.
    public enum Direction {

        /// The end of a repeat.
        case backward

        /// The start of a repeat.
        case forward
    }
}

// MARK: - Equatable

extension MXLRepeat.Direction: Equatable {
}

// MARK: - Hashable

extension MXLRepeat.Direction: Hashable {
}

// MARK: - Sendable

extension MXLRepeat.Direction: Sendable {
}
