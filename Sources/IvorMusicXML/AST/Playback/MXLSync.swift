// © 2026 John Gary Pusey (see LICENSE.md)

/// The sync type specifies the style that a score following application should use to synchronize an
/// accompaniment with a performer. If this type is not included in a score, default synchronization depends on
/// the application.
///
/// The optional latency attribute specifies a time in milliseconds that the listening application should expect
/// from the performer. The optional player and time-only attributes restrict the element to apply to a single
/// player or set of times through a repeated section, respectively.
///
/// Maps the MusicXML `<sync>` element.
public struct MXLSync {

    // MARK: Public Initializers

    /// Creates a new `MXLSync`.
    ///
    /// - Parameter kind:      The style that a score following application should use to synchronize an accompaniment with a performer.
    /// - Parameter latency:   The time, in milliseconds, that the listening application should expect from the performer.
    /// - Parameter player:    Restricts the element to apply to a single player.
    /// - Parameter timeOnly:  Restricts the element to apply to a specific set of times through a repeated section.
    public init(kind: Kind,
                latency: MXLMilliseconds? = nil,
                player: String? = nil,
                timeOnly: MXLTimeOnly? = nil) {
        self.latency = latency
        self.player = player
        self.timeOnly = timeOnly
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The style that a score following application should use to synchronize an accompaniment with a performer.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// The time, in milliseconds, that the listening application should expect from the performer.
    ///
    /// Maps to the MusicXML `latency` attribute.
    public let latency: MXLMilliseconds?

    /// Restricts the element to apply to a single player.
    ///
    /// Maps to the MusicXML `player` attribute.
    public let player: String?

    /// Restricts the element to apply to a specific set of times through a repeated section.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?
}

// MARK: - Equatable

extension MXLSync: Equatable {
}

// MARK: - Hashable

extension MXLSync: Hashable {
}

// MARK: - Sendable

extension MXLSync: Sendable {
}
