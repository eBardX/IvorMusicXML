// © 2026 John Gary Pusey (see LICENSE.md)

/// The time-separator type indicates how to display the arrangement between the beats and beat-type values in a
/// time signature. The default value is none. The horizontal, diagonal, and vertical values represent horizontal,
/// diagonal lower-left to upper-right, and vertical lines respectively. For these values, the beats and beat-type
/// values are arranged on either side of the separator line. The none value represents no separator with the
/// beats and beat-type arranged vertically. The adjacent value represents no separator with the beats and beat-
/// type arranged horizontally.
public enum MXLTimeSeparator {

    /// No separator, with the beats and beat-type arranged horizontally.
    case adjacent

    /// A diagonal line from the lower-left to the upper-right, with the beats and beat-type arranged on either side.
    case diagonal

    /// A horizontal line, with the beats and beat-type arranged on either side.
    case horizontal

    /// No separator, with the beats and beat-type arranged vertically. This is the default value.
    case stacked

    /// A vertical line, with the beats and beat-type arranged on either side.
    case vertical
}

// MARK: - Equatable

extension MXLTimeSeparator: Equatable {
}

// MARK: - Hashable

extension MXLTimeSeparator: Hashable {
}

// MARK: - Sendable

extension MXLTimeSeparator: Sendable {
}
