// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmonClosed {

    /// The harmon-closed-location type indicates which portion of the symbol is filled in when the corresponding
    /// harmon-closed-value is half.
    public enum Location {

        /// The bottom portion of the symbol is filled in.
        case bottom

        /// The left portion of the symbol is filled in.
        case left

        /// The right portion of the symbol is filled in.
        case right

        /// The top portion of the symbol is filled in.
        case top
    }
}

// MARK: - Equatable

extension MXLHarmonClosed.Location: Equatable {
}

// MARK: - Hashable

extension MXLHarmonClosed.Location: Hashable {
}

// MARK: - Sendable

extension MXLHarmonClosed.Location: Sendable {
}
