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
    /// - Parameter tie:        The tie state of the grace note.
    public init(isChord: Bool,
                value: MXLNote.Value,
                duration: MXLGraceDuration,
                tie: MXLTie) {
        self.duration = duration
        self.isChord = isChord
        self.tie = tie
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The duration type of the grace note.
    public let duration: MXLGraceDuration

    /// A Boolean value indicating whether the grace note is part of a chord.
    public let isChord: Bool

    /// The tie state of the grace note.
    public let tie: MXLTie

    /// The pitch, rest, or unpitched value of the grace note.
    public let value: MXLNote.Value
}

// MARK: - Sendable

extension MXLGraceNote: Sendable {
}
