// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLScoreTimewise.Measure {

    /// Maps the MusicXML `<part>` element.
    public struct Part {

        // MARK: Public Initializers

        /// Creates a new `MXLScoreTimewise.Measure.Part`.
        ///
        /// - Parameter id: In either partwise or timewise format, the part element has an id attribute that is an IDREF back to a score-part in the part-list.
        /// - Parameter items: The music-data group contains the basic musical data that is either associated with a part or a measure, depending on whether the partwise or timewise hierarchy is used.
        public init(id: String,
                    items: [MXLMusicItem] = []) {
            self.id = id
            self.items = items
        }

        // MARK: Public Instance Properties

        /// In either partwise or timewise format, the part element has an id attribute that is an IDREF back to a score-
        /// part in the part-list.
        ///
        /// Maps to the MusicXML `id` attribute.
        public let id: String

        /// The music-data group contains the basic musical data that is either associated with a part or a measure,
        /// depending on whether the partwise or timewise hierarchy is used.
        public let items: [MXLMusicItem]
    }
}

// MARK: - Equatable

extension MXLScoreTimewise.Measure.Part: Equatable {
}

// MARK: - Hashable

extension MXLScoreTimewise.Measure.Part: Hashable {
}

// MARK: - Sendable

extension MXLScoreTimewise.Measure.Part: Sendable {
}
