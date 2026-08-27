// © 2026 John Gary Pusey (see LICENSE.md)

/// The two-note-turn type describes the ending notes of trills and mordents for playback, relative to the current
/// note.
public enum MXLTwoNoteTurn {

    /// A half step ending.
    case half

    /// No ending notes.
    case omitted

    /// A whole step ending.
    case whole
}

// MARK: - Equatable

extension MXLTwoNoteTurn: Equatable {
}

// MARK: - Hashable

extension MXLTwoNoteTurn: Hashable {
}

// MARK: - Sendable

extension MXLTwoNoteTurn: Sendable {
}
