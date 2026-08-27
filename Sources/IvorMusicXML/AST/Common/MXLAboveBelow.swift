// © 2026 John Gary Pusey (see LICENSE.md)

/// The above-below type is used to indicate whether one element appears above or below another element.
public enum MXLAboveBelow {

    /// The element appears above the reference element.
    case above

    /// The element appears below the reference element.
    case below
}

// MARK: - Equatable

extension MXLAboveBelow: Equatable {
}

// MARK: - Hashable

extension MXLAboveBelow: Hashable {
}

// MARK: - Sendable

extension MXLAboveBelow: Sendable {
}
