// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTuplet.Portion {

    /// The tuplet-type type indicates the graphical note type of the notes for this portion of the tuplet.
    ///
    /// Maps the MusicXML `<tuplet-type>` element.
    public struct Kind {

        // MARK: Public Initializers

        /// Creates a new `MXLTuplet.Portion.Kind`.
        ///
        /// - Parameter value: The value of this element.
        /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
        /// - Parameter color: The color attribute group indicates the color of an element.
        public init(value: MXLNoteKindValue,
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
        /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
        /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
        /// vs. a music font.
        public let font: MXLFont

        /// The value of this element.
        public let value: MXLNoteKindValue
    }
}

// MARK: - Equatable

extension MXLTuplet.Portion.Kind: Equatable {
}

// MARK: - Hashable

extension MXLTuplet.Portion.Kind: Hashable {
}

// MARK: - Sendable

extension MXLTuplet.Portion.Kind: Sendable {
}
