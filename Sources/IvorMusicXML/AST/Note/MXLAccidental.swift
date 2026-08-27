// © 2026 John Gary Pusey (see LICENSE.md)

/// The accidental type represents actual notated accidentals. Editorial and cautionary indications are indicated
/// by attributes. Values for these attributes are “no” if not present. Specific graphic display such as
/// parentheses, brackets, and size are controlled by the level-display attribute group.
///
/// Maps the MusicXML `<accidental>` element.
public struct MXLAccidental {

    // MARK: Public Initializers

    /// Creates a new `MXLAccidental`.
    ///
    /// - Parameter value:         The value of this element.
    /// - Parameter isCautionary:  A Boolean value indicating whether this accidental is cautionary.
    /// - Parameter isEditorial:   A Boolean value indicating whether this accidental is editorial.
    /// - Parameter levelDisplay:  The level-display attribute group specifies three common ways to indicate editorial indications: putting parentheses or square brackets around a symbol, or making the symbol a different size. If not specified, they are left to application defaults. It is used by the level and accidental elements.
    /// - Parameter position:      For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font:          The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color:         The color attribute group indicates the color of an element.
    /// - Parameter smufl:         The SMuFL canonical glyph name used to specify a particular accidental character.
    public init(value: MXLAccidentalValue,
                isCautionary: Bool? = nil,
                isEditorial: Bool? = nil,
                levelDisplay: MXLLevel.Display = MXLLevel.Display(),
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                smufl: MXLSmuflAccidentalGlyphName? = nil) {
        self.isCautionary = isCautionary
        self.color = color
        self.isEditorial = isEditorial
        self.font = font
        self.levelDisplay = levelDisplay
        self.position = position
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

    /// A Boolean value indicating whether this accidental is cautionary.
    ///
    /// Maps to the MusicXML `cautionary` attribute.
    public let isCautionary: Bool?

    /// A Boolean value indicating whether this accidental is editorial.
    ///
    /// Maps to the MusicXML `editorial` attribute.
    public let isEditorial: Bool?

    /// The level-display attribute group specifies three common ways to indicate editorial indications: putting
    /// parentheses or square brackets around a symbol, or making the symbol a different size. If not specified, they
    /// are left to application defaults. It is used by the level and accidental elements.
    public let levelDisplay: MXLLevel.Display

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

    /// The SMuFL canonical glyph name used to specify a particular accidental character.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflAccidentalGlyphName?

    /// The value of this element.
    public let value: MXLAccidentalValue
}

// MARK: - Equatable

extension MXLAccidental: Equatable {
}

// MARK: - Hashable

extension MXLAccidental: Hashable {
}

// MARK: - Sendable

extension MXLAccidental: Sendable {
}
