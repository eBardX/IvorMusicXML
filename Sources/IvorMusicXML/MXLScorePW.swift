// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A part-wise MusicXML score.
public struct MXLScorePW {

    // MARK: Public Initializers

    /// Creates a new part-wise score with the provided properties.
    ///
    /// - Parameter work:               The work information for the score,
    ///                                 or `nil` if none.
    /// - Parameter movementNumber:     The movement number, or `nil` if none.
    /// - Parameter movementTitle:      The movement title, or `nil` if none.
    /// - Parameter partList:           The list of parts in the score.
    /// - Parameter parts:              The parts of the score.
    public init(work: MXLWork?,
                movementNumber: String?,
                movementTitle: String?,
                partList: MXLPartList,
                parts: [MXLPartPW]) {
        self.movementNumber = movementNumber
        self.movementTitle = movementTitle
        self.partList = partList
        self.parts = parts
        self.work = work
    }

    // MARK: Public Instance Properties

    /// The movement number, or `nil` if none.
    public let movementNumber: String?

    /// The movement title, or `nil` if none.
    public let movementTitle: String?

    /// The list of parts in the score.
    public let partList: MXLPartList

    /// The parts of the score.
    public let parts: [MXLPartPW]

    /// The work information for the score, or `nil` if none.
    public let work: MXLWork?
}

// MARK: - Sendable

extension MXLScorePW: Sendable {
}
