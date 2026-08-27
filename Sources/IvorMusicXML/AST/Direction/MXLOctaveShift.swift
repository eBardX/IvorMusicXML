// © 2026 John Gary Pusey (see LICENSE.md)

/// The octave shift type indicates where notes are shifted up or down from their true pitched values because of
/// printing difficulty. Thus a treble clef line noted with 8va will be indicated with an octave-shift down from
/// the pitch data indicated in the notes. A size of 8 indicates one octave; a size of 15 indicates two octaves.
///
/// Maps the MusicXML `<octave-shift>` element.
public struct MXLOctaveShift {

    // MARK: Public Initializers

    /// Creates a new `MXLOctaveShift`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind: Whether the shifted notes are up or down, and whether this element starts, stops, or continues the shift.
    /// - Parameter number: Distinguishes multiple octave shifts occurring simultaneously.
    /// - Parameter size: Defaults to `8`.
    /// - Parameter dashLength:  The length, in tenths, of the dashes in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter spaceLength:  The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(id: String? = nil,
                kind: MXLUpDownStopContinue,
                number: MXLNumberLevel? = nil,
                size: Int? = nil,
                dashLength: MXLTenths? = nil,
                spaceLength: MXLTenths? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil) {
        self.color = color
        self.dashLength = dashLength
        self.font = font
        self.id = id
        self.number = number
        self.position = position
        self.size = size ?? 8
        self.spaceLength = spaceLength
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The length, in tenths, of the dashes in a dashed line. Ignored if the corresponding line-type attribute is
    /// not dashed.
    ///
    /// Maps to the MusicXML `dash-length` attribute.
    public let dashLength: MXLTenths?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Whether the shifted notes are up or down, and whether this element starts, stops, or continues the shift.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLUpDownStopContinue

    /// Distinguishes multiple octave shifts occurring simultaneously.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLNumberLevel?

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

    /// Defaults to `8`.
    ///
    /// Maps to the MusicXML `size` attribute.
    public let size: Int

    /// The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is
    /// not dashed.
    ///
    /// Maps to the MusicXML `space-length` attribute.
    public let spaceLength: MXLTenths?
}

// MARK: - Equatable

extension MXLOctaveShift: Equatable {
}

// MARK: - Hashable

extension MXLOctaveShift: Hashable {
}

// MARK: - Sendable

extension MXLOctaveShift: Sendable {
}
