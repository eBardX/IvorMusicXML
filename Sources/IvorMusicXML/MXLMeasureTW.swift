// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A measure in a time-wise MusicXML score.
public struct MXLMeasureTW {

    // MARK: Public Initializers

    /// Creates a new time-wise measure with the provided number and parts.
    ///
    /// - Parameter number: The measure number.
    /// - Parameter parts:  The parts in the measure.
    public init(number: String,
                parts: [MXLPartTW]) {
        self.number = number
        self.parts = parts
    }

    // MARK: Public Instance Properties

    /// The measure number.
    public let number: String

    /// The parts in the measure.
    public let parts: [MXLPartTW]
}

// MARK: - Sendable

extension MXLMeasureTW: Sendable {
}
