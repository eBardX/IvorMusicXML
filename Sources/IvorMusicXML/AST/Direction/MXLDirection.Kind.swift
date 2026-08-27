// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDirection {

    /// Textual direction types may have more than 1 component due to multiple fonts. The dynamics element may also be
    /// used in the notations element. Attribute groups related to print suggestions apply to the individual
    /// direction-type, not to the overall direction.
    ///
    /// Maps the MusicXML `<direction-type>` element.
    public struct Kind {

        // MARK: Public Initializers

        /// Creates a new `MXLDirection.Kind`.
        ///
        /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
        /// - Parameter content: One of the alternatives for DirectionType.
        public init(id: String? = nil,
                    content: Content) {
            self.content = content
            self.id = id
        }

        // MARK: Public Instance Properties

        /// One of the alternatives for DirectionType.
        public let content: Content

        /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
        /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
        /// specifies an id reference.
        ///
        /// Maps to the MusicXML `id` attribute.
        public let id: String?
    }
}

// MARK: - Equatable

extension MXLDirection.Kind: Equatable {
}

// MARK: - Hashable

extension MXLDirection.Kind: Hashable {
}

// MARK: - Sendable

extension MXLDirection.Kind: Sendable {
}
