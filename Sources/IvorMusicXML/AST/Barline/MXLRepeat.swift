// © 2026 John Gary Pusey (see LICENSE.md)

/// The repeat type represents repeat marks. The start of the repeat has a forward direction while the end of the
/// repeat has a backward direction. The times and after-jump attributes are only used with backward repeats that
/// are not part of an ending. The times attribute indicates the number of times the repeated section is played.
/// The after-jump attribute indicates if the repeats are played after a jump due to a da capo or dal segno.
///
/// Maps the MusicXML `<repeat>` element.
public struct MXLRepeat {

    // MARK: Public Initializers

    /// Creates a new `MXLRepeat`.
    ///
    /// - Parameter direction: Whether this repeat mark represents the start (forward) or end (backward) of the repeated section.
    /// - Parameter times: The number of times the repeated section is played. Only used with backward repeats that are not part of an ending.
    /// - Parameter isAfterJump: A Boolean value indicating whether the repeats are played after a jump due to a da capo or dal segno.
    /// - Parameter winged: The style of the repeat sign’s wings, if any.
    public init(direction: Direction,
                times: Int? = nil,
                isAfterJump: Bool? = nil,
                winged: MXLWinged? = nil) {
        self.isAfterJump = isAfterJump
        self.direction = direction
        self.times = times
        self.winged = winged ?? .wingless
    }

    // MARK: Public Instance Properties

    /// Whether this repeat mark represents the start (forward) or end (backward) of the repeated section.
    ///
    /// Maps to the MusicXML `direction` attribute.
    public let direction: Direction

    /// A Boolean value indicating whether the repeats are played after a jump due to a da capo or dal segno.
    ///
    /// Maps to the MusicXML `after-jump` attribute.
    public let isAfterJump: Bool?

    /// The number of times the repeated section is played. Only used with backward repeats that are not part of an
    /// ending.
    ///
    /// Maps to the MusicXML `times` attribute.
    public let times: Int?

    /// The style of the repeat sign’s wings, if any.
    ///
    /// Maps to the MusicXML `winged` attribute.
    public let winged: MXLWinged
}

// MARK: - Equatable

extension MXLRepeat: Equatable {
}

// MARK: - Hashable

extension MXLRepeat: Hashable {
}

// MARK: - Sendable

extension MXLRepeat: Sendable {
}
