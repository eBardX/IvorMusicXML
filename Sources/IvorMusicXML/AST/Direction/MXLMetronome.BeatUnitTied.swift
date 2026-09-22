// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMetronome {

    /// The beat-unit-tied type indicates a beat-unit within a metronome mark that is tied to the preceding beat-unit.
    /// This allows two or more tied notes to be associated with a per-minute value in a metronome mark, whereas the
    /// metronome-tied element is restricted to metric relationship marks.
    ///
    /// Maps the MusicXML `<beat-unit-tied>` element.
    public struct BeatUnitTied {

        // MARK: Public Initializers

        /// Creates a new `MXLMetronome.BeatUnitTied`.
        ///
        /// - Parameter beatUnit: The beat-unit element indicates the graphical note type to use in a metronome mark.
        /// - Parameter beatUnitDot: The number of augmentation dots to apply to the beat-unit note in a metronome mark.
        public init(beatUnit: MXLNoteKindValue,
                    beatUnitDot: Int) {
            self.beatUnit = beatUnit
            self.beatUnitDot = beatUnitDot
        }

        // MARK: Public Instance Properties

        /// The beat-unit element indicates the graphical note type to use in a metronome mark.
        ///
        /// Maps to a nested MusicXML `<beat-unit>` element.
        public let beatUnit: MXLNoteKindValue

        /// The number of augmentation dots to apply to the beat-unit note in a metronome mark.
        ///
        /// Maps to a nested MusicXML `<beat-unit-dot>` element.
        public let beatUnitDot: Int
    }
}

// MARK: - Equatable

extension MXLMetronome.BeatUnitTied: Equatable {
}

// MARK: - Hashable

extension MXLMetronome.BeatUnitTied: Hashable {
}

// MARK: - Sendable

extension MXLMetronome.BeatUnitTied: Sendable {
}
