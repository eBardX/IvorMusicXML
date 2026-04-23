// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A MusicXML grace note.
public struct MXLGraceNote {

    // MARK: Public Initializers

    /// Creates a new grace note with the provided properties.
    ///
    /// - Parameter isChord:    A Boolean value indicating whether the grace
    ///                         note is part of a chord.
    /// - Parameter value:      The pitch, rest, or unpitched value of the
    ///                         grace note.
    /// - Parameter duration:   The duration type of the grace note.
    /// - Parameter ties:       The set of ties to or from the grace note.
    public init(isChord: Bool,
                value: MXLNote.Value,
                duration: MXLGraceDuration,
                ties: Set<MXLTie>) {
        self.duration = duration
        self.isChord = isChord
        self.ties = ties
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The duration type of this grace note.
    public let duration: MXLGraceDuration

    /// A Boolean value indicating whether this grace note is part of a chord.
    public let isChord: Bool

    /// The set of ties to or from this grace note.
    public let ties: Set<MXLTie>

    /// The pitch, rest, or unpitched value of this grace note.
    public let value: MXLNote.Value
}

// MARK: - Sendable

extension MXLGraceNote: Sendable {
}
