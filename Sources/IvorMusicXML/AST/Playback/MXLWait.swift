// © 2026 John Gary Pusey (see LICENSE.md)

/// The wait type specifies a point where the accompaniment should wait for a performer event before continuing.
/// This typically happens at the start of new sections or after a held note or indeterminate music. These waiting
/// points cannot always be inferred reliably from the contents of the displayed score. The optional player and
/// time-only attributes restrict the type to apply to a single player or set of times through a repeated section,
/// respectively.
///
/// Maps the MusicXML `<wait>` element.
public struct MXLWait {

    // MARK: Public Initializers

    /// Creates a new `MXLWait`.
    ///
    /// - Parameter player:    References the id attribute of a player element defined within the matching score-part, restricting the wait to that player.
    /// - Parameter timeOnly:  Restricts the wait to a set of times through a repeated section.
    public init(player: String? = nil,
                timeOnly: MXLTimeOnly? = nil) {
        self.player = player
        self.timeOnly = timeOnly
    }

    // MARK: Public Instance Properties

    /// References the id attribute of a player element defined within the matching score-part, restricting the
    /// wait to that player.
    ///
    /// Maps to the MusicXML `player` attribute.
    public let player: String?

    /// Restricts the wait to a set of times through a repeated section.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?
}

// MARK: - Equatable

extension MXLWait: Equatable {
}

// MARK: - Hashable

extension MXLWait: Hashable {
}

// MARK: - Sendable

extension MXLWait: Sendable {
}
