// © 2026 John Gary Pusey (see LICENSE.md)

/// The bookmark type serves as a well-defined target for an incoming simple XLink.
///
/// Maps the MusicXML `<bookmark>` element.
public struct MXLBookmark {

    // MARK: Public Initializers

    /// Creates a new `MXLBookmark`.
    ///
    /// - Parameter id:  A unique identifier for this bookmark, used as the target of an incoming XLink.
    /// - Parameter name:  A name for this bookmark.
    /// - Parameter elementPosition: The element and position attributes are new as of Version 2.0. They allow for bookmarks and links to be positioned at higher resolution than the level of music-data elements. When no element and position attributes are present, the bookmark or link element refers to the next sibling element in the MusicXML file. The element attribute specifies an element type for a descendant of the next sibling element that is not a link or bookmark. The position attribute specifies the position of this descendant element, where the first position is 1. The position attribute is ignored if the element attribute is not present. For instance, an element value of “beam” and a position value of “2” defines the link or bookmark to refer to the second beam descendant of the next sibling element that is not a link or bookmark. This is equivalent to an XPath test of [.//beam[2]] done in the context of the sibling element.
    public init(id: String,
                name: String? = nil,
                elementPosition: MXLElementPosition = MXLElementPosition()) {
        self.elementPosition = elementPosition
        self.id = id
        self.name = name
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

    /// A unique identifier for this bookmark, used as the target of an incoming XLink.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String

    /// A name for this bookmark.
    ///
    /// Maps to the MusicXML `name` attribute.
    public let name: String?
}

// MARK: - Equatable

extension MXLBookmark: Equatable {
}

// MARK: - Hashable

extension MXLBookmark: Hashable {
}

// MARK: - Sendable

extension MXLBookmark: Sendable {
}
