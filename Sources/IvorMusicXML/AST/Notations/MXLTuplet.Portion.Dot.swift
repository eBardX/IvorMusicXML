// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTuplet.Portion {

    /// The tuplet-dot type is used to specify dotted tuplet types.
    ///
    /// Maps the MusicXML `<tuplet-dot>` element.
    public struct Dot {

        // MARK: Public Initializers

        /// Creates a new `MXLTuplet.Portion.Dot`.
        ///
        /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
        /// - Parameter color: The color attribute group indicates the color of an element.
        public init(font: MXLFont = MXLFont(),
                    color: MXLColor? = nil) {
            self.color = color
            self.font = font
        }

        // MARK: Public Instance Properties

        /// The color attribute group indicates the color of an element.
        public let color: MXLColor?

        /// The font attribute group gathers together attributes for determining the font within a credit or direction.
        /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
        /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
        /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
        /// vs. a music font.
        public let font: MXLFont
    }
}

// MARK: - Equatable

extension MXLTuplet.Portion.Dot: Equatable {
}

// MARK: - Hashable

extension MXLTuplet.Portion.Dot: Hashable {
}

// MARK: - Sendable

extension MXLTuplet.Portion.Dot: Sendable {
}
