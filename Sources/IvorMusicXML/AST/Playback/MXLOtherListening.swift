// © 2026 John Gary Pusey (see LICENSE.md)

/// The other-listening type represents other types of listening control and interaction. The required type
/// attribute indicates the type of listening to which the element content applies. The optional player and time-
/// only attributes restrict the element to apply to a single player or set of times through a repeated section,
/// respectively.
///
/// Maps the MusicXML `<other-listen>` and `<other-listening>` elements.
public struct MXLOtherListening {

    // MARK: Public Initializers

    /// Creates a new `MXLOtherListening`.
    ///
    /// - Parameter value:     The value of this element.
    /// - Parameter kind:      The type of listening control or interaction to which the element content applies.
    /// - Parameter player:    Restricts the element to apply to a single player.
    /// - Parameter timeOnly:  Restricts the element to apply to a specific set of times through a repeated section.
    public init(value: String,
                kind: String,
                player: String? = nil,
                timeOnly: MXLTimeOnly? = nil) {
        self.player = player
        self.timeOnly = timeOnly
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type of listening control or interaction to which the element content applies.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: String

    /// Restricts the element to apply to a single player.
    ///
    /// Maps to the MusicXML `player` attribute.
    public let player: String?

    /// Restricts the element to apply to a specific set of times through a repeated section.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLOtherListening: Equatable {
}

// MARK: - Hashable

extension MXLOtherListening: Hashable {
}

// MARK: - Sendable

extension MXLOtherListening: Sendable {
}
