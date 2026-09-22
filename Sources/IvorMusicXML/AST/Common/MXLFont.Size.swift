// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFont {

    /// The font-size can be one of the CSS font sizes (xx-small, x-small, small, medium, large, x-large, xx-large) or
    /// a numeric point size.
    public enum Size {

        /// One of the CSS font sizes.
        case css(MXLCssFontSize)

        /// A numeric point size.
        case point(Double)
    }
}

// MARK: - Equatable

extension MXLFont.Size: Equatable {
}

// MARK: - Hashable

extension MXLFont.Size: Hashable {
}

// MARK: - Sendable

extension MXLFont.Size: Sendable {
}
