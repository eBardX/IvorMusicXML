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
    /// - Parameter ties:       The set of ties to or from the note.
    public init(isChord: Bool,
                value: Self.Value,
                duration: UInt,
                ties: Set<MXLTie>) {
        self.duration = duration
        self.isChord = isChord
        self.ties = ties
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The duration of this note in divisions.
    public let duration: UInt

    /// A Boolean value indicating whether this note is part of a chord.
    public let isChord: Bool

    /// The set of ties to or from this note..
    public let ties: Set<MXLTie>

    /// The pitch, rest, or unpitched value of this note.
    public let value: Self.Value
}

// MARK: - Sendable

extension MXLNote: Sendable {
}
