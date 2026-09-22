// © 2026 John Gary Pusey (see LICENSE.md)

/// Margins, page sizes, and distances are all measured in tenths to keep MusicXML data in a consistent coordinate
/// system as much as possible. The translation to absolute units is done with the scaling type, which specifies
/// how many millimeters are equal to how many tenths. For a staff height of 7 mm, millimeters would be set to 7
/// while tenths is set to 40. The ability to set a formula rather than a single scaling factor helps avoid
/// roundoff errors.
///
/// Maps the MusicXML `<scaling>` element.
public struct MXLScaling {

    // MARK: Public Initializers

    /// Creates a new `MXLScaling`.
    ///
    /// - Parameter millimeters:  The number of millimeters that correspond to the given number of tenths.
    /// - Parameter tenths:       The number of tenths that correspond to the given number of millimeters.
    public init(millimeters: MXLMillimeters,
                tenths: MXLTenths) {
        self.millimeters = millimeters
        self.tenths = tenths
    }

    // MARK: Public Instance Properties

    /// The number of millimeters that correspond to the given number of tenths.
    ///
    /// Maps to a nested MusicXML `<millimeters>` element.
    public let millimeters: MXLMillimeters

    /// The number of tenths that correspond to the given number of millimeters.
    ///
    /// Maps to a nested MusicXML `<tenths>` element.
    public let tenths: MXLTenths
}

// MARK: - Equatable

extension MXLScaling: Equatable {
}

// MARK: - Hashable

extension MXLScaling: Hashable {
}

// MARK: - Sendable

extension MXLScaling: Sendable {
}
