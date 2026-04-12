// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A time-wise MusicXML score.
public struct MXLScoreTW {

    // MARK: Public Initializers

    /// Creates a new time-wise score with the provided properties.
    ///
    /// - Parameter work:               The work information for the score,
    ///                                 or `nil` if none.
    /// - Parameter movementNumber:     The movement number, or `nil` if none.
    /// - Parameter movementTitle:      The movement title, or `nil` if none.
    /// - Parameter partList:           The list of parts in the score.
    /// - Parameter measures:           The measures of the score.
    public init(work: MXLWork?,
                movementNumber: String?,
                movementTitle: String?,
                partList: MXLPartList,
                measures: [MXLMeasureTW]) {
        self.measures = measures
        self.movementNumber = movementNumber
        self.movementTitle = movementTitle
        self.partList = partList
        self.work = work
    }

    // MARK: Public Instance Properties

    /// The measures of the score.
    public let measures: [MXLMeasureTW]

    /// The movement number, or `nil` if none.
    public let movementNumber: String?

    /// The movement title, or `nil` if none.
    public let movementTitle: String?

    /// The list of parts in the score.
    public let partList: MXLPartList

    /// The work information for the score, or `nil` if none.
    public let work: MXLWork?
}

// MARK: - Sendable

extension MXLScoreTW: Sendable {
}
