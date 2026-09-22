// © 2026 John Gary Pusey (see LICENSE.md)

/// The player type allows for multiple players per score-part for use in listening applications. One player may
/// play multiple instruments, while a single instrument may include multiple players in divisi sections.
///
/// Maps the MusicXML `<player>` element.
public struct MXLPlayer {

    // MARK: Public Initializers

    /// Creates a new `MXLPlayer`.
    ///
    /// - Parameter id: A unique identifier for this player, referenced by other elements to associate content with a specific player.
    /// - Parameter name: The player-name element is typically used within a software application, rather than appearing on the printed page of a score.
    public init(id: String,
                name: String) {
        self.id = id
        self.name = name
    }

    // MARK: Public Instance Properties

    /// A unique identifier for this player, referenced by other elements to associate content with a specific
    /// player.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String

    /// The player-name element is typically used within a software application, rather than appearing on the printed
    /// page of a score.
    ///
    /// Maps to a nested MusicXML `<player-name>` element.
    public let name: String
}

// MARK: - Equatable

extension MXLPlayer: Equatable {
}

// MARK: - Hashable

extension MXLPlayer: Hashable {
}

// MARK: - Sendable

extension MXLPlayer: Sendable {
}
