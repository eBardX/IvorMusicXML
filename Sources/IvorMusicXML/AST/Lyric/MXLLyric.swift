// © 2026 John Gary Pusey (see LICENSE.md)

/// The lyric type represents text underlays for lyrics. Two text elements that are not separated by an elision
/// element are part of the same syllable, but may have different text formatting. The MusicXML XSD is more strict
/// than the DTD in enforcing this by disallowing a second syllabic element unless preceded by an elision element.
/// The lyric number indicates multiple lines, though a name can be used as well. Common name examples are verse
/// and chorus.
///
/// Justification is center by default; placement is below by default. Vertical alignment is to the baseline of
/// the text and horizontal alignment matches justification. The print-object attribute can override a note’s
/// print-lyric attribute in cases where only some lyrics on a note are printed, as when lyrics for later verses
/// are printed in a block of text rather than with each note. The time-only attribute precisely specifies which
/// lyrics are to be sung which time through a repeated section.
///
/// Maps the MusicXML `<lyric>` element.
public struct MXLLyric {

    // MARK: Public Initializers

    /// Creates a new `MXLLyric`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter content: One of the alternatives for Lyric.
    /// - Parameter endsLine: A Boolean value indicating whether this lyric ends a line, per RP-017 for Standard MIDI File Lyric meta-events. Used to facilitate lyric display for Karaoke and similar applications.
    /// - Parameter endsParagraph: A Boolean value indicating whether this lyric ends a paragraph, per RP-017 for Standard MIDI File Lyric meta-events. Used to facilitate lyric display for Karaoke and similar applications.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter number: Identifies this lyric among multiple lines, such as when the same lyric applies to both a stem-up and a stem-down voice.
    /// - Parameter name: An alternative to `number` for identifying this lyric among multiple lines. Common values are verse and chorus.
    /// - Parameter justify: The justify attribute is used to indicate left, center, or right justification. The default value varies for different elements. For elements where the justify attribute is present but the halign attribute is not, the justify attribute indicates horizontal alignment as well as justification.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter timeOnly: Restricts the element to apply to a specific set of times through a repeated section.
    public init(id: String? = nil,
                content: Content,
                endsLine: Bool,
                endsParagraph: Bool,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                number: String? = nil,
                name: String? = nil,
                justify: MXLLeftCenterRight? = nil,
                position: MXLPosition = MXLPosition(),
                placement: MXLAboveBelow? = nil,
                color: MXLColor? = nil,
                printsObject: Bool? = nil,
                timeOnly: MXLTimeOnly? = nil) {
        self.color = color
        self.content = content
        self.endsLine = endsLine
        self.endsParagraph = endsParagraph
        self.footnote = footnote
        self.id = id
        self.justify = justify
        self.level = level
        self.name = name
        self.number = number
        self.placement = placement
        self.position = position
        self.printsObject = printsObject
        self.timeOnly = timeOnly
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// One of the alternatives for Lyric.
    public let content: Content

    /// A Boolean value indicating whether this lyric ends a line, per RP-017 for Standard MIDI File Lyric
    /// meta-events. Used to facilitate lyric display for Karaoke and similar applications.
    ///
    /// Maps to a nested MusicXML `<end-line>` element.
    public let endsLine: Bool

    /// A Boolean value indicating whether this lyric ends a paragraph, per RP-017 for Standard MIDI File Lyric
    /// meta-events. Used to facilitate lyric display for Karaoke and similar applications.
    ///
    /// Maps to a nested MusicXML `<end-paragraph>` element.
    public let endsParagraph: Bool

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The justify attribute is used to indicate left, center, or right justification. The default value varies for
    /// different elements. For elements where the justify attribute is present but the halign attribute is not, the
    /// justify attribute indicates horizontal alignment as well as justification.
    ///
    /// Maps to the MusicXML `justify` attribute.
    public let justify: MXLLeftCenterRight?

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// An alternative to `number` for identifying this lyric among multiple lines. Common values are verse and
    /// chorus.
    ///
    /// Maps to the MusicXML `name` attribute.
    public let name: String?

    /// Identifies this lyric among multiple lines, such as when the same lyric applies to both a stem-up and a
    /// stem-down voice.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: String?

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

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?

    /// Restricts the element to apply to a specific set of times through a repeated section.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?
}

// MARK: - Equatable

extension MXLLyric: Equatable {
}

// MARK: - Hashable

extension MXLLyric: Hashable {
}

// MARK: - Sendable

extension MXLLyric: Sendable {
}
