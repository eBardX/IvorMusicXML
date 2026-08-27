// © 2026 John Gary Pusey (see LICENSE.md)

/// The ending type represents multiple (e.g. first and second) endings. Typically, the start type is associated
/// with the left barline of the first measure in an ending. The stop and discontinue types are associated with
/// the right barline of the last measure in an ending. Stop is used when the ending mark concludes with a
/// downward jog, as is typical for first endings. Discontinue is used when there is no downward jog, as is
/// typical for second endings that do not conclude a piece. The length of the jog can be specified using the end-
/// length attribute. The text-x and text-y attributes are offsets that specify where the baseline of the start of
/// the ending text appears, relative to the start of the ending line.
///
/// The number attribute indicates which times the ending is played, similar to the time-only attribute used by
/// other elements. While this often represents the numeric values for what is under the ending line, it can also
/// indicate whether an ending is played during a larger dal segno or da capo repeat. Single endings such as “1”
/// or comma-separated multiple endings such as “1,2” may be used. The ending element text is used when the text
/// displayed in the ending is different than what appears in the number attribute. The print-object attribute is
/// used to indicate when an ending is present but not printed, as is often the case for many parts in a full
/// score.
///
/// Maps the MusicXML `<ending>` element.
public struct MXLEnding {

    // MARK: Public Initializers

    /// Creates a new `MXLEnding`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter number:  Indicates which times the ending is played, similar to the time-only attribute used by other elements.
    /// - Parameter kind:  Whether this ending starts, stops, or discontinues, determining which barline it is associated with and whether a downward jog is drawn.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter system: The system-relation attribute group distinguishes elements that are associated with a system rather than the particular part where the element appears.
    /// - Parameter endLength:  The length of the downward jog at the end of the ending line.
    /// - Parameter textX:  The horizontal offset specifying where the baseline of the start of the ending text appears, relative to the start of the ending line.
    /// - Parameter textY:  The vertical offset specifying where the baseline of the start of the ending text appears, relative to the start of the ending line.
    public init(value: String,
                number: Number,
                kind: MXLStartStopDiscontinue,
                printsObject: Bool? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                system: MXLSystemRelation? = nil,
                endLength: MXLTenths? = nil,
                textX: MXLTenths? = nil,
                textY: MXLTenths? = nil) {
        self.color = color
        self.endLength = endLength
        self.font = font
        self.number = number
        self.position = position
        self.printsObject = printsObject
        self.system = system
        self.textX = textX
        self.textY = textY
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The length of the downward jog at the end of the ending line.
    ///
    /// Maps to the MusicXML `end-length` attribute.
    public let endLength: MXLTenths?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// Whether this ending starts, stops, or discontinues, determining which barline it is associated with and
    /// whether a downward jog is drawn.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStopDiscontinue

    /// Indicates which times the ending is played, similar to the time-only attribute used by other elements.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: Number

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

    /// The system-relation attribute group distinguishes elements that are associated with a system rather than the
    /// particular part where the element appears.
    ///
    /// Maps to the MusicXML `system` attribute.
    public let system: MXLSystemRelation?

    /// The horizontal offset specifying where the baseline of the start of the ending text appears, relative to the
    /// start of the ending line.
    ///
    /// Maps to the MusicXML `text-x` attribute.
    public let textX: MXLTenths?

    /// The vertical offset specifying where the baseline of the start of the ending text appears, relative to the
    /// start of the ending line.
    ///
    /// Maps to the MusicXML `text-y` attribute.
    public let textY: MXLTenths?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLEnding: Equatable {
}

// MARK: - Hashable

extension MXLEnding: Hashable {
}

// MARK: - Sendable

extension MXLEnding: Sendable {
}
