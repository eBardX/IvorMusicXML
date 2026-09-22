// © 2026 John Gary Pusey (see LICENSE.md)

/// The line-end type specifies if there is a jog up or down (or both), an arrow, or nothing at the start or end
/// of a bracket.
public enum MXLLineEnd {

    /// An arrow at the start or end of the bracket.
    case arrow

    /// Jogs both up and down at the start or end of the bracket.
    case both

    /// A jog down at the start or end of the bracket.
    case down

    /// No jog or arrow at the start or end of the bracket.
    case plain

    /// A jog up at the start or end of the bracket.
    case up
}

// MARK: - Equatable

extension MXLLineEnd: Equatable {
}

// MARK: - Hashable

extension MXLLineEnd: Hashable {
}

// MARK: - Sendable

extension MXLLineEnd: Sendable {
}
