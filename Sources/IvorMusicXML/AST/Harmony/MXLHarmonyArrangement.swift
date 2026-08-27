// © 2026 John Gary Pusey (see LICENSE.md)

/// The harmony-arrangement type indicates how stacked chords and bass notes are displayed within a harmony
/// element. The vertical value specifies that the second element appears below the first. The horizontal value
/// specifies that the second element appears to the right of the first. The diagonal value specifies that the
/// second element appears both below and to the right of the first.
public enum MXLHarmonyArrangement {

    /// The second element appears both below and to the right of the first.
    case diagonal

    /// The second element appears to the right of the first.
    case horizontal

    /// The second element appears below the first.
    case vertical
}

// MARK: - Equatable

extension MXLHarmonyArrangement: Equatable {
}

// MARK: - Hashable

extension MXLHarmonyArrangement: Hashable {
}

// MARK: - Sendable

extension MXLHarmonyArrangement: Sendable {
}
