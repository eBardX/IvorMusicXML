// © 2026 John Gary Pusey (see LICENSE.md)

/// The element and position attributes are new as of Version 2.0. They allow for bookmarks and links to be
/// positioned at higher resolution than the level of music-data elements. When no element and position attributes
/// are present, the bookmark or link element refers to the next sibling element in the MusicXML file. The element
/// attribute specifies an element type for a descendant of the next sibling element that is not a link or
/// bookmark. The position attribute specifies the position of this descendant element, where the first position
/// is 1. The position attribute is ignored if the element attribute is not present. For instance, an element
/// value of “beam” and a position value of “2” defines the link or bookmark to refer to the second beam
/// descendant of the next sibling element that is not a link or bookmark. This is equivalent to an XPath test of
/// [.//beam[2]] done in the context of the sibling element.
public struct MXLElementPosition {

    // MARK: Public Initializers

    /// Creates a new `MXLElementPosition`.
    ///
    /// - Parameter element:   The element type for a descendant of the next sibling element that is not a link or bookmark.
    /// - Parameter position:  The position of the descendant element specified by `element`, where the first position is `1`. Ignored if `element` is `nil`.
    public init(element: String? = nil,
                position: Int? = nil) {
        self.element = element
        self.position = position
    }

    // MARK: Public Instance Properties

    /// The element type for a descendant of the next sibling element that is not a link or bookmark.
    ///
    /// Maps to the MusicXML `element` attribute.
    public let element: String?

    /// The position of the descendant element specified by `element`, where the first position is `1`. Ignored if
    /// `element` is `nil`.
    ///
    /// Maps to the MusicXML `position` attribute.
    public let position: Int?
}

// MARK: - Equatable

extension MXLElementPosition: Equatable {
}

// MARK: - Hashable

extension MXLElementPosition: Hashable {
}

// MARK: - Sendable

extension MXLElementPosition: Sendable {
}
