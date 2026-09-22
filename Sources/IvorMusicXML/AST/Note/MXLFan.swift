// © 2026 John Gary Pusey (see LICENSE.md)

/// The fan type represents the type of beam fanning present on a note, used to represent accelerandos and
/// ritardandos.
public enum MXLFan {

    /// Beam fanning representing an accelerando.
    case accel

    /// Beam fanning representing a ritardando.
    case rit

    /// No beam fanning.
    case steady
}

// MARK: - Equatable

extension MXLFan: Equatable {
}

// MARK: - Hashable

extension MXLFan: Hashable {
}

// MARK: - Sendable

extension MXLFan: Sendable {
}
