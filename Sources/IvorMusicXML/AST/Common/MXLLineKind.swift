// © 2026 John Gary Pusey (see LICENSE.md)

/// The line-type type distinguishes between solid, dashed, dotted, and wavy lines.
public enum MXLLineKind {

    /// A dashed line.
    case dashed

    /// A dotted line.
    case dotted

    /// A solid line.
    case solid

    /// A wavy line.
    case wavy
}

// MARK: - Equatable

extension MXLLineKind: Equatable {
}

// MARK: - Hashable

extension MXLLineKind: Hashable {
}

// MARK: - Sendable

extension MXLLineKind: Sendable {
}
