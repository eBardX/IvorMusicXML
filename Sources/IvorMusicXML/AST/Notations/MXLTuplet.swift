// © 2026 John Gary Pusey (see LICENSE.md)

/// A tuplet element is present when a tuplet is to be displayed graphically, in addition to the sound data
/// provided by the time-modification elements. The number attribute is used to distinguish nested tuplets. The
/// bracket attribute is used to indicate the presence of a bracket. If unspecified, the results are
/// implementation-dependent. The line-shape attribute is used to specify whether the bracket is straight or in
/// the older curved or slurred style. It is straight by default.
///
/// Whereas a time-modification element shows how the cumulative, sounding effect of tuplets and double-note
/// tremolos compare to the written note type, the tuplet element describes how this is displayed. The tuplet
/// element also provides more detailed representation information than the time-modification element, and is
/// needed to represent nested tuplets and other complex tuplets accurately.
///
/// The show-number attribute is used to display either the number of actual notes, the number of both actual and
/// normal notes, or neither. It is actual by default. The show-type attribute is used to display either the
/// actual type, both the actual and normal types, or neither. It is none by default.
///
/// Maps the MusicXML `<tuplet>` element.
public struct MXLTuplet {

    // MARK: Public Initializers

    /// Creates a new `MXLTuplet`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter actual: The tuplet-actual element provide optional full control over how the actual part of the tuplet is displayed, including number and note type (with dots). If any of these elements are absent, their values are based on the time-modification element.
    /// - Parameter normal: The tuplet-normal element provide optional full control over how the normal part of the tuplet is displayed, including number and note type (with dots). If any of these elements are absent, their values are based on the time-modification element.
    /// - Parameter kind: Whether this element marks the start or the stop of the tuplet.
    /// - Parameter number: Distinguishes nested tuplets from each other.
    /// - Parameter hasBracket: A Boolean value indicating whether a bracket is present for the tuplet.
    /// - Parameter showNumber: Whether to display the number of actual notes, the number of both actual and normal notes, or neither. Defaults to `actual` if not specified.
    /// - Parameter showType: Whether to display the actual note type, both the actual and normal note types, or neither. Defaults to `neither` if not specified.
    /// - Parameter lineShape: The line-shape attribute distinguishes between straight and curved lines.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    public init(id: String? = nil,
                actual: Portion? = nil,
                normal: Portion? = nil,
                kind: MXLStartStop,
                number: MXLNumberLevel? = nil,
                hasBracket: Bool? = nil,
                showNumber: MXLShowTuplet? = nil,
                showType: MXLShowTuplet? = nil,
                lineShape: MXLLineShape? = nil,
                position: MXLPosition = MXLPosition(),
                placement: MXLAboveBelow? = nil) {
        self.actual = actual
        self.hasBracket = hasBracket
        self.id = id
        self.kind = kind
        self.lineShape = lineShape
        self.normal = normal
        self.number = number
        self.placement = placement
        self.position = position
        self.showNumber = showNumber
        self.showType = showType
    }

    // MARK: Public Instance Properties

    /// The tuplet-actual element provide optional full control over how the actual part of the tuplet is displayed,
    /// including number and note type (with dots). If any of these elements are absent, their values are based on the
    /// time-modification element.
    ///
    /// Maps to a nested MusicXML `<tuplet-actual>` element.
    public let actual: Portion?

    /// A Boolean value indicating whether a bracket is present for the tuplet.
    ///
    /// Maps to the MusicXML `bracket` attribute.
    public let hasBracket: Bool?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Whether this element marks the start or the stop of the tuplet.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStop

    /// The line-shape attribute distinguishes between straight and curved lines.
    ///
    /// Maps to the MusicXML `line-shape` attribute.
    public let lineShape: MXLLineShape?

    /// The tuplet-normal element provide optional full control over how the normal part of the tuplet is displayed,
    /// including number and note type (with dots). If any of these elements are absent, their values are based on the
    /// time-modification element.
    ///
    /// Maps to a nested MusicXML `<tuplet-normal>` element.
    public let normal: Portion?

    /// Distinguishes nested tuplets from each other.
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

    /// Whether to display the number of actual notes, the number of both actual and normal notes, or neither.
    /// Defaults to `actual` if not specified.
    ///
    /// Maps to the MusicXML `show-number` attribute.
    public let showNumber: MXLShowTuplet?

    /// Whether to display the actual note type, both the actual and normal note types, or neither. Defaults to
    /// `neither` if not specified.
    ///
    /// Maps to the MusicXML `show-type` attribute.
    public let showType: MXLShowTuplet?
}

// MARK: - Equatable

extension MXLTuplet: Equatable {
}

// MARK: - Hashable

extension MXLTuplet: Hashable {
}

// MARK: - Sendable

extension MXLTuplet: Sendable {
}
