// © 2026 John Gary Pusey (see LICENSE.md)

/// The rest element indicates notated rests or silences. Rest elements are usually empty, but placement on the
/// staff can be specified using display-step and display-octave elements. If the measure attribute is set to yes,
/// this indicates this is a complete measure rest.
///
/// Maps the MusicXML `<rest>` element.
public struct MXLRest {

    // MARK: Public Initializers

    /// Creates a new `MXLRest`.
    ///
    /// - Parameter displayStepOctave:  The display-step-octave group contains the sequence of elements used by both the rest and unpitched elements. This group is used to place rests and unpitched elements on the staff without implying that these elements have pitch. Positioning follows the current clef. If percussion clef is used, the display-step and display-octave elements are interpreted as if in treble clef, with a G in octave 4 on line 2.
    /// - Parameter measure:            A Boolean value indicating whether this represents a complete measure rest.
    public init(displayStepOctave: MXLDisplayStepOctave? = nil,
                measure: Bool? = nil) {
        self.displayStepOctave = displayStepOctave
        self.measure = measure
    }

    // MARK: Public Instance Properties

    /// The display-step-octave group contains the sequence of elements used by both the rest and unpitched elements.
    /// This group is used to place rests and unpitched elements on the staff without implying that these elements
    /// have pitch. Positioning follows the current clef. If percussion clef is used, the display-step and display-
    /// octave elements are interpreted as if in treble clef, with a G in octave 4 on line 2.
    ///
    /// Maps to nested MusicXML `<display-step>` and `<display-octave>` elements.
    public let displayStepOctave: MXLDisplayStepOctave?

    /// A Boolean value indicating whether this represents a complete measure rest.
    ///
    /// Maps to the MusicXML `measure` attribute.
    public let measure: Bool?
}

// MARK: - Equatable

extension MXLRest: Equatable {
}

// MARK: - Hashable

extension MXLRest: Hashable {
}

// MARK: - Sendable

extension MXLRest: Sendable {
}
