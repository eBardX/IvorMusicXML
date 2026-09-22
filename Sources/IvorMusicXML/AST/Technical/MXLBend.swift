// © 2026 John Gary Pusey (see LICENSE.md)

/// The bend type is used in guitar notation and tablature. A single note with a bend and release will contain two
/// bend elements: the first to represent the bend and the second to represent the release. The shape attribute
/// distinguishes between the angled bend symbols commonly used in standard notation and the curved bend symbols
/// commonly used in both tablature and standard notation.
///
/// Maps the MusicXML `<bend>` element.
public struct MXLBend {

    // MARK: Public Initializers

    /// Creates a new `MXLBend`.
    ///
    /// - Parameter alter:     The bend-alter element indicates the number of semitones in the bend, similar to the alter element. As with the alter element, numbers like 0.5 can be used to indicate microtones. Negative values indicate pre-bends or releases. The pre-bend and release elements are used to distinguish what is intended. Because the bend-alter element represents the number of steps in the bend, a release after a bend has a negative bend-alter value, not a zero value.
    /// - Parameter content:   One of the alternatives for Bend.
    /// - Parameter withBar:   The with-bar element indicates that the bend is to be done at the bridge with a whammy or vibrato bar. The content of the element indicates how this should be notated. Content values of “scoop” and “dip” refer to the SMuFL guitarVibratoBarScoop and guitarVibratoBarDip glyphs.
    /// - Parameter shape:     Distinguishes between the angled bend symbols commonly used in standard notation and the curved bend symbols commonly used in both tablature and standard notation.
    /// - Parameter position:  For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font:      The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color:     The color attribute group indicates the color of an element.
    /// - Parameter sound:     The bend-sound type is used for bend and slide elements, and is similar to the trill-sound attribute group. Here the beats element refers to the number of discrete elements (like MIDI pitch bends) used to represent a continuous bend or slide. The first-beat indicates the percentage of the duration for starting a bend; the last-beat the percentage for ending it. The default choices are:
    public init(alter: MXLSemitones,
                content: Content? = nil,
                withBar: MXLPlacementText? = nil,
                shape: Shape? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                sound: MXLBendSound = MXLBendSound()) {
        self.alter = alter
        self.color = color
        self.content = content
        self.font = font
        self.position = position
        self.shape = shape
        self.sound = sound
        self.withBar = withBar
    }

    // MARK: Public Instance Properties

    /// The bend-alter element indicates the number of semitones in the bend, similar to the alter element. As with
    /// the alter element, numbers like 0.5 can be used to indicate microtones. Negative values indicate pre-bends or
    /// releases. The pre-bend and release elements are used to distinguish what is intended. Because the bend-alter
    /// element represents the number of steps in the bend, a release after a bend has a negative bend-alter value,
    /// not a zero value.
    ///
    /// Maps to a nested MusicXML `<bend-alter>` element.
    public let alter: MXLSemitones

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// One of the alternatives for Bend.
    public let content: Content?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

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

    /// Distinguishes between the angled bend symbols commonly used in standard notation and the curved bend symbols
    /// commonly used in both tablature and standard notation.
    ///
    /// Maps to the MusicXML `shape` attribute.
    public let shape: Shape?

    /// The bend-sound type is used for bend and slide elements, and is similar to the trill-sound attribute group.
    /// Here the beats element refers to the number of discrete elements (like MIDI pitch bends) used to represent a
    /// continuous bend or slide. The first-beat indicates the percentage of the duration for starting a bend; the
    /// last-beat the percentage for ending it. The default choices are:
    ///
    /// accelerate = “no” beats = “4” first-beat = “25” last-beat = “75”
    public let sound: MXLBendSound

    /// The with-bar element indicates that the bend is to be done at the bridge with a whammy or vibrato bar. The
    /// content of the element indicates how this should be notated. Content values of “scoop” and “dip” refer to the
    /// SMuFL guitarVibratoBarScoop and guitarVibratoBarDip glyphs.
    ///
    /// Maps to a nested MusicXML `<with-bar>` element.
    public let withBar: MXLPlacementText?
}

// MARK: - Equatable

extension MXLBend: Equatable {
}

// MARK: - Hashable

extension MXLBend: Hashable {
}

// MARK: - Sendable

extension MXLBend: Sendable {
}
