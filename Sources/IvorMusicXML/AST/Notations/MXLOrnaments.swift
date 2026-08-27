// © 2026 John Gary Pusey (see LICENSE.md)

/// Ornaments can be any of several types, followed optionally by accidentals. The accidental-mark element’s
/// content is represented the same as an accidental element, but with a different name to reflect the different
/// musical meaning.
///
/// Maps the MusicXML `<ornaments>` element.
public struct MXLOrnaments {

    // MARK: Public Initializers

    /// Creates a new `MXLOrnaments`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter content: One of the alternatives for Ornaments.
    /// - Parameter accidentalMark: The accidentals associated with the ornaments, represented the same way as an accidental element but with a different name to reflect the different musical meaning.
    public init(id: String? = nil,
                content: Content,
                accidentalMark: [MXLAccidentalMark] = []) {
        self.accidentalMark = accidentalMark
        self.content = content
        self.id = id
    }

    // MARK: Public Instance Properties

    /// The accidentals associated with the ornaments, represented the same way as an accidental element but with a
    /// different name to reflect the different musical meaning.
    ///
    /// Maps to nested MusicXML `<accidental-mark>` elements.
    public let accidentalMark: [MXLAccidentalMark]

    /// One of the alternatives for Ornaments.
    public let content: Content

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?
}

// MARK: - Equatable

extension MXLOrnaments: Equatable {
}

// MARK: - Hashable

extension MXLOrnaments: Hashable {
}

// MARK: - Sendable

extension MXLOrnaments: Sendable {
}
