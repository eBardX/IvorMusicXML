// © 2026 John Gary Pusey (see LICENSE.md)

/// The dashed-formatting entity represents the length of dashes and spaces in a dashed line. Both the dash-length
/// and space-length attributes are represented in tenths. These attributes are ignored if the corresponding line-
/// type attribute is not dashed.
public struct MXLDashedFormatting {

    // MARK: Public Initializers

    /// Creates a new `MXLDashedFormatting`.
    ///
    /// - Parameter dashLength:   The length, in tenths, of the dashes in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter spaceLength:  The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is not dashed.
    public init(dashLength: MXLTenths? = nil,
                spaceLength: MXLTenths? = nil) {
        self.dashLength = dashLength
        self.spaceLength = spaceLength
    }

    // MARK: Public Instance Properties

    /// The length, in tenths, of the dashes in a dashed line. Ignored if the corresponding line-type attribute is
    /// not dashed.
    ///
    /// Maps to the MusicXML `dash-length` attribute.
    public let dashLength: MXLTenths?

    /// The length, in tenths, of the spaces in a dashed line. Ignored if the corresponding line-type attribute is
    /// not dashed.
    ///
    /// Maps to the MusicXML `space-length` attribute.
    public let spaceLength: MXLTenths?
}

// MARK: - Equatable

extension MXLDashedFormatting: Equatable {
}

// MARK: - Hashable

extension MXLDashedFormatting: Hashable {
}

// MARK: - Sendable

extension MXLDashedFormatting: Sendable {
}
