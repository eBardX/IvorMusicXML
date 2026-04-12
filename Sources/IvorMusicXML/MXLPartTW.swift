// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A part in a time-wise MusicXML score.
public struct MXLPartTW {

    // MARK: Public Initializers

    /// Creates a new time-wise part with the provided identifier and items.
    ///
    /// - Parameter id:     The identifier of the part.
    /// - Parameter items:  The music items in the part.
    public init(id: String,
                items: [MXLMusicItem]) {
        self.id = id
        self.items = items
    }

    // MARK: Public Instance Properties

    /// The identifier of the part.
    public let id: String

    /// The music items in the part.
    public let items: [MXLMusicItem]
}

// MARK: - Sendable

extension MXLPartTW: Sendable {
}
