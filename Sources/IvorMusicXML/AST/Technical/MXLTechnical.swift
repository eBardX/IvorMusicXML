// © 2026 John Gary Pusey (see LICENSE.md)

/// Technical indications give performance information for individual instruments.
///
/// Maps the MusicXML `<technical>` element.
public struct MXLTechnical {

    // MARK: Public Initializers

    /// Creates a new `MXLTechnical`.
    ///
    /// - Parameter id:     The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter items:  One of the alternatives for Technical.
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

    /// One of the alternatives for Technical.
    public let items: [Item]
}

// MARK: - Equatable

extension MXLTechnical: Equatable {
}

// MARK: - Hashable

extension MXLTechnical: Hashable {
}

// MARK: - Sendable

extension MXLTechnical: Sendable {
}
