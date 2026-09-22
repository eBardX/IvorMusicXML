// © 2026 John Gary Pusey (see LICENSE.md)

/// The over-under type is used to indicate whether the tips of curved lines such as slurs and ties are overhand
/// (tips down) or underhand (tips up).
public enum MXLOverUnder {

    /// Overhand, with the tips pointing down.
    case over

    /// Underhand, with the tips pointing up.
    case under
}

// MARK: - Equatable

extension MXLOverUnder: Equatable {
}

// MARK: - Hashable

extension MXLOverUnder: Hashable {
}

// MARK: - Sendable

extension MXLOverUnder: Sendable {
}
