// © 2026 John Gary Pusey (see LICENSE.md)

/// The beat-unit group combines elements used repeatedly in the metronome element to specify a note within a
/// metronome mark.
public struct MXLBeatUnit {

    // MARK: Public Initializers

    /// Creates a new `MXLBeatUnit`.
    ///
    /// - Parameter beatUnit: The beat-unit element indicates the graphical note type to use in a metronome mark.
    /// - Parameter dot: The number of augmentation dots to apply to the beat-unit note in a metronome mark.
    public init(beatUnit: MXLNoteKindValue,
                dot: Int) {
        self.beatUnit = beatUnit
        self.dot = dot
    }

    // MARK: Public Instance Properties

    /// The beat-unit element indicates the graphical note type to use in a metronome mark.
    ///
    /// Maps to a nested MusicXML `<beat-unit>` element.
    public let beatUnit: MXLNoteKindValue

    /// The number of augmentation dots to apply to the beat-unit note in a metronome mark.
    ///
    /// Maps to a nested MusicXML `<beat-unit-dot>` element.
    public let dot: Int
}

// MARK: - Equatable

extension MXLBeatUnit: Equatable {
}

// MARK: - Hashable

extension MXLBeatUnit: Hashable {
}

// MARK: - Sendable

extension MXLBeatUnit: Sendable {
}
