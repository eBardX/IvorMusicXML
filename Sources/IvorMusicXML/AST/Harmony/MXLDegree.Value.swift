// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDegree {

    /// The content of the degree-value type is a number indicating the degree of the chord (1 for the root, 3 for
    /// third, etc). The text attribute specifies how the value of the degree should be displayed. The symbol
    /// attribute indicates that a symbol should be used in specifying the degree. If the symbol attribute is present,
    /// the value of the text attribute follows the symbol.
    ///
    /// Maps the MusicXML `<degree-value>` element.
    public struct Value {

        // MARK: Public Initializers

        /// Creates a new `MXLDegree.Value`.
        ///
        /// - Parameter value: The value of this element.
        /// - Parameter symbol:  Indicates that a symbol should be used in specifying the degree. If present, the value of `text` follows the symbol.
        /// - Parameter text:  Specifies how the value of the degree should be displayed.
        /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
        /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
        /// - Parameter color: The color attribute group indicates the color of an element.
        public init(value: Int,
                    symbol: SymbolValue? = nil,
                    text: String? = nil,
                    position: MXLPosition = MXLPosition(),
                    font: MXLFont = MXLFont(),
                    color: MXLColor? = nil) {
            self.color = color
            self.font = font
            self.position = position
            self.symbol = symbol
            self.text = text
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

        /// Indicates that a symbol should be used in specifying the degree. If present, the value of `text` follows
        /// the symbol.
        ///
        /// Maps to the MusicXML `symbol` attribute.
        public let symbol: SymbolValue?

        /// Specifies how the value of the degree should be displayed.
        ///
        /// Maps to the MusicXML `text` attribute.
        public let text: String?

        /// The value of this element.
        public let value: Int
    }
}

// MARK: - Equatable

extension MXLDegree.Value: Equatable {
}

// MARK: - Hashable

extension MXLDegree.Value: Hashable {
}

// MARK: - Sendable

extension MXLDegree.Value: Sendable {
}
