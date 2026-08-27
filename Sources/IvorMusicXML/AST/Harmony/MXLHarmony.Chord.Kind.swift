// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmony.Chord {

    /// Kind indicates the type of chord. Degree elements can then add, subtract, or alter from these starting points.
    ///
    /// The attributes are used to indicate the formatting of the symbol. Since the kind element is the constant in
    /// all the harmony-chord groups that can make up a polychord, many formatting attributes are here.
    ///
    /// The use-symbols attribute is yes if the kind should be represented when possible with harmony symbols rather
    /// than letters and numbers. These symbols include:
    ///
    /// major: a triangle, like Unicode 25B3 minor: -, like Unicode 002D augmented: +, like Unicode 002B diminished:
    /// °, like Unicode 00B0 half-diminished: ø, like Unicode 00F8
    ///
    /// For the major-minor kind, only the minor symbol is used when use-symbols is yes. The major symbol is set using
    /// the symbol attribute in the degree-value element. The corresponding degree-alter value will usually be 0 in
    /// this case.
    ///
    /// The text attribute describes how the kind should be spelled in a score. If use-symbols is yes, the value of
    /// the text attribute follows the symbol. The stack-degrees attribute is yes if the degree elements should be
    /// stacked above each other. The parentheses-degrees attribute is yes if all the degrees should be in
    /// parentheses. The bracket-degrees attribute is yes if all the degrees should be in a bracket. If not specified,
    /// these values are implementation-specific. The alignment attributes are for the entire harmony-chord group of
    /// which this kind element is a part.
    ///
    /// The text attribute may use strings such as “13sus” that refer to both the kind and one or more degree
    /// elements. In this case, the corresponding degree elements should have the print-object attribute set to “no”
    /// to keep redundant alterations from being displayed.
    public struct Kind {

        // MARK: Public Initializers

        /// Creates a new `MXLHarmony.Chord.Kind`.
        ///
        /// - Parameter value: The value of this element.
        /// - Parameter usesSymbols: A Boolean value indicating whether the kind should be represented when possible with harmony symbols rather than letters and numbers.
        /// - Parameter text: Describes how the kind should be spelled in a score. If `usesSymbols` is `true`, the value of `text` follows the symbol.
        /// - Parameter areDegreesStacked: A Boolean value indicating whether the degree elements should be stacked above each other.
        /// - Parameter areDegreesInParentheses: A Boolean value indicating whether all the degrees should be in parentheses.
        /// - Parameter areDegreesBracketed: A Boolean value indicating whether all the degrees should be in a bracket.
        /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
        /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
        /// - Parameter color: The color attribute group indicates the color of an element.
        /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
        /// - Parameter valign: The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. Defaults are implementation-dependent.
        public init(value: Value,
                    usesSymbols: Bool? = nil,
                    text: String? = nil,
                    areDegreesStacked: Bool? = nil,
                    areDegreesInParentheses: Bool? = nil,
                    areDegreesBracketed: Bool? = nil,
                    position: MXLPosition = MXLPosition(),
                    font: MXLFont = MXLFont(),
                    color: MXLColor? = nil,
                    halign: MXLLeftCenterRight? = nil,
                    valign: MXLValign? = nil) {
            self.areDegreesBracketed = areDegreesBracketed
            self.areDegreesInParentheses = areDegreesInParentheses
            self.areDegreesStacked = areDegreesStacked
            self.color = color
            self.font = font
            self.halign = halign
            self.position = position
            self.text = text
            self.usesSymbols = usesSymbols
            self.valign = valign
            self.value = value
        }

        // MARK: Public Instance Properties

        /// A Boolean value indicating whether all the degrees should be in a bracket.
        ///
        /// Maps to the MusicXML `bracket-degrees` attribute.
        public let areDegreesBracketed: Bool?

        /// A Boolean value indicating whether all the degrees should be in parentheses.
        ///
        /// Maps to the MusicXML `parentheses-degrees` attribute.
        public let areDegreesInParentheses: Bool?

        /// A Boolean value indicating whether the degree elements should be stacked above each other.
        ///
        /// Maps to the MusicXML `stack-degrees` attribute.
        public let areDegreesStacked: Bool?

        /// The color attribute group indicates the color of an element.
        public let color: MXLColor?

        /// The font attribute group gathers together attributes for determining the font within a credit or direction.
        /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
        /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
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

        /// Describes how the kind should be spelled in a score. If `usesSymbols` is `true`, the value of `text`
        /// follows the symbol.
        ///
        /// Maps to the MusicXML `text` attribute.
        public let text: String?

        /// A Boolean value indicating whether the kind should be represented when possible with harmony symbols
        /// rather than letters and numbers.
        ///
        /// Maps to the MusicXML `use-symbols` attribute.
        public let usesSymbols: Bool?

        /// The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the
        /// text. Defaults are implementation-dependent.
        ///
        /// Maps to the MusicXML `valign` attribute.
        public let valign: MXLValign?

        /// The value of this element.
        public let value: Value
    }
}

// MARK: - Equatable

extension MXLHarmony.Chord.Kind: Equatable {
}

// MARK: - Hashable

extension MXLHarmony.Chord.Kind: Hashable {
}

// MARK: - Sendable

extension MXLHarmony.Chord.Kind: Sendable {
}
