// © 2026 John Gary Pusey (see LICENSE.md)

/// The fret element is used with tablature notation and chord diagrams. Fret numbers start with 0 for an open
/// string and 1 for the first fret.
///
/// Maps the MusicXML `<fret>` element.
public struct MXLFret {

    // MARK: Public Initializers

    /// Creates a new `MXLFret`.
    ///
    /// - Parameter value:  The value of this element.
    /// - Parameter font:   The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color:  The color attribute group indicates the color of an element.
    public init(value: Int,
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil) {
        self.color = color
        self.font = font
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

    /// The value of this element.
    public let value: Int
}

// MARK: - Equatable

extension MXLFret: Equatable {
}

// MARK: - Hashable

extension MXLFret: Hashable {
}

// MARK: - Sendable

extension MXLFret: Sendable {
}
