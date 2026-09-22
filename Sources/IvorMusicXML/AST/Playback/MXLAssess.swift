// © 2026 John Gary Pusey (see LICENSE.md)

/// By default, an assessment application should assess all notes without a cue child element, and not assess any
/// note with a cue child element. The assess type allows this default assessment to be overridden for individual
/// notes. The optional player and time-only attributes restrict the type to apply to a single player or set of
/// times through a repeated section, respectively. If missing, the type applies to all players or all times
/// through the repeated section, respectively. The player attribute references the id attribute of a player
/// element defined within the matching score-part.
///
/// Maps the MusicXML `<assess>` element.
public struct MXLAssess {

    // MARK: Public Initializers

    /// Creates a new `MXLAssess`.
    ///
    /// - Parameter shouldAssess:  A Boolean value indicating whether the note should (`true`) or should not (`false`) be assessed.
    /// - Parameter player:        References the id attribute of a player element defined within the matching score-part, restricting the assessment to that player.
    /// - Parameter timeOnly:      Restricts the assessment to a set of times through a repeated section.
    public init(shouldAssess: Bool,
                player: String? = nil,
                timeOnly: MXLTimeOnly? = nil) {
        self.player = player
        self.timeOnly = timeOnly
        self.shouldAssess = shouldAssess
    }

    // MARK: Public Instance Properties

    /// References the id attribute of a player element defined within the matching score-part, restricting the
    /// assessment to that player.
    ///
    /// Maps to the MusicXML `player` attribute.
    public let player: String?

    /// A Boolean value indicating whether the note should (`true`) or should not (`false`) be assessed.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let shouldAssess: Bool

    /// Restricts the assessment to a set of times through a repeated section.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?
}

// MARK: - Equatable

extension MXLAssess: Equatable {
}

// MARK: - Hashable

extension MXLAssess: Hashable {
}

// MARK: - Sendable

extension MXLAssess: Sendable {
}
