// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMiscellaneous {

    /// If a program has other metadata not yet supported in the MusicXML format, each type of metadata can go in a
    /// miscellaneous-field element. The required name attribute indicates the type of metadata the element content
    /// represents.
    ///
    /// Maps the MusicXML `<miscellaneous-field>` element.
    public struct Field {

        // MARK: Public Initializers

        /// Creates a new `MXLMiscellaneous.Field`.
        ///
        /// - Parameter value: The value of this element.
        /// - Parameter name: The type of metadata the element content represents.
        public init(value: String,
                    name: String) {
            self.name = name
            self.value = value
        }

        // MARK: Public Instance Properties

        /// The type of metadata the element content represents.
        ///
        /// Maps to the MusicXML `name` attribute.
        public let name: String

        /// The value of this element.
        public let value: String
    }
}

// MARK: - Equatable

extension MXLMiscellaneous.Field: Equatable {
}

// MARK: - Hashable

extension MXLMiscellaneous.Field: Hashable {
}

// MARK: - Sendable

extension MXLMiscellaneous.Field: Sendable {
}
