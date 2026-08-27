// © 2026 John Gary Pusey (see LICENSE.md)

/// The figured-bass element represents figured bass notation. Figured bass elements take their position from the
/// first regular note (not a grace note or chord note) that follows in score order. The optional duration element
/// is used to indicate changes of figures under a note.
///
/// Figures are ordered from top to bottom. The value of parentheses is “no” if not present.
///
/// Maps the MusicXML `<figured-bass>` element.
public struct MXLFiguredBass {

    // MARK: Public Initializers

    /// Creates a new `MXLFiguredBass`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter figure:  The individual figures, ordered from top to bottom.
    /// - Parameter duration: The duration element is defined within a group due to its uses within the note, figured-bass, backup, and forward elements.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
    /// - Parameter valign: The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. Defaults are implementation-dependent.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter printout: The printout attribute group collects the different controls over printing an object (e.g. a note or rest) and its parts, including augmentation dots and lyrics. This is especially useful for notes that overlap in different voices, or for chord sheets that contain lyrics and chords but no melody.
    /// - Parameter hasParentheses:  A Boolean value indicating whether the figures are enclosed in parentheses. `false` if not specified.
    public init(id: String? = nil,
                figure: [MXLFigure] = [],
                duration: MXLPositiveDivisions? = nil,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                halign: MXLLeftCenterRight? = nil,
                valign: MXLValign? = nil,
                placement: MXLAboveBelow? = nil,
                printout: MXLPrintout = MXLPrintout(),
                hasParentheses: Bool? = nil) {
        self.color = color
        self.duration = duration
        self.figure = figure
        self.font = font
        self.footnote = footnote
        self.halign = halign
        self.hasParentheses = hasParentheses
        self.id = id
        self.level = level
        self.placement = placement
        self.position = position
        self.printout = printout
        self.valign = valign
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The duration element is defined within a group due to its uses within the note, figured-bass, backup, and
    /// forward elements.
    ///
    /// Maps to a nested MusicXML `<duration>` element.
    public let duration: MXLPositiveDivisions?

    /// The individual figures, ordered from top to bottom.
    ///
    /// Maps to nested MusicXML `<figure>` elements.
    public let figure: [MXLFigure]

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

    /// In cases where text extends over more than one line, horizontal alignment and justify values can be different.
    /// The most typical case is for credits, such as:
    ///
    /// Words and music by Pat Songwriter
    ///
    /// Typically this type of credit is aligned to the right, so that the position information refers to the right-
    /// most part of the text. But in this example, the text is center-justified, not right-justified.
    ///
    /// The halign attribute is used in these situations. If it is not present, its value is the same as for the
    /// justify attribute. For elements where a justify attribute is not allowed, the default is implementation-
    /// dependent.
    ///
    /// Maps to the MusicXML `halign` attribute.
    public let halign: MXLLeftCenterRight?

    /// A Boolean value indicating whether the figures are enclosed in parentheses. `false` if not specified.
    ///
    /// Maps to the MusicXML `parentheses` attribute.
    public let hasParentheses: Bool?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

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

    /// The printout attribute group collects the different controls over printing an object (e.g. a note or rest) and
    /// its parts, including augmentation dots and lyrics. This is especially useful for notes that overlap in
    /// different voices, or for chord sheets that contain lyrics and chords but no melody.
    ///
    /// By default, all these attributes are set to yes. If print-object is set to no, the print-dot and print-lyric
    /// attributes are interpreted to also be set to no if they are not present.
    public let printout: MXLPrintout

    /// The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the
    /// text. Defaults are implementation-dependent.
    ///
    /// Maps to the MusicXML `valign` attribute.
    public let valign: MXLValign?
}

// MARK: - Equatable

extension MXLFiguredBass: Equatable {
}

// MARK: - Hashable

extension MXLFiguredBass: Hashable {
}

// MARK: - Sendable

extension MXLFiguredBass: Sendable {
}
