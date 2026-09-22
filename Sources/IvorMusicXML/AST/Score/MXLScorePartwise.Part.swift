// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLScorePartwise {

    /// Maps the MusicXML `<part>` element.
    public struct Part {

        // MARK: Public Initializers

        /// Creates a new `MXLScorePartwise.Part`.
        ///
        /// - Parameter id: In either partwise or timewise format, the part element has an id attribute that is an IDREF back to a score-part in the part-list.
        /// - Parameter measures: The measures that make up this part.
        public init(id: String,
                    measures: [Measure] = []) {
            self.id = id
            self.measures = measures
        }

        // MARK: Public Instance Properties

        /// In either partwise or timewise format, the part element has an id attribute that is an IDREF back to a score-
        /// part in the part-list.
        ///
        /// Maps to the MusicXML `id` attribute.
        public let id: String

        /// The measures that make up this part.
        ///
        /// Maps to nested MusicXML `<measure>` elements.
        public let measures: [Measure]
    }
}

// MARK: - Equatable

extension MXLScorePartwise.Part: Equatable {
}

// MARK: - Hashable

extension MXLScorePartwise.Part: Hashable {
}

// MARK: - Sendable

extension MXLScorePartwise.Part: Sendable {
}
