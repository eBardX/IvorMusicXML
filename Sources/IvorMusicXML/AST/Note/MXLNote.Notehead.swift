// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNote {

    /// The notehead type indicates shapes other than the open and closed ovals associated with note durations.
    ///
    /// The smufl attribute can be used to specify a particular notehead, allowing application interoperability
    /// without requiring every SMuFL glyph to have a MusicXML element equivalent. This attribute can be used either
    /// with the “other” value, or to refine a specific notehead value such as “cluster”. Noteheads in the SMuFL Note
    /// name noteheads and Note name noteheads supplement ranges (U+E150–U+E1AF and U+EEE0–U+EEFF) should not use the
    /// smufl attribute or the “other” value, but instead use the notehead-text element.
    ///
    /// For the enclosed shapes, the default is to be hollow for half notes and longer, and filled otherwise. The
    /// filled attribute can be set to change this if needed.
    ///
    /// If the parentheses attribute is set to yes, the notehead is parenthesized. It is no by default.
    ///
    /// Maps the MusicXML `<notehead>` element.
    public struct Notehead {

        // MARK: Public Initializers

        /// Creates a new `MXLNote.Notehead`.
        ///
        /// - Parameter value:           The value of this element.
        /// - Parameter isFilled:        A Boolean value indicating whether the notehead is filled. Defaults to hollow for half notes and longer, and filled otherwise.
        /// - Parameter hasParentheses:  A Boolean value indicating whether the notehead is parenthesized. Defaults to `false` if not specified.
        /// - Parameter font:            The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
        /// - Parameter color:           The color attribute group indicates the color of an element.
        /// - Parameter smufl:           The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character. Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an element.
        public init(value: Value,
                    isFilled: Bool? = nil,
                    hasParentheses: Bool? = nil,
                    font: MXLFont = MXLFont(),
                    color: MXLColor? = nil,
                    smufl: MXLSmuflGlyphName? = nil) {
            self.color = color
            self.isFilled = isFilled
            self.font = font
            self.hasParentheses = hasParentheses ?? false
            self.smufl = smufl
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

        /// A Boolean value indicating whether the notehead is parenthesized. Defaults to `false` if not specified.
        ///
        /// Maps to the MusicXML `parentheses` attribute.
        public let hasParentheses: Bool

        /// A Boolean value indicating whether the notehead is filled. Defaults to hollow for half notes and longer, and
        /// filled otherwise.
        ///
        /// Maps to the MusicXML `filled` attribute.
        public let isFilled: Bool?

        /// The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character.
        /// Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an
        /// element.
        ///
        /// Maps to the MusicXML `smufl` attribute.
        public let smufl: MXLSmuflGlyphName?

        /// The value of this element.
        public let value: Value
    }
}

// MARK: - Equatable

extension MXLNote.Notehead: Equatable {
}

// MARK: - Hashable

extension MXLNote.Notehead: Hashable {
}

// MARK: - Sendable

extension MXLNote.Notehead: Sendable {
}
