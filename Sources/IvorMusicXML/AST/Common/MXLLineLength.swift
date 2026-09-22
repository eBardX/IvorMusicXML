// © 2026 John Gary Pusey (see LICENSE.md)

/// The line-length type distinguishes between different line lengths for doit, falloff, plop, and scoop
/// articulations.
public enum MXLLineLength {

    /// A long line.
    case long

    /// A medium-length line.
    case medium

    /// A short line.
    case short
}

// MARK: - Equatable

extension MXLLineLength: Equatable {
}

// MARK: - Hashable

extension MXLLineLength: Hashable {
}

// MARK: - Sendable

extension MXLLineLength: Sendable {
}
