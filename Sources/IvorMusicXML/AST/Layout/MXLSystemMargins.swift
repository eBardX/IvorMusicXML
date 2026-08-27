// © 2026 John Gary Pusey (see LICENSE.md)

/// System margins are relative to the page margins. Positive values indent and negative values reduce the margin
/// size.
///
/// Maps the MusicXML `<system-margins>` element.
public struct MXLSystemMargins {

    // MARK: Public Initializers

    /// Creates a new `MXLSystemMargins`.
    ///
    /// - Parameter leftRightMargins:  The left-right-margins group specifies horizontal margins in tenths.
    public init(leftRightMargins: MXLLeftRightMargins) {
        self.leftRightMargins = leftRightMargins
    }

    // MARK: Public Instance Properties

    /// The left-right-margins group specifies horizontal margins in tenths.
    public let leftRightMargins: MXLLeftRightMargins
}

// MARK: - Equatable

extension MXLSystemMargins: Equatable {
}

// MARK: - Hashable

extension MXLSystemMargins: Hashable {
}

// MARK: - Sendable

extension MXLSystemMargins: Sendable {
}
