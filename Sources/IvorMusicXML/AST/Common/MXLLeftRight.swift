// © 2026 John Gary Pusey (see LICENSE.md)

/// The left-right type is used to indicate whether one element appears to the left or the right of another
/// element.
public enum MXLLeftRight {

    /// The element appears to the left.
    case left

    /// The element appears to the right.
    case right
}

// MARK: - Equatable

extension MXLLeftRight: Equatable {
}

// MARK: - Hashable

extension MXLLeftRight: Hashable {
}

// MARK: - Sendable

extension MXLLeftRight: Sendable {
}
