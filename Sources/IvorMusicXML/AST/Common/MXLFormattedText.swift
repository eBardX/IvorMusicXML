// © 2026 John Gary Pusey (see LICENSE.md)

/// The formatted-text type represents a text element with text-formatting attributes.
///
/// Maps the MusicXML `<display-text>` and `<footnote>` elements.
public struct MXLFormattedText {

    // MARK: Public Initializers

    /// Creates a new `MXLFormattedText`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter justify: The justify attribute is used to indicate left, center, or right justification. The default value varies for different elements. For elements where the justify attribute is present but the halign attribute is not, the justify attribute indicates horizontal alignment as well as justification.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
    /// - Parameter valign: The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. Defaults are implementation-dependent.
    /// - Parameter underline: The number of lines used to underline the text: `0` (none), `1`, `2`, or `3`.
    /// - Parameter overline: The number of lines used to overline the text: `0` (none), `1`, `2`, or `3`.
    /// - Parameter lineThrough: The number of lines used to strike through the text: `0` (none), `1`, `2`, or `3`.
    /// - Parameter rotation: The rotation attribute is used to rotate text around the alignment point specified by the halign and valign attributes. Positive values are clockwise rotations, while negative values are counter-clockwise rotations.
    /// - Parameter letterSpacing: The letter-spacing attribute specifies text tracking. Values are either “normal” or a number representing the number of ems to add between each letter. The number may be negative in order to subtract space. The default is normal, which allows flexibility of letter-spacing for purposes of text justification.
    /// - Parameter lineHeight: The line-height attribute specifies text leading. Values are either “normal” or a number representing the percentage of the current font height to use for leading. The default is “normal”. The exact normal value is implementation-dependent, but values between 100 and 120 are recommended.
    /// - Parameter xmlLang: The xml:lang attribute value.
    /// - Parameter xmlSpace: The xml:space attribute value.
    /// - Parameter dir: The text-direction attribute is used to adjust and override the Unicode bidirectional text algorithm, similar to the Directionality data category in the W3C Internationalization Tag Set recommendation.
    /// - Parameter enclosure: The enclosure attribute group is used to specify the formatting of an enclosure around text or symbols.
    public init(value: String,
                justify: MXLLeftCenterRight? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                halign: MXLLeftCenterRight? = nil,
                valign: MXLValign? = nil,
                underline: MXLNumberOfLines? = nil,
                overline: MXLNumberOfLines? = nil,
                lineThrough: MXLNumberOfLines? = nil,
                rotation: MXLRotationDegrees? = nil,
                letterSpacing: MXLNumberOrNormal? = nil,
                lineHeight: MXLNumberOrNormal? = nil,
                xmlLang: String? = nil,
                xmlSpace: MXLXmlSpace? = nil,
                dir: MXLTextDirection? = nil,
                enclosure: MXLEnclosureShape? = nil) {
        self.color = color
        self.dir = dir ?? .ltr
        self.enclosure = enclosure
        self.font = font
        self.halign = halign
        self.justify = justify
        self.letterSpacing = letterSpacing ?? .normal
        self.lineHeight = lineHeight ?? .normal
        self.lineThrough = lineThrough
        self.overline = overline
        self.position = position
        self.rotation = rotation
        self.underline = underline
        self.valign = valign
        self.xmlLang = xmlLang
        self.xmlSpace = xmlSpace
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The text-direction attribute is used to adjust and override the Unicode bidirectional text algorithm, similar
    /// to the Directionality data category in the W3C Internationalization Tag Set recommendation.
    ///
    /// Maps to the MusicXML `dir` attribute.
    public let dir: MXLTextDirection

    /// The enclosure attribute group is used to specify the formatting of an enclosure around text or symbols.
    ///
    /// Maps to the MusicXML `enclosure` attribute.
    public let enclosure: MXLEnclosureShape?

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

    /// The justify attribute is used to indicate left, center, or right justification. The default value varies for
    /// different elements. For elements where the justify attribute is present but the halign attribute is not, the
    /// justify attribute indicates horizontal alignment as well as justification.
    ///
    /// Maps to the MusicXML `justify` attribute.
    public let justify: MXLLeftCenterRight?

    /// The letter-spacing attribute specifies text tracking. Values are either “normal” or a number representing the
    /// number of ems to add between each letter. The number may be negative in order to subtract space. The default
    /// is normal, which allows flexibility of letter-spacing for purposes of text justification.
    ///
    /// Maps to the MusicXML `letter-spacing` attribute.
    public let letterSpacing: MXLNumberOrNormal

    /// The line-height attribute specifies text leading. Values are either “normal” or a number representing the
    /// percentage of the current font height to use for leading. The default is “normal”. The exact normal value is
    /// implementation-dependent, but values between 100 and 120 are recommended.
    ///
    /// Maps to the MusicXML `line-height` attribute.
    public let lineHeight: MXLNumberOrNormal

    /// The number of lines used to strike through the text: `0` (none), `1`, `2`, or `3`.
    ///
    /// Maps to the MusicXML `line-through` attribute.
    public let lineThrough: MXLNumberOfLines?

    /// The number of lines used to overline the text: `0` (none), `1`, `2`, or `3`.
    ///
    /// Maps to the MusicXML `overline` attribute.
    public let overline: MXLNumberOfLines?

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

    /// The rotation attribute is used to rotate text around the alignment point specified by the halign and valign
    /// attributes. Positive values are clockwise rotations, while negative values are counter-clockwise rotations.
    ///
    /// Maps to the MusicXML `rotation` attribute.
    public let rotation: MXLRotationDegrees?

    /// The number of lines used to underline the text: `0` (none), `1`, `2`, or `3`.
    ///
    /// Maps to the MusicXML `underline` attribute.
    public let underline: MXLNumberOfLines?

    /// The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the
    /// text. Defaults are implementation-dependent.
    ///
    /// Maps to the MusicXML `valign` attribute.
    public let valign: MXLValign?

    /// The value of this element.
    public let value: String

    /// The xml:lang attribute value.
    ///
    /// Maps to the MusicXML `xml:lang` attribute.
    public let xmlLang: String?

    /// The xml:space attribute value.
    ///
    /// Maps to the MusicXML `xml:space` attribute.
    public let xmlSpace: MXLXmlSpace?
}

// MARK: - Equatable

extension MXLFormattedText: Equatable {
}

// MARK: - Hashable

extension MXLFormattedText: Hashable {
}

// MARK: - Sendable

extension MXLFormattedText: Sendable {
}
