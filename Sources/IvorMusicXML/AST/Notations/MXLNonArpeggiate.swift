// © 2026 John Gary Pusey (see LICENSE.md)

/// The non-arpeggiate type indicates that this note is at the top or bottom of a bracket indicating to not
/// arpeggiate these notes. Since this does not involve playback, it is only used on the top or bottom notes, not
/// on each note as for the arpeggiate type.
///
/// Maps the MusicXML `<non-arpeggiate>` element.
public struct MXLNonArpeggiate {

    // MARK: Public Initializers

    /// Creates a new `MXLNonArpeggiate`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind: Whether this element is at the top or the bottom of the bracket.
    /// - Parameter number: Distinguishes multiple non-arpeggiate elements on a single note.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(id: String? = nil,
                kind: MXLTopBottom,
                number: MXLNumberLevel? = nil,
                position: MXLPosition = MXLPosition(),
                placement: MXLAboveBelow? = nil,
                color: MXLColor? = nil) {
        self.color = color
        self.id = id
        self.number = number
        self.placement = placement
        self.position = position
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Whether this element is at the top or the bottom of the bracket.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLTopBottom

    /// Distinguishes multiple non-arpeggiate elements on a single note.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLNumberLevel?

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
}

// MARK: - Equatable

extension MXLNonArpeggiate: Equatable {
}

// MARK: - Hashable

extension MXLNonArpeggiate: Hashable {
}

// MARK: - Sendable

extension MXLNonArpeggiate: Sendable {
}
