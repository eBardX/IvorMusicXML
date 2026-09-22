// © 2026 John Gary Pusey (see LICENSE.md)

/// The tip-direction type represents the direction in which the tip of a stick or beater points, using Unicode
/// arrow terminology.
public enum MXLTipDirection {

    /// The tip points down.
    case down

    /// The tip points left.
    case left

    /// The tip points northeast.
    case northeast

    /// The tip points northwest.
    case northwest

    /// The tip points right.
    case right

    /// The tip points southeast.
    case southeast

    /// The tip points southwest.
    case southwest

    /// The tip points up.
    case up
}

// MARK: - Equatable

extension MXLTipDirection: Equatable {
}

// MARK: - Hashable

extension MXLTipDirection: Hashable {
}

// MARK: - Sendable

extension MXLTipDirection: Sendable {
}
