// © 2026 John Gary Pusey (see LICENSE.md)

/// The left-right-margins group specifies horizontal margins in tenths.
public struct MXLLeftRightMargins {

    // MARK: Public Initializers

    /// Creates a new `MXLLeftRightMargins`.
    ///
    /// - Parameter leftMargin:   The left margin, in tenths.
    /// - Parameter rightMargin:  The right margin, in tenths.
    public init(leftMargin: MXLTenths,
                rightMargin: MXLTenths) {
        self.leftMargin = leftMargin
        self.rightMargin = rightMargin
    }

    // MARK: Public Instance Properties

    /// The left margin, in tenths.
    ///
    /// Maps to a nested MusicXML `<left-margin>` element.
    public let leftMargin: MXLTenths

    /// The right margin, in tenths.
    ///
    /// Maps to a nested MusicXML `<right-margin>` element.
    public let rightMargin: MXLTenths
}

// MARK: - Equatable

extension MXLLeftRightMargins: Equatable {
}

// MARK: - Hashable

extension MXLLeftRightMargins: Hashable {
}

// MARK: - Sendable

extension MXLLeftRightMargins: Sendable {
}
