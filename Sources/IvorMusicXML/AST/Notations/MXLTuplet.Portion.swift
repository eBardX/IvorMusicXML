// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTuplet {

    /// The tuplet-portion type provides optional full control over tuplet specifications. It allows the number and
    /// note type (including dots) to be set for the actual and normal portions of a single tuplet. If any of these
    /// elements are absent, their values are based on the time-modification element.
    ///
    /// Maps the MusicXML `<tuplet-actual>` and `<tuplet-normal>` elements.
    public struct Portion {

        // MARK: Public Initializers

        /// Creates a new `MXLTuplet.Portion`.
        ///
        /// - Parameter number: The number of notes for this portion of the tuplet, if specified. Based on the time-modification element if absent.
        /// - Parameter kind: The graphical note type of the notes for this portion of the tuplet, if specified. Based on the time-modification element if absent.
        /// - Parameter dot: The augmentation dots for the notes of this portion of the tuplet, if dotted.
        public init(number: Number? = nil,
                    kind: Kind? = nil,
                    dot: [Dot] = []) {
            self.dot = dot
            self.number = number
            self.kind = kind
        }

        // MARK: Public Instance Properties

        /// The augmentation dots for the notes of this portion of the tuplet, if dotted.
        ///
        /// Maps to a nested MusicXML `<tuplet-dot>` element.
        public let dot: [Dot]

        /// The graphical note type of the notes for this portion of the tuplet, if specified. Based on the
        /// time-modification element if absent.
        ///
        /// Maps to a nested MusicXML `<tuplet-type>` element.
        public let kind: Kind?

        /// The number of notes for this portion of the tuplet, if specified. Based on the time-modification element
        /// if absent.
        ///
        /// Maps to a nested MusicXML `<tuplet-number>` element.
        public let number: Number?
    }
}

// MARK: - Equatable

extension MXLTuplet.Portion: Equatable {
}

// MARK: - Hashable

extension MXLTuplet.Portion: Hashable {
}

// MARK: - Sendable

extension MXLTuplet.Portion: Sendable {
}
