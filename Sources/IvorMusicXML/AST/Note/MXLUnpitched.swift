// © 2026 John Gary Pusey (see LICENSE.md)

/// The unpitched type represents musical elements that are notated on the staff but lack definite pitch, such as
/// unpitched percussion and speaking voice. If the child elements are not present, the note is placed on the
/// middle line of the staff. This is generally used with a one-line staff. Notes in percussion clef should always
/// use an unpitched element rather than a pitch element.
///
/// Maps the MusicXML `<unpitched>` element.
public struct MXLUnpitched {

    // MARK: Public Initializers

    /// Creates a new `MXLUnpitched`.
    ///
    /// - Parameter displayStepOctave:  The display-step-octave group contains the sequence of elements used by both the rest and unpitched elements. This group is used to place rests and unpitched elements on the staff without implying that these elements have pitch. Positioning follows the current clef. If percussion clef is used, the display-step and display-octave elements are interpreted as if in treble clef, with a G in octave 4 on line 2.
    public init(displayStepOctave: MXLDisplayStepOctave? = nil) {
        self.displayStepOctave = displayStepOctave
    }

    // MARK: Public Instance Properties

    /// The display-step-octave group contains the sequence of elements used by both the rest and unpitched elements.
    /// This group is used to place rests and unpitched elements on the staff without implying that these elements
    /// have pitch. Positioning follows the current clef. If percussion clef is used, the display-step and display-
    /// octave elements are interpreted as if in treble clef, with a G in octave 4 on line 2.
    ///
    /// Maps to nested MusicXML `<display-step>` and `<display-octave>` elements.
    public let displayStepOctave: MXLDisplayStepOctave?
}

// MARK: - Equatable

extension MXLUnpitched: Equatable {
}

// MARK: - Hashable

extension MXLUnpitched: Hashable {
}

// MARK: - Sendable

extension MXLUnpitched: Sendable {
}
