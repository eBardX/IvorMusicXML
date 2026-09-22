// © 2026 John Gary Pusey (see LICENSE.md)

/// The valign type is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. If
/// the text is on multiple lines, baseline alignment refers to the baseline of the lowest line of text. Defaults
/// are implementation-dependent.
public enum MXLValign {

    /// Alignment to the baseline of the text, or of its lowest line if the text spans multiple lines.
    case baseline

    /// Alignment to the bottom of the text.
    case bottom

    /// Alignment to the middle of the text.
    case middle

    /// Alignment to the top of the text.
    case top
}

// MARK: - Equatable

extension MXLValign: Equatable {
}

// MARK: - Hashable

extension MXLValign: Hashable {
}

// MARK: - Sendable

extension MXLValign: Sendable {
}
