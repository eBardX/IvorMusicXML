// © 2026 John Gary Pusey (see LICENSE.md)

/// The lyric-font type specifies the default font for a particular name and number of lyric.
///
/// Maps the MusicXML `<lyric-font>` element.
public struct MXLLyricFont {

    // MARK: Public Initializers

    /// Creates a new `MXLLyricFont`.
    ///
    /// - Parameter number: The lyric number that this default font applies to.
    /// - Parameter name: The lyric name that this default font applies to.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    public init(number: String? = nil,
                name: String? = nil,
                font: MXLFont = MXLFont()) {
        self.font = font
        self.name = name
        self.number = number
    }

    // MARK: Public Instance Properties

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The lyric name that this default font applies to.
    ///
    /// Maps to the MusicXML `name` attribute.
    public let name: String?

    /// The lyric number that this default font applies to.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: String?
}

// MARK: - Equatable

extension MXLLyricFont: Equatable {
}

// MARK: - Hashable

extension MXLLyricFont: Hashable {
}

// MARK: - Sendable

extension MXLLyricFont: Sendable {
}
