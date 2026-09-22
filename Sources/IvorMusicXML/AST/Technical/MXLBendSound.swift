// © 2026 John Gary Pusey (see LICENSE.md)

/// The bend-sound type is used for bend and slide elements, and is similar to the trill-sound attribute group.
/// Here the beats element refers to the number of discrete elements (like MIDI pitch bends) used to represent a
/// continuous bend or slide. The first-beat indicates the percentage of the duration for starting a bend; the
/// last-beat the percentage for ending it. The default choices are:
///
/// accelerate = “no” beats = “4” first-beat = “25” last-beat = “75”
public struct MXLBendSound {

    // MARK: Public Initializers

    /// Creates a new `MXLBendSound`.
    ///
    /// - Parameter accelerates:  A Boolean value indicating whether the bend or slide accelerates through its beats.
    /// - Parameter beats:        The number of discrete elements (like MIDI pitch bends) used to represent a continuous bend or slide.
    /// - Parameter firstBeat:    The percentage of the duration for starting the bend.
    /// - Parameter lastBeat:     The percentage of the duration for ending the bend or slide.
    public init(accelerates: Bool? = nil,
                beats: MXLTrillBeats? = nil,
                firstBeat: MXLPercent? = nil,
                lastBeat: MXLPercent? = nil) {
        self.accelerates = accelerates
        self.beats = beats
        self.firstBeat = firstBeat
        self.lastBeat = lastBeat
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether the bend or slide accelerates through its beats.
    ///
    /// Maps to the MusicXML `accelerate` attribute.
    public let accelerates: Bool?

    /// The number of discrete elements (like MIDI pitch bends) used to represent a continuous bend or slide.
    ///
    /// Maps to the MusicXML `beats` attribute.
    public let beats: MXLTrillBeats?

    /// The percentage of the duration for starting the bend.
    ///
    /// Maps to the MusicXML `first-beat` attribute.
    public let firstBeat: MXLPercent?

    /// The percentage of the duration for ending the bend or slide.
    ///
    /// Maps to the MusicXML `last-beat` attribute.
    public let lastBeat: MXLPercent?
}

// MARK: - Equatable

extension MXLBendSound: Equatable {
}

// MARK: - Hashable

extension MXLBendSound: Hashable {
}

// MARK: - Sendable

extension MXLBendSound: Sendable {
}
