// © 2026 John Gary Pusey (see LICENSE.md)

/// Pitch is represented as a combination of the step of the diatonic scale, the chromatic alteration, and the
/// octave.
///
/// Maps the MusicXML `<pitch>` element.
public struct MXLPitch {

    // MARK: Public Initializers

    /// Creates a new `MXLPitch`.
    ///
    /// - Parameter step:    The diatonic step of the pitch.
    /// - Parameter alter:   The chromatic alteration of the pitch, in semitones (e.g. `-1` for flat, `1` for sharp).
    /// - Parameter octave:  The octave of the pitch.
    public init(step: MXLStep,
                alter: MXLSemitones? = nil,
                octave: MXLOctave) {
        self.alter = alter
        self.octave = octave
        self.step = step
    }

    // MARK: Public Instance Properties

    /// The chromatic alteration of the pitch, in semitones (e.g. `-1` for flat, `1` for sharp).
    ///
    /// Maps to a nested MusicXML `<alter>` element.
    public let alter: MXLSemitones?

    /// The octave of the pitch.
    ///
    /// Maps to a nested MusicXML `<octave>` element.
    public let octave: MXLOctave

    /// The diatonic step of the pitch.
    ///
    /// Maps to a nested MusicXML `<step>` element.
    public let step: MXLStep
}

// MARK: - Equatable

extension MXLPitch: Equatable {
}

// MARK: - Hashable

extension MXLPitch: Hashable {
}

// MARK: - Sendable

extension MXLPitch: Sendable {
}
