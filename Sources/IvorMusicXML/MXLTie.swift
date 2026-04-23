// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// Indicates the start or stop of a tie.
public enum MXLTie {
    /// The start of a tie.
    case start

    /// The stop of a tie.
    case stop
}

// MARK: - Equatable

extension MXLTie: Equatable {
}

// MARK: - Hashable

extension MXLTie: Hashable {
}

// MARK: - Sendable

extension MXLTie: Sendable {
}
