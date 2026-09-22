// © 2026 John Gary Pusey (see LICENSE.md)

/// The staff-size element indicates how large a staff space is on this staff, expressed as a percentage of the
/// work’s default scaling. Values less than 100 make the staff space smaller while values over 100 make the staff
/// space larger. A staff-type of cue, ossia, or editorial implies a staff-size of less than 100, but the exact
/// value is implementation-dependent unless specified here. Staff size affects staff height only, not the
/// relationship of the staff to the left and right margins.
///
/// In some cases, a staff-size different than 100 also scales the notation on the staff, such as with a cue
/// staff. In other cases, such as percussion staves, the lines may be more widely spaced without scaling the
/// notation on the staff. The scaling attribute allows these two cases to be distinguished. It specifies the
/// percentage scaling that applies to the notation. Values less that 100 make the notation smaller while values
/// over 100 make the notation larger. The staff-size content and scaling attribute are both non-negative decimal
/// values.
///
/// Maps the MusicXML `<staff-size>` element.
public struct MXLStaffSize {

    // MARK: Public Initializers

    /// Creates a new `MXLStaffSize`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter scaling: The percentage scaling that applies to the notation on this staff, distinct from the staff space scaling. Values less than 100 make the notation smaller while values over 100 make the notation larger.
    public init(value: Double,
                scaling: MXLNonNegativeDecimal? = nil) {
        self.scaling = scaling
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The percentage scaling that applies to the notation on this staff, distinct from the staff space scaling.
    /// Values less than 100 make the notation smaller while values over 100 make the notation larger.
    ///
    /// Maps to the MusicXML `scaling` attribute.
    public let scaling: MXLNonNegativeDecimal?

    /// The value of this element.
    public let value: Double
}

// MARK: - Equatable

extension MXLStaffSize: Equatable {
}

// MARK: - Hashable

extension MXLStaffSize: Hashable {
}

// MARK: - Sendable

extension MXLStaffSize: Sendable {
}
