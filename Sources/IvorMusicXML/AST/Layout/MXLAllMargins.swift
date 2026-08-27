// © 2026 John Gary Pusey (see LICENSE.md)

/// The all-margins group specifies both horizontal and vertical margins in tenths.
public struct MXLAllMargins {

    // MARK: Public Initializers

    /// Creates a new `MXLAllMargins`.
    ///
    /// - Parameter leftRightMargins:  The left-right-margins group specifies horizontal margins in tenths.
    /// - Parameter topMargin:         The top margin, in tenths.
    /// - Parameter bottomMargin:      The bottom margin, in tenths.
    public init(leftRightMargins: MXLLeftRightMargins,
                topMargin: MXLTenths,
                bottomMargin: MXLTenths) {
        self.bottomMargin = bottomMargin
        self.leftRightMargins = leftRightMargins
        self.topMargin = topMargin
    }

    // MARK: Public Instance Properties

    /// The bottom margin, in tenths.
    ///
    /// Maps to a nested MusicXML `<bottom-margin>` element.
    public let bottomMargin: MXLTenths

    /// The left-right-margins group specifies horizontal margins in tenths.
    public let leftRightMargins: MXLLeftRightMargins

    /// The top margin, in tenths.
    ///
    /// Maps to a nested MusicXML `<top-margin>` element.
    public let topMargin: MXLTenths
}

// MARK: - Equatable

extension MXLAllMargins: Equatable {
}

// MARK: - Hashable

extension MXLAllMargins: Hashable {
}

// MARK: - Sendable

extension MXLAllMargins: Sendable {
}
