// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A MusicXML opus that groups a collection of scores.
public struct MXLOpus {

    // MARK: Public Initializers

    /// Creates a new opus with the provided title and items.
    ///
    /// - Parameter title:  The title of the opus.
    /// - Parameter items:  The items in the opus.
    public init(title: String,
                items: [Self.Item]) {
        self.items = items
        self.title = title
    }

    // MARK: Public Instance Properties

    /// The items in the opus.
    public let items: [Self.Item]

    /// The title of the opus.
    public let title: String
}

// MARK: - Sendable

extension MXLOpus: Sendable {
}
