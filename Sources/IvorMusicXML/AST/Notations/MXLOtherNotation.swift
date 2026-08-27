// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiTools

/// The other-notation type is used to define any notations not yet in the MusicXML format. It handles notations
/// where more specific extension elements such as other-dynamics and other-technical are not appropriate. The
/// smufl attribute can be used to specify a particular notation, allowing application interoperability without
/// requiring every SMuFL glyph to have a MusicXML element equivalent. Using the other-notation type without the
/// smufl attribute allows for extended representation, though without application interoperability.
///
/// Maps the MusicXML `<other-notation>` element.
public struct MXLOtherNotation {

    // MARK: Public Initializers

    /// Creates a new `MXLOtherNotation`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter value: The value of this element.
    /// - Parameter kind: Whether this element starts, stops, or is a single occurrence of the notation.
    /// - Parameter number: Defaults to `1`.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter smufl: The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character. Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an element.
    public init(id: String? = nil,
                value: String,
                kind: MXLStartStopSingle,
                number: MXLNumberLevel? = nil,
                printsObject: Bool? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                placement: MXLAboveBelow? = nil,
                smufl: MXLSmuflGlyphName? = nil) {
        self.color = color
        self.font = font
        self.id = id
        self.number = number ?? 1
        self.placement = placement
        self.position = position
        self.printsObject = printsObject
        self.smufl = smufl
        self.kind = kind
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

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Whether this element starts, stops, or is a single occurrence of the notation.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStopSingle

    /// Defaults to `1`.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLNumberLevel

    /// The placement attribute indicates whether something is above or below another element, such as a note or a
    /// notation.
    ///
    /// Maps to the MusicXML `placement` attribute.
    public let placement: MXLAboveBelow?

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

    /// The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character.
    /// Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an
    /// element.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflGlyphName?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLOtherNotation: Equatable {
}

// MARK: - Hashable

extension MXLOtherNotation: Hashable {
}

// MARK: - Sendable

extension MXLOtherNotation: Sendable {
}
