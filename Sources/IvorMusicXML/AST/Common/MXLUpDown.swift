// © 2026 John Gary Pusey (see LICENSE.md)

/// The up-down type is used for the direction of arrows and other pointed symbols like vertical accents,
/// indicating which way the tip is pointing.
public enum MXLUpDown {

    /// The tip points down.
    case down

    /// The tip points up.
    case up
}

// MARK: - Equatable

extension MXLUpDown: Equatable {
}

// MARK: - Hashable

extension MXLUpDown: Hashable {
}

// MARK: - Sendable

extension MXLUpDown: Sendable {
}
