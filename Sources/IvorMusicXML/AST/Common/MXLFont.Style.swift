// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFont {

    /// The font-style type represents a simplified version of the CSS font-style property.
    public enum Style {

        /// Italic text.
        case italic

        /// Normal, upright text.
        case normal
    }
}

// MARK: - Equatable

extension MXLFont.Style: Equatable {
}

// MARK: - Hashable

extension MXLFont.Style: Hashable {
}

// MARK: - Sendable

extension MXLFont.Style: Sendable {
}
