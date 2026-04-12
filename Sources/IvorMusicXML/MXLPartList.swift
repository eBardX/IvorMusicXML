// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A list of score parts in a MusicXML score.
public struct MXLPartList {

    // MARK: Public Initializers

    /// Creates a new part list with the provided score parts.
    ///
    /// - Parameter scoreParts: The score parts in the part list.
    public init(scoreParts: [MXLScorePart]) {
        self.scoreParts = scoreParts
    }

    // MARK: Public Instance Properties

    /// The score parts in the part list.
    public let scoreParts: [MXLScorePart]
}

// MARK: - Sendable

extension MXLPartList: Sendable {
}
