// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A MusicXML pitch.
public struct MXLPitch {

    // MARK: Public Nested Types

    /// The octave number of a pitch.
    public typealias Octave = Int

    // MARK: Public Initializers

    /// Creates a new pitch with the provided letter, accidental, and octave.
    ///
    /// - Parameter letter:         The letter name of the pitch.
    /// - Parameter accidental:     The accidental of the pitch.
    /// - Parameter octave:         The octave number of the pitch.
    public init(letter: Letter,
                accidental: Accidental,
                octave: Octave) {
        self.accidental = accidental
        self.letter = letter
        self.octave = octave
    }

    // MARK: Public Instance Properties

    /// The accidental of the pitch.
    public let accidental: Accidental

    /// The letter name of the pitch.
    public let letter: Letter

    /// The octave number of the pitch.
    public let octave: Octave
}

// MARK: - Sendable

extension MXLPitch: Sendable {
}
