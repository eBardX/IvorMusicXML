// © 2026 John Gary Pusey (see LICENSE.md)

/// Wavy lines are one way to indicate trills and vibrato. When used with a barline element, they should always
/// have type="continue" set. The smufl attribute specifies a particular wavy line glyph from the SMuFL Multi-
/// segment lines range.
///
/// Maps the MusicXML `<wavy-line>` element.
public struct MXLWavyLine {

    // MARK: Public Initializers

    /// Creates a new `MXLWavyLine`.
    ///
    /// - Parameter kind: Whether this element marks the start, stop, or continuation of the wavy line.
    /// - Parameter number: Distinguishes this wavy line from other wavy lines that might be active at the same time.
    /// - Parameter smufl: The SMuFL canonical glyph name used to specify a particular wavy line character.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter trillSound: The trill-sound attribute group includes attributes used to guide the sound of trills, mordents, turns, shakes, and wavy lines. The default choices are:
    public init(kind: MXLStartStopContinue,
                number: MXLNumberLevel? = nil,
                smufl: MXLSmuflWavyLineGlyphName? = nil,
                position: MXLPosition = MXLPosition(),
                placement: MXLAboveBelow? = nil,
                color: MXLColor? = nil,
                trillSound: MXLTrillSound = MXLTrillSound()) {
        self.color = color
        self.number = number
        self.placement = placement
        self.position = position
        self.smufl = smufl
        self.trillSound = trillSound
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// Whether this element marks the start, stop, or continuation of the wavy line.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStopContinue

    /// Distinguishes this wavy line from other wavy lines that might be active at the same time.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLNumberLevel?

    /// The placement attribute indicates whether something is above or below another element, such as a note or a
    /// notation.
    ///
    /// Maps to the MusicXML `placement` attribute.
    public let placement: MXLAboveBelow?

    /// For most elements, any program will compute a default x and y position. The position attributes let this be
    /// changed two ways.
    ///
    /// The default-x and default-y attributes change the computation of the default position. For most elements, the
    /// origin is changed relative to the left-hand side of the note or the musical position within the bar (x) and
    /// the top line of the staff (y).
    ///
    /// For the following elements, the default-x value changes the origin relative to the start of the current
    /// measure:
    ///
    /// - note - figured-bass - harmony - link - directive - measure-numbering - all descendants of the part-list
    /// element - all children of the direction-type element
    ///
    /// This origin is from the start of the entire measure, at either the left barline or the start of the system.
    ///
    /// When the default-x attribute is used within a child element of the part-name-display, part-abbreviation-
    /// display, group-name-display, or group-abbreviation-display elements, it changes the origin relative to the
    /// start of the first measure on the system. These values are used when the current measure or a succeeding
    /// measure starts a new system. The same change of origin is used for the group-symbol element.
    ///
    /// For the note, figured-bass, and harmony elements, the default-x value is considered to have adjusted the
    /// musical position within the bar for its descendant elements.
    ///
    /// Since the credit-words and credit-image elements are not related to a measure, in these cases the default-x
    /// and default-y attributes adjust the origin relative to the bottom left-hand corner of the specified page.
    ///
    /// The relative-x and relative-y attributes change the position relative to the default position, either as
    /// computed by the individual program, or as overridden by the default-x and default-y attributes.
    ///
    /// Positive x is right, negative x is left; positive y is up, negative y is down. All units are in tenths of
    /// interline space. For stems, positive relative-y lengthens a stem while negative relative-y shortens it.
    ///
    /// The default-x and default-y position attributes provide higher-resolution positioning data than related
    /// features such as the placement attribute and the offset element. Applications reading a MusicXML file that can
    /// understand both features should generally rely on the default-x and default-y attributes for their greater
    /// accuracy. For the relative-x and relative-y attributes, the offset element, placement attribute, and directive
    /// attribute provide context for the relative position information, so the two features should be interpreted
    /// together.
    ///
    /// As elsewhere in the MusicXML format, tenths are the global tenths defined by the scaling element, not the
    /// local tenths of a staff resized by the staff-size element.
    public let position: MXLPosition

    /// The SMuFL canonical glyph name used to specify a particular wavy line character.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflWavyLineGlyphName?

    /// The trill-sound attribute group includes attributes used to guide the sound of trills, mordents, turns,
    /// shakes, and wavy lines. The default choices are:
    ///
    /// start-note = "upper" trill-step = "whole" two-note-turn = "none" accelerate = "no" beats = "4".
    ///
    /// Second-beat and last-beat are percentages for landing on the indicated beat, with defaults of 25 and 75
    /// respectively.
    ///
    /// For mordent and inverted-mordent elements, the defaults are different:
    ///
    /// The default start-note is "main", not "upper". The default for beats is "3", not "4". The default for second-
    /// beat is "12", not "25". The default for last-beat is "24", not "75".
    public let trillSound: MXLTrillSound
}

// MARK: - Equatable

extension MXLWavyLine: Equatable {
}

// MARK: - Hashable

extension MXLWavyLine: Hashable {
}

// MARK: - Sendable

extension MXLWavyLine: Sendable {
}
