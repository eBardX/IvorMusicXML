// © 2026 John Gary Pusey (see LICENSE.md)

/// Time signatures are represented by the beats element for the numerator and the beat-type element for the
/// denominator. The symbol attribute is used to indicate common and cut time symbols as well as a single number
/// display. Multiple pairs of beat and beat-type elements are used for composite time signatures with multiple
/// denominators, such as 2/4 + 3/8. A composite such as 3+2/8 requires only one beat/beat-type pair.
///
/// The print-object attribute allows a time signature to be specified but not printed, as is the case for
/// excerpts from the middle of a score. The value is “yes” if not present. The optional number attribute refers
/// to staff numbers within the part. If absent, the time signature applies to all staves in the part.
///
/// Maps the MusicXML `<time>` element.
public struct MXLTime {

    // MARK: Public Initializers

    /// Creates a new `MXLTime`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter content: One of the alternatives for Time.
    /// - Parameter number: The staff number within the part that this element applies to. If absent, the time signature applies to all staves in the part.
    /// - Parameter symbol: The symbol used to indicate common and cut time as well as a single number display.
    /// - Parameter separator: How the beats and beat-type values are displayed relative to one another. `.stacked` if not specified.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
    /// - Parameter valign: The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. Defaults are implementation-dependent.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    public init(id: String? = nil,
                content: Content,
                number: MXLStaffNumber? = nil,
                symbol: MXLTimeSymbol? = nil,
                separator: MXLTimeSeparator? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                halign: MXLLeftCenterRight? = nil,
                valign: MXLValign? = nil,
                printsObject: Bool? = nil) {
        self.color = color
        self.content = content
        self.font = font
        self.halign = halign
        self.id = id
        self.number = number
        self.position = position
        self.printsObject = printsObject
        self.separator = separator ?? .stacked
        self.symbol = symbol
        self.valign = valign
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// One of the alternatives for Time.
    public let content: Content

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

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

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The staff number within the part that this element applies to. If absent, the time signature applies to all staves in the part.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLStaffNumber?

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

    /// How the beats and beat-type values are displayed relative to one another. `.stacked` if not
    /// specified.
    ///
    /// Maps to the MusicXML `separator` attribute.
    public let separator: MXLTimeSeparator

    /// The symbol used to indicate common and cut time as well as a single number display.
    ///
    /// Maps to the MusicXML `symbol` attribute.
    public let symbol: MXLTimeSymbol?

    /// The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the
    /// text. Defaults are implementation-dependent.
    ///
    /// Maps to the MusicXML `valign` attribute.
    public let valign: MXLValign?
}

// MARK: - Equatable

extension MXLTime: Equatable {
}

// MARK: - Hashable

extension MXLTime: Hashable {
}

// MARK: - Sendable

extension MXLTime: Sendable {
}
