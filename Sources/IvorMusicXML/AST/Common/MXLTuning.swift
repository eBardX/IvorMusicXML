// © 2026 John Gary Pusey (see LICENSE.md)

/// The tuning group contains the sequence of elements common to the staff-tuning and accord elements.
public struct MXLTuning {

    // MARK: Public Initializers

    /// Creates a new `MXLTuning`.
    ///
    /// - Parameter step: The tuning-step element is represented like the step element, with a different name to reflect its different function in string tuning.
    /// - Parameter alter: The tuning-alter element is represented like the alter element, with a different name to reflect its different function in string tuning.
    /// - Parameter octave: The tuning-octave element is represented like the octave element, with a different name to reflect its different function in string tuning.
    public init(step: MXLStep,
                alter: MXLSemitones? = nil,
                octave: MXLOctave) {
        self.alter = alter
        self.octave = octave
        self.step = step
    }

    // MARK: Public Instance Properties

    /// The tuning-alter element is represented like the alter element, with a different name to reflect its different
    /// function in string tuning.
    ///
    /// Maps to a nested MusicXML `<tuning-alter>` element.
    public let alter: MXLSemitones?

    /// The tuning-octave element is represented like the octave element, with a different name to reflect its
    /// different function in string tuning.
    ///
    /// Maps to a nested MusicXML `<tuning-octave>` element.
    public let octave: MXLOctave

    /// The tuning-step element is represented like the step element, with a different name to reflect its different
    /// function in string tuning.
    ///
    /// Maps to a nested MusicXML `<tuning-step>` element.
    public let step: MXLStep
}

// MARK: - Equatable

extension MXLTuning: Equatable {
}

// MARK: - Hashable

extension MXLTuning: Hashable {
}

// MARK: - Sendable

extension MXLTuning: Sendable {
}
