// © 2026 John Gary Pusey (see LICENSE.md)

/// The text-element-data type represents a syllable or portion of a syllable for lyric text underlay. A hyphen in
/// the string content should only be used for an actual hyphenated word. Language names for text elements come
/// from ISO 639, with optional country subcodes from ISO 3166.
///
/// Maps the MusicXML `<text>` element.
public struct MXLTextElementData {

    // MARK: Public Initializers

    /// Creates a new `MXLTextElementData`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter underline: The number of lines used to underline the text: `0` (none), `1`, `2`, or `3`.
    /// - Parameter overline: The number of lines used to overline the text: `0` (none), `1`, `2`, or `3`.
    /// - Parameter lineThrough: The number of lines used to strike through the text: `0` (none), `1`, `2`, or `3`.
    /// - Parameter rotation: The rotation attribute is used to rotate text around the alignment point specified by the halign and valign attributes. Positive values are clockwise rotations, while negative values are counter-clockwise rotations.
    /// - Parameter letterSpacing: The letter-spacing attribute specifies text tracking. Values are either “normal” or a number representing the number of ems to add between each letter. The number may be negative in order to subtract space. The default is normal, which allows flexibility of letter-spacing for purposes of text justification.
    /// - Parameter xmlLang: The xml:lang attribute value.
    /// - Parameter dir: The text-direction attribute is used to adjust and override the Unicode bidirectional text algorithm, similar to the Directionality data category in the W3C Internationalization Tag Set recommendation.
    public init(value: String,
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                underline: MXLNumberOfLines? = nil,
                overline: MXLNumberOfLines? = nil,
                lineThrough: MXLNumberOfLines? = nil,
                rotation: MXLRotationDegrees? = nil,
                letterSpacing: MXLNumberOrNormal? = nil,
                xmlLang: String? = nil,
                dir: MXLTextDirection? = nil) {
        self.color = color
        self.dir = dir ?? .ltr
        self.font = font
        self.letterSpacing = letterSpacing ?? .normal
        self.lineThrough = lineThrough
        self.overline = overline
        self.rotation = rotation
        self.underline = underline
        self.value = value
        self.xmlLang = xmlLang
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The text-direction attribute is used to adjust and override the Unicode bidirectional text algorithm, similar
    /// to the Directionality data category in the W3C Internationalization Tag Set recommendation.
    ///
    /// Maps to the MusicXML `dir` attribute.
    public let dir: MXLTextDirection

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The letter-spacing attribute specifies text tracking. Values are either “normal” or a number representing the
    /// number of ems to add between each letter. The number may be negative in order to subtract space. The default
    /// is normal, which allows flexibility of letter-spacing for purposes of text justification.
    ///
    /// Maps to the MusicXML `letter-spacing` attribute.
    public let letterSpacing: MXLNumberOrNormal

    /// The number of lines used to strike through the text: `0` (none), `1`, `2`, or `3`.
    ///
    /// Maps to the MusicXML `line-through` attribute.
    public let lineThrough: MXLNumberOfLines?

    /// The number of lines used to overline the text: `0` (none), `1`, `2`, or `3`.
    ///
    /// Maps to the MusicXML `overline` attribute.
    public let overline: MXLNumberOfLines?

    /// The rotation attribute is used to rotate text around the alignment point specified by the halign and valign
    /// attributes. Positive values are clockwise rotations, while negative values are counter-clockwise rotations.
    ///
    /// Maps to the MusicXML `rotation` attribute.
    public let rotation: MXLRotationDegrees?

    /// The number of lines used to underline the text: `0` (none), `1`, `2`, or `3`.
    ///
    /// Maps to the MusicXML `underline` attribute.
    public let underline: MXLNumberOfLines?

    /// The value of this element.
    public let value: String

    /// The xml:lang attribute value.
    ///
    /// Maps to the MusicXML `xml:lang` attribute.
    public let xmlLang: String?
}

// MARK: - Equatable

extension MXLTextElementData: Equatable {
}

// MARK: - Hashable

extension MXLTextElementData: Hashable {
}

// MARK: - Sendable

extension MXLTextElementData: Sendable {
}
