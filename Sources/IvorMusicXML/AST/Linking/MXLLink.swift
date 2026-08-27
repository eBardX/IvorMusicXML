// © 2026 John Gary Pusey (see LICENSE.md)

/// The link type serves as an outgoing simple XLink. If a relative link is used within a document that is part of
/// a compressed MusicXML file, the link is relative to the root folder of the zip file.
///
/// Maps the MusicXML `<link>` element.
public struct MXLLink {

    // MARK: Public Initializers

    /// Creates a new `MXLLink`.
    ///
    /// - Parameter xlink: The link-attributes group includes all the simple XLink attributes supported in the MusicXML format. It is also used to connect a MusicXML score with MusicXML parts or a MusicXML opus.
    /// - Parameter name: A name for this link, usable by applications for any purpose.
    /// - Parameter elementPosition: The element and position attributes are new as of Version 2.0. They allow for bookmarks and links to be positioned at higher resolution than the level of music-data elements. When no element and position attributes are present, the bookmark or link element refers to the next sibling element in the MusicXML file. The element attribute specifies an element type for a descendant of the next sibling element that is not a link or bookmark. The position attribute specifies the position of this descendant element, where the first position is 1. The position attribute is ignored if the element attribute is not present. For instance, an element value of “beam” and a position value of “2” defines the link or bookmark to refer to the second beam descendant of the next sibling element that is not a link or bookmark. This is equivalent to an XPath test of [.//beam[2]] done in the context of the sibling element.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    public init(xlink: MXLXLink,
                name: String? = nil,
                elementPosition: MXLElementPosition = MXLElementPosition(),
                position: MXLPosition = MXLPosition()) {
        self.elementPosition = elementPosition
        self.xlink = xlink
        self.name = name
        self.position = position
    }

    // MARK: Public Instance Properties

    /// The element and position attributes are new as of Version 2.0. They allow for bookmarks and links to be
    /// positioned at higher resolution than the level of music-data elements. When no element and position attributes
    /// are present, the bookmark or link element refers to the next sibling element in the MusicXML file. The element
    /// attribute specifies an element type for a descendant of the next sibling element that is not a link or
    /// bookmark. The position attribute specifies the position of this descendant element, where the first position
    /// is 1. The position attribute is ignored if the element attribute is not present. For instance, an element
    /// value of “beam” and a position value of “2” defines the link or bookmark to refer to the second beam
    /// descendant of the next sibling element that is not a link or bookmark. This is equivalent to an XPath test of
    /// [.//beam[2]] done in the context of the sibling element.
    public let elementPosition: MXLElementPosition

    /// A name for this link, usable by applications for any purpose.
    ///
    /// Maps to the MusicXML `name` attribute.
    public let name: String?

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

    /// The link-attributes group includes all the simple XLink attributes supported in the MusicXML format. It is
    /// also used to connect a MusicXML score with MusicXML parts or a MusicXML opus.
    public let xlink: MXLXLink
}

// MARK: - Equatable

extension MXLLink: Equatable {
}

// MARK: - Hashable

extension MXLLink: Hashable {
}

// MARK: - Sendable

extension MXLLink: Sendable {
}
