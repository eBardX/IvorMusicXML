// © 2026 John Gary Pusey (see LICENSE.md)

/// The wedge type represents crescendo and diminuendo wedge symbols. The type attribute is crescendo for the
/// start of a wedge that is closed at the left side, and diminuendo for the start of a wedge that is closed on
/// the right side. Spread values are measured in tenths; those at the start of a crescendo wedge or end of a
/// diminuendo wedge are ignored. The niente attribute is yes if a circle appears at the point of the wedge,
/// indicating a crescendo from nothing or diminuendo to nothing. It is no by default, and used only when the type
/// is crescendo, or the type is stop for a wedge that began with a diminuendo type. The line-type is solid if not
/// specified.
///
/// Maps the MusicXML `<wedge>` element.
public struct MXLWedge {

    // MARK: Public Initializers

    /// Creates a new `MXLWedge`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind:  Whether this is the start of a crescendo or diminuendo wedge, the end of a wedge, or a continuation of one divided into multiple segments.
    /// - Parameter number:  Distinguishes this wedge from other wedges that might be active at the same time.
    /// - Parameter spread:  The spread, in tenths, between the wedge lines at this point. Ignored at the start of a crescendo wedge or the end of a diminuendo wedge.
    /// - Parameter isNiente:  A Boolean value indicating whether a circle appears at the point of the wedge, indicating a crescendo from nothing or diminuendo to nothing.
    /// - Parameter lineKind: The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    /// - Parameter dashLength:  The length, in tenths, of the dashes in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter spaceLength:  The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(id: String? = nil,
                kind: Kind,
                number: MXLNumberLevel? = nil,
                spread: MXLTenths? = nil,
                isNiente: Bool? = nil,
                lineKind: MXLLineKind? = nil,
                dashLength: MXLTenths? = nil,
                spaceLength: MXLTenths? = nil,
                position: MXLPosition = MXLPosition(),
                color: MXLColor? = nil) {
        self.color = color
        self.dashLength = dashLength
        self.id = id
        self.lineKind = lineKind
        self.isNiente = isNiente
        self.number = number
        self.position = position
        self.spaceLength = spaceLength
        self.spread = spread
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

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// A Boolean value indicating whether a circle appears at the point of the wedge, indicating a crescendo from
    /// nothing or diminuendo to nothing.
    ///
    /// Maps to the MusicXML `niente` attribute.
    public let isNiente: Bool?

    /// Whether this is the start of a crescendo or diminuendo wedge, the end of a wedge, or a continuation of one
    /// divided into multiple segments.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    ///
    /// Maps to the MusicXML `line-type` attribute.
    public let lineKind: MXLLineKind?

    /// Distinguishes this wedge from other wedges that might be active at the same time.
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

    /// The spread, in tenths, between the wedge lines at this point. Ignored at the start of a crescendo wedge or
    /// the end of a diminuendo wedge.
    ///
    /// Maps to the MusicXML `spread` attribute.
    public let spread: MXLTenths?
}

// MARK: - Equatable

extension MXLWedge: Equatable {
}

// MARK: - Hashable

extension MXLWedge: Hashable {
}

// MARK: - Sendable

extension MXLWedge: Sendable {
}
