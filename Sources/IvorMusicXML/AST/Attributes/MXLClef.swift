// © 2026 John Gary Pusey (see LICENSE.md)

/// Clefs are represented by a combination of sign, line, and clef-octave-change elements. The optional number
/// attribute refers to staff numbers within the part. A value of 1 is assumed if not present.
///
/// Sometimes clefs are added to the staff in non-standard line positions, either to indicate cue passages, or
/// when there are multiple clefs present simultaneously on one staff. In this situation, the additional attribute
/// is set to “yes” and the line value is ignored. The size attribute is used for clefs where the additional
/// attribute is “yes”. It is typically used to indicate cue clefs.
///
/// Sometimes clefs at the start of a measure need to appear after the barline rather than before, as for cues or
/// for use after a repeated section. The after-barline attribute is set to “yes” in this situation. The attribute
/// is ignored for mid-measure clefs.
///
/// Clefs appear at the start of each system unless the print-object attribute has been set to “no” or the
/// additional attribute has been set to “yes”.
///
/// Maps the MusicXML `<clef>` element.
public struct MXLClef {

    // MARK: Public Initializers

    /// Creates a new `MXLClef`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter content: Clefs are represented by a combination of sign, line, and clef-octave-change elements.
    /// - Parameter number:  The staff number within the part that this element applies to. A value of 1 is assumed if not present.
    /// - Parameter isAdditional:  A Boolean value indicating whether this clef is in a non-standard line position, such as for a cue passage or when multiple clefs are present on one staff simultaneously.
    /// - Parameter size:  The size of the clef, used when `additional` is `true`, typically to indicate cue clefs.
    /// - Parameter isAfterBarline:  A Boolean value indicating whether this clef appears after the barline rather than before it, as for cues or after a repeated section.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    public init(id: String? = nil,
                content: Content,
                number: MXLStaffNumber? = nil,
                isAdditional: Bool? = nil,
                size: MXLSymbolSize? = nil,
                isAfterBarline: Bool? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                printsObject: Bool? = nil) {
        self.isAdditional = isAdditional
        self.isAfterBarline = isAfterBarline
        self.color = color
        self.content = content
        self.font = font
        self.id = id
        self.number = number
        self.position = position
        self.printsObject = printsObject
        self.size = size
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// Clefs are represented by a combination of sign, line, and clef-octave-change elements.
    public let content: Content

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// A Boolean value indicating whether this clef is in a non-standard line position, such as for a cue passage or
    /// when multiple clefs are present on one staff simultaneously.
    ///
    /// Maps to the MusicXML `additional` attribute.
    public let isAdditional: Bool?

    /// A Boolean value indicating whether this clef appears after the barline rather than before it, as for cues or
    /// after a repeated section.
    ///
    /// Maps to the MusicXML `after-barline` attribute.
    public let isAfterBarline: Bool?

    /// The staff number within the part that this element applies to. A value of 1 is assumed if not present.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLStaffNumber?

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

    /// The size of the clef, used when `additional` is `true`, typically to indicate cue clefs.
    ///
    /// Maps to the MusicXML `size` attribute.
    public let size: MXLSymbolSize?
}

// MARK: - Equatable

extension MXLClef: Equatable {
}

// MARK: - Hashable

extension MXLClef: Hashable {
}

// MARK: - Sendable

extension MXLClef: Sendable {
}
