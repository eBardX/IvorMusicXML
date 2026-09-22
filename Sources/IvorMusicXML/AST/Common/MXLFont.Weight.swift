// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFont {

    /// The font-weight type represents a simplified version of the CSS font-weight property.
    public enum Weight {

        /// Bold text.
        case bold

        /// Normal-weight text.
        case normal
    }
}

// MARK: - Equatable

extension MXLFont.Weight: Equatable {
}

// MARK: - Hashable

extension MXLFont.Weight: Hashable {
}

// MARK: - Sendable

extension MXLFont.Weight: Sendable {
}
