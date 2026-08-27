// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMetronome {

    /// The metronome-note type defines the appearance of a note within a metric relationship mark.
    ///
    /// Maps the MusicXML `<metronome-note>` element.
    public struct Note {

        // MARK: Public Initializers

        /// Creates a new `MXLMetronome.Note`.
        ///
        /// - Parameter kind: The metronome-type element works like the type element in defining metric relationships.
        /// - Parameter dot: The number of augmentation dots, working like the dot element in defining metric relationships.
        /// - Parameter beam: The metronome-beam elements defining beaming for this metronome note, working like the beam element in defining metric relationships.
        /// - Parameter tied: The metronome-tied element indicating the presence of a tie to another metronome note, if any.
        /// - Parameter tuplet: The metronome-tuplet element, if any, using the same element structure as the time-modification element along with some attributes from the tuplet element.
        public init(kind: MXLNoteKindValue,
                    dot: Int,
                    beam: [Beam] = [],
                    tied: Tied? = nil,
                    tuplet: Tuplet? = nil) {
            self.beam = beam
            self.dot = dot
            self.kind = kind
            self.tied = tied
            self.tuplet = tuplet
        }

        // MARK: Public Instance Properties

        /// The metronome-beam elements defining beaming for this metronome note, working like the beam element in
        /// defining metric relationships.
        ///
        /// Maps to nested MusicXML `<metronome-beam>` elements.
        public let beam: [Beam]

        /// The number of augmentation dots, working like the dot element in defining metric relationships.
        ///
        /// Maps to nested MusicXML `<metronome-dot>` elements.
        public let dot: Int

        /// The metronome-type element works like the type element in defining metric relationships.
        ///
        /// Maps to a nested MusicXML `<metronome-type>` element.
        public let kind: MXLNoteKindValue

        /// The metronome-tied element indicating the presence of a tie to another metronome note, if any.
        ///
        /// Maps to a nested MusicXML `<metronome-tied>` element.
        public let tied: Tied?

        /// The metronome-tuplet element, if any, using the same element structure as the time-modification element
        /// along with some attributes from the tuplet element.
        ///
        /// Maps to a nested MusicXML `<metronome-tuplet>` element.
        public let tuplet: Tuplet?
    }
}

// MARK: - Equatable

extension MXLMetronome.Note: Equatable {
}

// MARK: - Hashable

extension MXLMetronome.Note: Hashable {
}

// MARK: - Sendable

extension MXLMetronome.Note: Sendable {
}
