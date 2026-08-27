// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLStaffDivide {

    /// The staff-divide-symbol type is used for staff division symbols. The down, up, and up-down values correspond
    /// to SMuFL code points U+E00B, U+E00C, and U+E00D respectively.
    public enum Symbol {

        /// The staff division symbol corresponding to SMuFL code point U+E00B.
        case down

        /// The staff division symbol corresponding to SMuFL code point U+E00C.
        case up

        /// The staff division symbol corresponding to SMuFL code point U+E00D.
        case upDown
    }
}

// MARK: - Equatable

extension MXLStaffDivide.Symbol: Equatable {
}

// MARK: - Hashable

extension MXLStaffDivide.Symbol: Hashable {
}

// MARK: - Sendable

extension MXLStaffDivide.Symbol: Sendable {
}
