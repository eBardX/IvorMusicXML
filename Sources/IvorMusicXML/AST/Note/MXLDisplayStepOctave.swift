// © 2026 John Gary Pusey (see LICENSE.md)

/// The display-step-octave group contains the sequence of elements used by both the rest and unpitched elements.
/// This group is used to place rests and unpitched elements on the staff without implying that these elements
/// have pitch. Positioning follows the current clef. If percussion clef is used, the display-step and display-
/// octave elements are interpreted as if in treble clef, with a G in octave 4 on line 2.
public struct MXLDisplayStepOctave {

    // MARK: Public Initializers

    /// Creates a new `MXLDisplayStepOctave`.
    ///
    /// - Parameter displayStep:    The pitch step used to visually position a rest or unpitched element on the staff, following the current clef. If a percussion clef is in use, this is interpreted as if in treble clef.
    /// - Parameter displayOctave:  The octave used to visually position a rest or unpitched element on the staff, following the current clef. If a percussion clef is in use, this is interpreted as if in treble clef, with a G in octave 4 on line 2.
    public init(displayStep: MXLStep,
                displayOctave: MXLOctave) {
        self.displayOctave = displayOctave
        self.displayStep = displayStep
    }

    // MARK: Public Instance Properties

    /// The octave used to visually position a rest or unpitched element on the staff, following the current clef.
    /// If a percussion clef is in use, this is interpreted as if in treble clef, with a G in octave 4 on line 2.
    ///
    /// Maps to a nested MusicXML `<display-octave>` element.
    public let displayOctave: MXLOctave

    /// The pitch step used to visually position a rest or unpitched element on the staff, following the current
    /// clef. If a percussion clef is in use, this is interpreted as if in treble clef.
    ///
    /// Maps to a nested MusicXML `<display-step>` element.
    public let displayStep: MXLStep
}

// MARK: - Equatable

extension MXLDisplayStepOctave: Equatable {
}

// MARK: - Hashable

extension MXLDisplayStepOctave: Hashable {
}

// MARK: - Sendable

extension MXLDisplayStepOctave: Sendable {
}
