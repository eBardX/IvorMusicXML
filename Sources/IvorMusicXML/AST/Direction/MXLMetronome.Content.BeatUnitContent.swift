// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMetronome.Content {

    /// One of the alternatives for Content.
    public enum BeatUnitContent {
        /// The `beat-unit` alternative.
        case beatUnit(_ beatUnit: MXLBeatUnit, tied: [MXLMetronome.BeatUnitTied])

        /// The `per-minute` alternative.
        case perMinute(MXLPerMinute)
    }
}

// MARK: - Equatable

extension MXLMetronome.Content.BeatUnitContent: Equatable {
}

// MARK: - Hashable

extension MXLMetronome.Content.BeatUnitContent: Hashable {
}

// MARK: - Sendable

extension MXLMetronome.Content.BeatUnitContent: Sendable {
}
