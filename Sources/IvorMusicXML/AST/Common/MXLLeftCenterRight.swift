// © 2026 John Gary Pusey (see LICENSE.md)

/// The left-center-right type is used to define horizontal alignment and text justification.
public enum MXLLeftCenterRight {

    /// Center alignment or justification.
    case center

    /// Left alignment or justification.
    case left

    /// Right alignment or justification.
    case right
}

// MARK: - Equatable

extension MXLLeftCenterRight: Equatable {
}

// MARK: - Hashable

extension MXLLeftCenterRight: Hashable {
}

// MARK: - Sendable

extension MXLLeftCenterRight: Sendable {
}
