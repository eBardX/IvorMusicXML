// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// Work information for a MusicXML score.
public struct MXLWork {

    // MARK: Public Initializers

    /// Creates a new work with the provided number and title.
    ///
    /// - Parameter workNumber: The work number, or `nil` if none.
    /// - Parameter workTitle:  The work title, or `nil` if none.
    public init(workNumber: String?,
                workTitle: String?) {
        self.workNumber = workNumber
        self.workTitle = workTitle
    }

    // MARK: Public Instance Properties

    /// The work number, or `nil` if none.
    public let workNumber: String?

    /// The work title, or `nil` if none.
    public let workTitle: String?
}

// MARK: - Sendable

extension MXLWork: Sendable {
}
