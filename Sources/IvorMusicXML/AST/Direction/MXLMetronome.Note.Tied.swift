// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMetronome.Note {

    /// The metronome-tied indicates the presence of a tie within a metric relationship mark. As with the tied
    /// element, both the start and stop of the tie should be specified, in this case within separate metronome-note
    /// elements.
    ///
    /// Maps the MusicXML `<metronome-tied>` element.
    public struct Tied {

        // MARK: Public Initializers

        /// Creates a new `MXLMetronome.Note.Tied`.
        ///
        /// - Parameter kind: Whether this element marks the start or the stop of the tie.
        public init(kind: MXLStartStop) {
            self.kind = kind
        }

        // MARK: Public Instance Properties

        /// Whether this element marks the start or the stop of the tie.
        ///
        /// Maps to the MusicXML `type` attribute.
        public let kind: MXLStartStop
    }
}

// MARK: - Equatable

extension MXLMetronome.Note.Tied: Equatable {
}

// MARK: - Hashable

extension MXLMetronome.Note.Tied: Hashable {
}

// MARK: - Sendable

extension MXLMetronome.Note.Tied: Sendable {
}
