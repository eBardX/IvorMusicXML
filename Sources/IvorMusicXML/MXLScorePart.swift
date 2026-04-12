// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A score part in a MusicXML score.
public struct MXLScorePart {

    // MARK: Public Initializers

    /// Creates a new score part with the provided identifier and name.
    ///
    /// - Parameter id:         The identifier of the score part.
    /// - Parameter partName:   The name of the score part.
    public init(id: String,
                partName: String) {
        self.id = id
        self.partName = partName
    }

    // MARK: Public Instance Properties

    /// The identifier of the score part.
    public let id: String

    /// The name of the score part.
    public let partName: String
}

// MARK: - Sendable

extension MXLScorePart: Sendable {
}
