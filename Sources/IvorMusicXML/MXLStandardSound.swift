// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A standard MusicXML sound.
public struct MXLStandardSound {

    // MARK: Public Initializers

    /// Creates a new standard sound with the provided identifier.
    ///
    /// - Parameter id: The identifier of the standard sound.
    public init(id: String) {
        self.id = id
    }

    // MARK: Public Instance Properties

    /// The identifier of the standard sound.
    public let id: String
}

// MARK: - Sendable

extension MXLStandardSound: Sendable {
}
