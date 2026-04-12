// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A measure in a part-wise MusicXML score.
public struct MXLMeasurePW {

    // MARK: Public Initializers

    /// Creates a new part-wise measure with the provided number and items.
    ///
    /// - Parameter number: The measure number.
    /// - Parameter items:  The music items in the measure.
    public init(number: String,
                items: [MXLMusicItem]) {
        self.items = items
        self.number = number
    }

    // MARK: Public Instance Properties

    /// The music items in the measure.
    public let items: [MXLMusicItem]

    /// The measure number.
    public let number: String
}

// MARK: - Sendable

extension MXLMeasurePW: Sendable {
}
