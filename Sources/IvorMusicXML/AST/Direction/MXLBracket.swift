// © 2026 John Gary Pusey (see LICENSE.md)

/// Brackets are combined with words in a variety of modern directions. The line-end attribute specifies if there
/// is a jog up or down (or both), an arrow, or nothing at the start or end of the bracket. If the line-end is up
/// or down, the length of the jog can be specified using the end-length attribute. The line-type is solid if not
/// specified.
///
/// Maps the MusicXML `<bracket>` element.
public struct MXLBracket {

    // MARK: Public Initializers

    /// Creates a new `MXLBracket`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind:  Whether this is the start, stop, or continuation of the bracket.
    /// - Parameter number:  Distinguishes this bracket from other brackets that might be active at the same time.
    /// - Parameter lineEnd:  Specifies if there is a jog up or down (or both), an arrow, or nothing at the start or end of the bracket.
    /// - Parameter endLength:  The length of the jog, if the line-end is up or down.
    /// - Parameter lineKind: The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    /// - Parameter dashLength:  The length, in tenths, of the dashes in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter spaceLength:  The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(id: String? = nil,
                kind: MXLStartStopContinue,
                number: MXLNumberLevel? = nil,
                lineEnd: MXLLineEnd,
                endLength: MXLTenths? = nil,
                lineKind: MXLLineKind? = nil,
                dashLength: MXLTenths? = nil,
                spaceLength: MXLTenths? = nil,
                position: MXLPosition = MXLPosition(),
                color: MXLColor? = nil) {
        self.color = color
        self.dashLength = dashLength
        self.endLength = endLength
        self.id = id
        self.lineEnd = lineEnd
        self.lineKind = lineKind
        self.number = number
        self.position = position
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

    /// The length of the jog, if the line-end is up or down.
    ///
    /// Maps to the MusicXML `end-length` attribute.
    public let endLength: MXLTenths?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Whether this is the start, stop, or continuation of the bracket.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStopContinue

    /// Specifies if there is a jog up or down (or both), an arrow, or nothing at the start or end of the bracket.
    ///
    /// Maps to the MusicXML `line-end` attribute.
    public let lineEnd: MXLLineEnd

    /// The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    ///
    /// Maps to the MusicXML `line-type` attribute.
    public let lineKind: MXLLineKind?

    /// Distinguishes this bracket from other brackets that might be active at the same time.
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

    /// The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is
    /// not dashed.
    ///
    /// Maps to the MusicXML `space-length` attribute.
    public let spaceLength: MXLTenths?
}

// MARK: - Equatable

extension MXLBracket: Equatable {
}

// MARK: - Hashable

extension MXLBracket: Hashable {
}

// MARK: - Sendable

extension MXLBracket: Sendable {
}
