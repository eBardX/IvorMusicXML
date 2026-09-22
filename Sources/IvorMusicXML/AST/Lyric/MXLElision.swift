// © 2026 John Gary Pusey (see LICENSE.md)

/// The elision type represents an elision between lyric syllables. The text content specifies the symbol used to
/// display the elision. Common values are a no-break space (Unicode 00A0), an underscore (Unicode 005F), or an
/// undertie (Unicode 203F). If the text content is empty, the smufl attribute is used to specify the symbol to
/// use. Its value is a SMuFL canonical glyph name that starts with lyrics. The SMuFL attribute is ignored if the
/// elision glyph is already specified by the text content. If neither text content nor a smufl attribute are
/// present, the elision glyph is application-specific.
///
/// Maps the MusicXML `<elision>` element.
public struct MXLElision {

    // MARK: Public Initializers

    /// Creates a new `MXLElision`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter smufl:  The SMuFL canonical glyph name used to specify the elision symbol when the text content is empty.
    public init(value: String,
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                smufl: MXLSmuflLyricsGlyphName? = nil) {
        self.color = color
        self.font = font
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The SMuFL canonical glyph name used to specify the elision symbol when the text content is empty.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflLyricsGlyphName?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLElision: Equatable {
}

// MARK: - Hashable

extension MXLElision: Hashable {
}

// MARK: - Sendable

extension MXLElision: Sendable {
}
