// © 2026 John Gary Pusey (see LICENSE.md)

/// The grace type indicates the presence of a grace note. The slash attribute for a grace note is yes for slashed
/// grace notes. The steal-time-previous attribute indicates the percentage of time to steal from the previous
/// note for the grace note. The steal-time-following attribute indicates the percentage of time to steal from the
/// following note for the grace note, as for appoggiaturas. The make-time attribute indicates to make time, not
/// steal time; the units are in real-time divisions for the grace note.
///
/// Maps the MusicXML `<grace>` element.
public struct MXLGrace {

    // MARK: Public Initializers

    /// Creates a new `MXLGrace`.
    ///
    /// - Parameter stealTimePrevious:   The percentage of time to steal from the previous note for the grace note.
    /// - Parameter stealTimeFollowing:  The percentage of time to steal from the following note for the grace note, as for appoggiaturas.
    /// - Parameter makeTime:            Indicates to make time, not steal time, for the grace note. Units are in real-time divisions.
    /// - Parameter isSlashed:           A Boolean value indicating whether this is a slashed grace note.
    public init(stealTimePrevious: MXLPercent? = nil,
                stealTimeFollowing: MXLPercent? = nil,
                makeTime: MXLDivisions? = nil,
                isSlashed: Bool? = nil) {
        self.isSlashed = isSlashed
        self.makeTime = makeTime
        self.stealTimeFollowing = stealTimeFollowing
        self.stealTimePrevious = stealTimePrevious
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether this is a slashed grace note.
    ///
    /// Maps to the MusicXML `slash` attribute.
    public let isSlashed: Bool?

    /// Indicates to make time, not steal time, for the grace note. Units are in real-time divisions.
    ///
    /// Maps to the MusicXML `make-time` attribute.
    public let makeTime: MXLDivisions?

    /// The percentage of time to steal from the following note for the grace note, as for appoggiaturas.
    ///
    /// Maps to the MusicXML `steal-time-following` attribute.
    public let stealTimeFollowing: MXLPercent?

    /// The percentage of time to steal from the previous note for the grace note.
    ///
    /// Maps to the MusicXML `steal-time-previous` attribute.
    public let stealTimePrevious: MXLPercent?
}

// MARK: - Equatable

extension MXLGrace: Equatable {
}

// MARK: - Hashable

extension MXLGrace: Hashable {
}

// MARK: - Sendable

extension MXLGrace: Sendable {
}
