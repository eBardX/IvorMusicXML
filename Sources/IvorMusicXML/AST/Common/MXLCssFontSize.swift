// © 2026 John Gary Pusey (see LICENSE.md)

/// The css-font-size type includes the CSS font sizes used as an alternative to a numeric point size.
public enum MXLCssFontSize {

    /// The CSS `large` font size.
    case large

    /// The CSS `medium` font size.
    case medium

    /// The CSS `small` font size.
    case small

    /// The CSS `x-large` font size.
    case xLarge

    /// The CSS `x-small` font size.
    case xSmall

    /// The CSS `xx-large` font size.
    case xxLarge

    /// The CSS `xx-small` font size.
    case xxSmall
}

// MARK: - Equatable

extension MXLCssFontSize: Equatable {
}

// MARK: - Hashable

extension MXLCssFontSize: Hashable {
}

// MARK: - Sendable

extension MXLCssFontSize: Sendable {
}
