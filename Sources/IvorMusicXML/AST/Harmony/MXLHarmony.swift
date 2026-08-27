// © 2026 John Gary Pusey (see LICENSE.md)

/// The harmony type represents harmony analysis, including chord symbols in popular music as well as functional
/// harmony analysis in classical music.
///
/// If there are alternate harmonies possible, this can be specified using multiple harmony elements
/// differentiated by type. Explicit harmonies have all note present in the music; implied have some notes missing
/// but implied; alternate represents alternate analyses.
///
/// The print-object attribute controls whether or not anything is printed due to the harmony element. The print-
/// frame attribute controls printing of a frame or fretboard diagram. The print-style attribute group sets the
/// default for the harmony, but individual elements can override this with their own print-style values. The
/// arrangement attribute specifies how multiple harmony-chord groups are arranged relative to each other.
/// Harmony-chords with vertical arrangement are separated by horizontal lines. Harmony-chords with diagonal or
/// horizontal arrangement are separated by diagonal lines or slashes.
///
/// Maps the MusicXML `<harmony>` element.
public struct MXLHarmony {

    // MARK: Public Initializers

    /// Creates a new `MXLHarmony`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter chord: A harmony element can contain many stacked chords (e.g. V of II). A sequence of harmony-chord groups is used for this type of secondary function, where V of II would be represented by a harmony-chord with a 5 numeral followed by a harmony-chord with a 2 numeral.
    /// - Parameter frame: A fretboard diagram to be printed with this harmony.
    /// - Parameter offset: Indicates where this harmony will appear relative to the current musical location, in divisions.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter staff: The staff element is defined within a group due to its use by both notes and direction elements.
    /// - Parameter kind: Differentiates whether this harmony is explicit, implied, or an alternate analysis, when alternate harmonies are possible.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter printsFrame: A Boolean value indicating whether to print a frame or fretboard diagram for this harmony.
    /// - Parameter arrangement: Specifies how multiple harmony-chord groups are arranged relative to each other.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter system: The system-relation attribute group distinguishes elements that are associated with a system rather than the particular part where the element appears.
    public init(id: String? = nil,
                chord: [Chord] = [],
                frame: MXLFrame? = nil,
                offset: MXLOffset? = nil,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                staff: MXLStaff? = nil,
                kind: Kind? = nil,
                printsObject: Bool? = nil,
                printsFrame: Bool? = nil,
                arrangement: MXLHarmonyArrangement? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                placement: MXLAboveBelow? = nil,
                system: MXLSystemRelation? = nil) {
        self.arrangement = arrangement
        self.chord = chord
        self.color = color
        self.font = font
        self.footnote = footnote
        self.frame = frame
        self.id = id
        self.kind = kind
        self.level = level
        self.offset = offset
        self.placement = placement
        self.position = position
        self.printsFrame = printsFrame
        self.printsObject = printsObject
        self.staff = staff
        self.system = system
    }

    // MARK: Public Instance Properties

    /// Specifies how multiple harmony-chord groups are arranged relative to each other.
    ///
    /// Maps to the MusicXML `arrangement` attribute.
    public let arrangement: MXLHarmonyArrangement?

    /// A harmony element can contain many stacked chords (e.g. V of II). A sequence of harmony-chord groups is used
    /// for this type of secondary function, where V of II would be represented by a harmony-chord with a 5 numeral
    /// followed by a harmony-chord with a 2 numeral.
    ///
    /// A root is a pitch name like C, D, E, while a numeral is a scale degree like 1, 2, 3. The root element is
    /// generally used with pop chord symbols, while the numeral element is generally used with classical functional
    /// harmony and Nashville numbers. It is an either/or choice to avoid data inconsistency. The function element,
    /// which represents Roman numerals with roman numeral text, has been deprecated as of MusicXML 4.0.
    ///
    /// Maps to a nested MusicXML `<harmony-chord>` element.
    public let chord: [Chord]

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// A fretboard diagram to be printed with this harmony.
    ///
    /// Maps to a nested MusicXML `<frame>` element.
    public let frame: MXLFrame?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Differentiates whether this harmony is explicit, implied, or an alternate analysis, when alternate harmonies
    /// are possible.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind?

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// Indicates where this harmony will appear relative to the current musical location, in divisions.
    ///
    /// Maps to a nested MusicXML `<offset>` element.
    public let offset: MXLOffset?

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

    /// A Boolean value indicating whether to print a frame or fretboard diagram for this harmony.
    ///
    /// Maps to the MusicXML `print-frame` attribute.
    public let printsFrame: Bool?

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?

    /// The staff element is defined within a group due to its use by both notes and direction elements.
    ///
    /// Maps to a nested MusicXML `<staff>` element.
    public let staff: MXLStaff?

    /// The system-relation attribute group distinguishes elements that are associated with a system rather than the
    /// particular part where the element appears.
    ///
    /// Maps to the MusicXML `system` attribute.
    public let system: MXLSystemRelation?
}

// MARK: - Equatable

extension MXLHarmony: Equatable {
}

// MARK: - Hashable

extension MXLHarmony: Hashable {
}

// MARK: - Sendable

extension MXLHarmony: Sendable {
}
