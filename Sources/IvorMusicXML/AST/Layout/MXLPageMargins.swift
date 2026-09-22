// © 2026 John Gary Pusey (see LICENSE.md)

/// Page margins are specified either for both even and odd pages, or via separate odd and even page number
/// values. The type attribute is not needed when used as part of a print element. If omitted when the page-
/// margins type is used in the defaults element, “both” is the default value.
///
/// Maps the MusicXML `<page-margins>` element.
public struct MXLPageMargins {

    // MARK: Public Initializers

    /// Creates a new `MXLPageMargins`.
    ///
    /// - Parameter allMargins:  The all-margins group specifies both horizontal and vertical margins in tenths.
    /// - Parameter kind:        Indicates whether the margins apply to odd pages, even pages, or both. Defaults to `both` if not specified.
    public init(allMargins: MXLAllMargins,
                kind: Kind? = nil) {
        self.allMargins = allMargins
        self.kind = kind ?? .both
    }

    // MARK: Public Instance Properties

    /// The all-margins group specifies both horizontal and vertical margins in tenths.
    public let allMargins: MXLAllMargins

    /// Indicates whether the margins apply to odd pages, even pages, or both. Defaults to `both` if not specified.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind
}

// MARK: - Equatable

extension MXLPageMargins: Equatable {
}

// MARK: - Hashable

extension MXLPageMargins: Hashable {
}

// MARK: - Sendable

extension MXLPageMargins: Sendable {
}
