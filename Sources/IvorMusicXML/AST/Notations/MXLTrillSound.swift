// © 2026 John Gary Pusey (see LICENSE.md)

/// The trill-sound attribute group includes attributes used to guide the sound of trills, mordents, turns,
/// shakes, and wavy lines. The default choices are:
///
/// start-note = "upper" trill-step = "whole" two-note-turn = "none" accelerate = "no" beats = "4".
///
/// Second-beat and last-beat are percentages for landing on the indicated beat, with defaults of 25 and 75
/// respectively.
///
/// For mordent and inverted-mordent elements, the defaults are different:
///
/// The default start-note is "main", not "upper". The default for beats is "3", not "4". The default for second-
/// beat is "12", not "25". The default for last-beat is "24", not "75".
public struct MXLTrillSound {

    // MARK: Public Initializers

    /// Creates a new `MXLTrillSound`.
    ///
    /// - Parameter startNote:    The note on which the trill, mordent, turn, or shake begins.
    /// - Parameter trillStep:    The alternating note used in the trill, mordent, turn, or shake.
    /// - Parameter twoNoteTurn:  The ending notes for a two-note turn, if any.
    /// - Parameter accelerates:   A Boolean value indicating whether the trill, mordent, turn, or shake accelerates through its beats.
    /// - Parameter beats:        The number of discrete beats used to notate the trill, mordent, turn, or shake.
    /// - Parameter secondBeat:   The percentage of the duration for landing on the second beat.
    /// - Parameter lastBeat:     The percentage of the duration for landing on the last beat.
    public init(startNote: MXLStartNote? = nil,
                trillStep: MXLTrillStep? = nil,
                twoNoteTurn: MXLTwoNoteTurn? = nil,
                accelerates: Bool? = nil,
                beats: MXLTrillBeats? = nil,
                secondBeat: MXLPercent? = nil,
                lastBeat: MXLPercent? = nil) {
        self.accelerates = accelerates
        self.beats = beats
        self.lastBeat = lastBeat
        self.secondBeat = secondBeat
        self.startNote = startNote
        self.trillStep = trillStep
        self.twoNoteTurn = twoNoteTurn
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether the trill, mordent, turn, or shake accelerates through its beats.
    ///
    /// Maps to the MusicXML `accelerate` attribute.
    public let accelerates: Bool?

    /// The number of discrete beats used to notate the trill, mordent, turn, or shake.
    ///
    /// Maps to the MusicXML `beats` attribute.
    public let beats: MXLTrillBeats?

    /// The percentage of the duration for landing on the last beat.
    ///
    /// Maps to the MusicXML `last-beat` attribute.
    public let lastBeat: MXLPercent?

    /// The percentage of the duration for landing on the second beat.
    ///
    /// Maps to the MusicXML `second-beat` attribute.
    public let secondBeat: MXLPercent?

    /// The note on which the trill, mordent, turn, or shake begins.
    ///
    /// Maps to the MusicXML `start-note` attribute.
    public let startNote: MXLStartNote?

    /// The alternating note used in the trill, mordent, turn, or shake.
    ///
    /// Maps to the MusicXML `trill-step` attribute.
    public let trillStep: MXLTrillStep?

    /// The ending notes for a two-note turn, if any.
    ///
    /// Maps to the MusicXML `two-note-turn` attribute.
    public let twoNoteTurn: MXLTwoNoteTurn?
}

// MARK: - Equatable

extension MXLTrillSound: Equatable {
}

// MARK: - Hashable

extension MXLTrillSound: Hashable {
}

// MARK: - Sendable

extension MXLTrillSound: Sendable {
}
