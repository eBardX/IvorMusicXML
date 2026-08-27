// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMetronome {

    /// One of the alternatives for Metronome.
    public enum Content {
        /// The `beat-unit` alternative.
        case beatUnit(_ beatUnit: MXLBeatUnit, tied: [BeatUnitTied], content: BeatUnitContent)

        /// The `metronome-arrows` alternative.
        case metronomeArrows(hasMetronomeArrows: Bool,
                             note: [Note],
                             relation: String?,
                             secondNote: [Note])
    }
}

// MARK: - Equatable

extension MXLMetronome.Content: Equatable {
}

// MARK: - Hashable

extension MXLMetronome.Content: Hashable {
}

// MARK: - Sendable

extension MXLMetronome.Content: Sendable {
}
