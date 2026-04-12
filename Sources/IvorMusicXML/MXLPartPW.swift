// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A part in a part-wise MusicXML score.
public struct MXLPartPW {

    // MARK: Public Initializers

    /// Creates a new part-wise part with the provided identifier and measures.
    ///
    /// - Parameter id:         The identifier of the part.
    /// - Parameter measures:   The measures in the part.
    public init(id: String,
                measures: [MXLMeasurePW]) {
        self.id = id
        self.measures = measures
    }

    // MARK: Public Instance Properties

    /// The identifier of the part.
    public let id: String

    /// The measures in the part.
    public let measures: [MXLMeasurePW]
}

// MARK: - Sendable

extension MXLPartPW: Sendable {
}
