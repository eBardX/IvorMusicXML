// © 2026 John Gary Pusey (see LICENSE.md)

/// The right-left-middle type is used to specify barline location.
public enum MXLRightLeftMiddle {

    /// A barline on the left of the measure.
    case left

    /// A barline in the middle of the measure.
    case middle

    /// A barline on the right of the measure.
    case right
}

// MARK: - Equatable

extension MXLRightLeftMiddle: Equatable {
}

// MARK: - Hashable

extension MXLRightLeftMiddle: Hashable {
}

// MARK: - Sendable

extension MXLRightLeftMiddle: Sendable {
}
