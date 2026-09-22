// © 2026 John Gary Pusey (see LICENSE.md)

/// The start-note type describes the starting note of trills and mordents for playback, relative to the current
/// note.
public enum MXLStartNote {

    /// The trill or mordent starts on the note below the current note.
    case below

    /// The trill or mordent starts on the current note.
    case main

    /// The trill or mordent starts on the note above the current note.
    case upper
}

// MARK: - Equatable

extension MXLStartNote: Equatable {
}

// MARK: - Hashable

extension MXLStartNote: Hashable {
}

// MARK: - Sendable

extension MXLStartNote: Sendable {
}
