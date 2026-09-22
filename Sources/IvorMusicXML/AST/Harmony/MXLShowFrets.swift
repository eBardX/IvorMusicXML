// © 2026 John Gary Pusey (see LICENSE.md)

/// The show-frets type indicates whether to show tablature frets as numbers (0, 1, 2) or letters (a, b, c). The
/// default choice is numbers.
public enum MXLShowFrets {

    /// Frets are shown as letters (a, b, c).
    case letters

    /// Frets are shown as numbers (0, 1, 2).
    case numbers
}

// MARK: - Equatable

extension MXLShowFrets: Equatable {
}

// MARK: - Hashable

extension MXLShowFrets: Hashable {
}

// MARK: - Sendable

extension MXLShowFrets: Sendable {
}
