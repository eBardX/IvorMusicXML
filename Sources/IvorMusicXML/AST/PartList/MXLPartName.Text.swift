// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPartName {

    /// The part-name-text attribute group is used by the part-name and part-abbreviation elements. The print-style
    /// and justify attribute groups are deprecated in MusicXML 2.0 in favor of the new part-name-display and part-
    /// abbreviation-display elements.
    public struct Text {

        // MARK: Public Initializers

        /// Creates a new `MXLPartName.Text`.
        ///
        /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
        /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
        /// - Parameter color: The color attribute group indicates the color of an element.
        /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
        /// - Parameter justify: The justify attribute is used to indicate left, center, or right justification. The default value varies for different elements. For elements where the justify attribute is present but the halign attribute is not, the justify attribute indicates horizontal alignment as well as justification.
        public init(position: MXLPosition = MXLPosition(),
                    font: MXLFont = MXLFont(),
                    color: MXLColor? = nil,
                    printsObject: Bool? = nil,
                    justify: MXLLeftCenterRight? = nil) {
            self.color = color
            self.font = font
            self.justify = justify
            self.position = position
            self.printsObject = printsObject
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

        /// The justify attribute is used to indicate left, center, or right justification. The default value varies for
        /// different elements. For elements where the justify attribute is present but the halign attribute is not, the
        /// justify attribute indicates horizontal alignment as well as justification.
        ///
        /// Maps to the MusicXML `justify` attribute.
        public let justify: MXLLeftCenterRight?

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

        /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
        /// specified.
        ///
        /// Maps to the MusicXML `print-object` attribute.
        public let printsObject: Bool?
    }
}

// MARK: - Equatable

extension MXLPartName.Text: Equatable {
}

// MARK: - Hashable

extension MXLPartName.Text: Hashable {
}

// MARK: - Sendable

extension MXLPartName.Text: Sendable {
}
