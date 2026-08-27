// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMetronome.Note {

    /// The metronome-tuplet type uses the same element structure as the time-modification element along with some
    /// attributes from the tuplet element.
    ///
    /// Maps the MusicXML `<metronome-tuplet>` element.
    public struct Tuplet {

        // MARK: Public Initializers

        /// Creates a new `MXLMetronome.Note.Tuplet`.
        ///
        /// - Parameter timeModification: The metronome-tuplet type uses the same element structure as the time-modification element along with some attributes from the tuplet element.
        /// - Parameter kind: Whether this element marks the start or the stop of the tuplet.
        /// - Parameter hasBracket: A Boolean value indicating whether to draw a bracket for the tuplet.
        /// - Parameter showNumber: Controls whether to show the actual, both, or neither of the tuplet numbers.
        public init(timeModification: MXLTimeModification,
                    kind: MXLStartStop,
                    hasBracket: Bool? = nil,
                    showNumber: MXLShowTuplet? = nil) {
            self.hasBracket = hasBracket
            self.showNumber = showNumber
            self.timeModification = timeModification
            self.kind = kind
        }

        // MARK: Public Instance Properties

        /// A Boolean value indicating whether to draw a bracket for the tuplet.
        ///
        /// Maps to the MusicXML `bracket` attribute.
        public let hasBracket: Bool?

        /// Whether this element marks the start or the stop of the tuplet.
        ///
        /// Maps to the MusicXML `type` attribute.
        public let kind: MXLStartStop

        /// Controls whether to show the actual, both, or neither of the tuplet numbers.
        ///
        /// Maps to the MusicXML `show-number` attribute.
        public let showNumber: MXLShowTuplet?

        /// The metronome-tuplet type uses the same element structure as the time-modification element along with some
        /// attributes from the tuplet element.
        public let timeModification: MXLTimeModification
    }
}

// MARK: - Equatable

extension MXLMetronome.Note.Tuplet: Equatable {
}

// MARK: - Hashable

extension MXLMetronome.Note.Tuplet: Hashable {
}

// MARK: - Sendable

extension MXLMetronome.Note.Tuplet: Sendable {
}
