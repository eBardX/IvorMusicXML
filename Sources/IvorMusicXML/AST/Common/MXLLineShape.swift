// © 2026 John Gary Pusey (see LICENSE.md)

/// The line-shape type distinguishes between straight and curved lines.
public enum MXLLineShape {

    /// A curved line.
    case curved

    /// A straight line.
    case straight
}

// MARK: - Equatable

extension MXLLineShape: Equatable {
}

// MARK: - Hashable

extension MXLLineShape: Hashable {
}

// MARK: - Sendable

extension MXLLineShape: Sendable {
}
