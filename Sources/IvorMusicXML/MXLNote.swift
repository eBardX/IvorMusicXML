// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A MusicXML note.
public struct MXLNote {

    // MARK: Public Initializers

    /// Creates a new note with the provided properties.
    ///
    /// - Parameter isChord:    A Boolean value indicating whether the note is
    ///                         part of a chord.
    /// - Parameter value:      The pitch, rest, or unpitched value of the
    ///                         note.
    /// - Parameter duration:   The duration of the note in divisions.
    /// - Parameter tie:        The tie state of the note.
    public init(isChord: Bool,
                value: Self.Value,
                duration: UInt,
                tie: MXLTie) {
        self.duration = duration
        self.isChord = isChord
        self.tie = tie
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The duration of the note in divisions.
    public let duration: UInt

    /// A Boolean value indicating whether the note is part of a chord.
    public let isChord: Bool

    /// The tie state of the note.
    public let tie: MXLTie

    /// The pitch, rest, or unpitched value of the note.
    public let value: Self.Value
}

// MARK: - Sendable

extension MXLNote: Sendable {
}
