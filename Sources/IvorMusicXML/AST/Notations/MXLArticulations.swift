// © 2026 John Gary Pusey (see LICENSE.md)

/// Articulations and accents are grouped together here.
///
/// Maps the MusicXML `<articulations>` element.
public struct MXLArticulations {

    // MARK: Public Initializers

    /// Creates a new `MXLArticulations`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter items: One of the alternatives for Articulations.
    public init(id: String? = nil,
                items: [Item] = []) {
        self.id = id
        self.items = items
    }

    // MARK: Public Instance Properties

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// One of the alternatives for Articulations.
    public let items: [Item]
}

// MARK: - Equatable

extension MXLArticulations: Equatable {
}

// MARK: - Hashable

extension MXLArticulations: Hashable {
}

// MARK: - Sendable

extension MXLArticulations: Sendable {
}
