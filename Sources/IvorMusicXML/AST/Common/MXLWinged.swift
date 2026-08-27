// © 2026 John Gary Pusey (see LICENSE.md)

/// The winged attribute indicates whether the repeat has winged extensions that appear above and below the
/// barline. The straight and curved values represent single wings, while the double-straight and double-curved
/// values represent double wings. The none value indicates no wings and is the default.
public enum MXLWinged {

    /// A single curved wing.
    case curved

    /// A double curved wing.
    case doubleCurved

    /// A double straight wing.
    case doubleStraight

    /// A single straight wing.
    case straight

    /// No wings. This is the default value.
    case wingless
}

// MARK: - Equatable

extension MXLWinged: Equatable {
}

// MARK: - Hashable

extension MXLWinged: Hashable {
}

// MARK: - Sendable

extension MXLWinged: Sendable {
}
