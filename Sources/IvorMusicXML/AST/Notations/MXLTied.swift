// © 2026 John Gary Pusey (see LICENSE.md)

/// The tied element represents the notated tie. The tie element represents the tie sound.
///
/// The number attribute is rarely needed to disambiguate ties, since note pitches will usually suffice. The
/// attribute is implied rather than defaulting to 1 as with most elements. It is available for use in more
/// complex tied notation situations.
///
/// Ties that join two notes of the same pitch together should be represented with a tied element on the first
/// note with type="start" and a tied element on the second note with type="stop". This can also be done if the
/// two notes being tied are enharmonically equivalent, but have different step values. It is not recommended to
/// use tied elements to join two notes with enharmonically inequivalent pitches.
///
/// Ties that indicate that an instrument should be undamped are specified with a single tied element with
/// type="let-ring".
///
/// Ties that are visually attached to only one note, other than undamped ties, should be specified with two tied
/// elements on the same note, first type="start" then type="stop". This can be used to represent ties into or out
/// of repeated sections or codas.
///
/// Maps the MusicXML `<tied>` element.
public struct MXLTied {

    // MARK: Public Initializers

    /// Creates a new `MXLTied`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind: Whether this element marks the start, stop, or continuation of the tie, or indicates that the note should be undamped.
    /// - Parameter number: Distinguishes this tie from other ties that might be active at the same time.
    /// - Parameter lineKind: The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    /// - Parameter dashLength:  The length, in tenths, of the dashes in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter spaceLength:  The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter orientation: The orientation attribute indicates whether slurs and ties are overhand (tips down) or underhand (tips up). This is distinct from the placement attribute used by any notation type.
    /// - Parameter bezierX: The x-coordinate, in tenths relative to any position settings, of the outgoing bezier control point for a slur or tie with a start type, or the incoming control point for one with a stop or continue type.
    /// - Parameter bezierY: The y-coordinate, in tenths relative to any position settings, of the outgoing bezier control point for a slur or tie with a start type, or the incoming control point for one with a stop or continue type.
    /// - Parameter bezierX2: The x-coordinate, in tenths, of the outgoing bezier control point for a slur with a continue type.
    /// - Parameter bezierY2: The y-coordinate, in tenths, of the outgoing bezier control point for a slur with a continue type.
    /// - Parameter bezierOffset: The outgoing bezier control point offset, in musical divisions, for a slur or tie with a start type, or the incoming control point offset for one with a stop or continue type. Deprecated as of MusicXML 3.1 in favor of `bezierX`.
    /// - Parameter bezierOffset2: The outgoing bezier control point offset, in musical divisions, for a slur with a continue type. Deprecated as of MusicXML 3.1 in favor of `bezierX2`.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(id: String? = nil,
                kind: Kind,
                number: MXLNumberLevel? = nil,
                lineKind: MXLLineKind? = nil,
                dashLength: MXLTenths? = nil,
                spaceLength: MXLTenths? = nil,
                position: MXLPosition = MXLPosition(),
                placement: MXLAboveBelow? = nil,
                orientation: MXLOverUnder? = nil,
                bezierX: MXLTenths? = nil,
                bezierY: MXLTenths? = nil,
                bezierX2: MXLTenths? = nil,
                bezierY2: MXLTenths? = nil,
                bezierOffset: MXLDivisions? = nil,
                bezierOffset2: MXLDivisions? = nil,
                color: MXLColor? = nil) {
        self.bezierOffset = bezierOffset
        self.bezierOffset2 = bezierOffset2
        self.bezierX = bezierX
        self.bezierX2 = bezierX2
        self.bezierY = bezierY
        self.bezierY2 = bezierY2
        self.color = color
        self.dashLength = dashLength
        self.id = id
        self.lineKind = lineKind
        self.number = number
        self.orientation = orientation
        self.placement = placement
        self.position = position
        self.spaceLength = spaceLength
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The outgoing bezier control point offset, in musical divisions, for a slur or tie with a start type, or the
    /// incoming control point offset for one with a stop or continue type. Deprecated as of MusicXML 3.1 in favor of
    /// `bezierX`.
    ///
    /// Maps to the MusicXML `bezier-offset` attribute.
    public let bezierOffset: MXLDivisions?

    /// The outgoing bezier control point offset, in musical divisions, for a slur with a continue type. Deprecated
    /// as of MusicXML 3.1 in favor of `bezierX2`.
    ///
    /// Maps to the MusicXML `bezier-offset2` attribute.
    public let bezierOffset2: MXLDivisions?

    /// The x-coordinate, in tenths relative to any position settings, of the outgoing bezier control point for a
    /// slur or tie with a start type, or the incoming control point for one with a stop or continue type.
    ///
    /// Maps to the MusicXML `bezier-x` attribute.
    public let bezierX: MXLTenths?

    /// The x-coordinate, in tenths, of the outgoing bezier control point for a slur with a continue type.
    ///
    /// Maps to the MusicXML `bezier-x2` attribute.
    public let bezierX2: MXLTenths?

    /// The y-coordinate, in tenths relative to any position settings, of the outgoing bezier control point for a
    /// slur or tie with a start type, or the incoming control point for one with a stop or continue type.
    ///
    /// Maps to the MusicXML `bezier-y` attribute.
    public let bezierY: MXLTenths?

    /// The y-coordinate, in tenths, of the outgoing bezier control point for a slur with a continue type.
    ///
    /// Maps to the MusicXML `bezier-y2` attribute.
    public let bezierY2: MXLTenths?

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

    /// Whether this element marks the start, stop, or continuation of the tie, or indicates that the note should be
    /// undamped.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    ///
    /// Maps to the MusicXML `line-type` attribute.
    public let lineKind: MXLLineKind?

    /// Distinguishes this tie from other ties that might be active at the same time.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLNumberLevel?

    /// The orientation attribute indicates whether slurs and ties are overhand (tips down) or underhand (tips up).
    /// This is distinct from the placement attribute used by any notation type.
    ///
    /// Maps to the MusicXML `orientation` attribute.
    public let orientation: MXLOverUnder?

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

    /// The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is
    /// not dashed.
    ///
    /// Maps to the MusicXML `space-length` attribute.
    public let spaceLength: MXLTenths?
}

// MARK: - Equatable

extension MXLTied: Equatable {
}

// MARK: - Hashable

extension MXLTied: Hashable {
}

// MARK: - Sendable

extension MXLTied: Sendable {
}
