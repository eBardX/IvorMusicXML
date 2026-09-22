// © 2026 John Gary Pusey (see LICENSE.md)

/// The trill-step type describes the alternating note of trills and mordents for playback, relative to the
/// current note.
public enum MXLTrillStep {

    /// A half step above or below the current note.
    case half

    /// The same pitch as the current note.
    case unison

    /// A whole step above or below the current note.
    case whole
}

// MARK: - Equatable

extension MXLTrillStep: Equatable {
}

// MARK: - Hashable

extension MXLTrillStep: Hashable {
}

// MARK: - Sendable

extension MXLTrillStep: Sendable {
}
