// © 2026 John Gary Pusey (see LICENSE.md)

/// The tremolo ornament can be used to indicate single-note, double-note, or unmeasured tremolos. Single-note
/// tremolos use the single type, double-note tremolos use the start and stop types, and unmeasured tremolos use
/// the unmeasured type. The default is "single" for compatibility with Version 1.1. The text of the element
/// indicates the number of tremolo marks and is an integer from 0 to 8. Note that the number of attached beams is
/// not included in this value, but is represented separately using the beam element. The value should be 0 for
/// unmeasured tremolos.
///
/// When using double-note tremolos, the duration of each note in the tremolo should correspond to half of the
/// notated type value. A time-modification element should also be added with an actual-notes value of 2 and a
/// normal-notes value of 1. If used within a tuplet, this 2/1 ratio should be multiplied by the existing tuplet
/// ratio.
///
/// The smufl attribute specifies the glyph to use from the SMuFL Tremolos range for an unmeasured tremolo. It is
/// ignored for other tremolo types. The SMuFL buzzRoll glyph is used by default if the attribute is missing.
///
/// Using repeater beams for indicating tremolos is deprecated as of MusicXML 3.0.
///
/// Maps the MusicXML `<tremolo>` element.
public struct MXLTremolo {

    // MARK: Public Initializers

    /// Creates a new `MXLTremolo`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter kind: Defaults to `single`.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter smufl: The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character. Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an element.
    public init(value: MXLTremoloMarks,
                kind: Kind? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                placement: MXLAboveBelow? = nil,
                smufl: MXLSmuflGlyphName? = nil) {
        self.color = color
        self.font = font
        self.placement = placement
        self.position = position
        self.smufl = smufl
        self.kind = kind ?? .single
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

    /// Defaults to `single`.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

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

    /// The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character.
    /// Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an
    /// element.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflGlyphName?

    /// The value of this element.
    public let value: MXLTremoloMarks
}

// MARK: - Equatable

extension MXLTremolo: Equatable {
}

// MARK: - Hashable

extension MXLTremolo: Hashable {
}

// MARK: - Sendable

extension MXLTremolo: Sendable {
}
