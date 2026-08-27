// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The staff-line-position type indicates the line position on a given staff. Staff lines are numbered from
/// bottom to top, with 1 being the bottom line on a staff. A staff-line-position value can extend beyond the
/// range of the lines on the current staff.
///
/// Maps the MusicXML `<line>` element.
public struct MXLStaffLinePosition {

    // MARK: Public Initializers

    /// Creates a new `MXLStaffLinePosition` with the provided integer value.
    ///
    /// - Parameter intValue: Staff lines are numbered from bottom to top, with 1 being the bottom line on a staff.
    ///                       This value can extend beyond the range of the lines on the current staff.
    public init?(intValue: Int) {
        self.intValue = intValue
    }

    // MARK: Public Instance Properties

    /// Staff lines are numbered from bottom to top, with 1 being the bottom line on a staff. This value can extend
    /// beyond the range of the lines on the current staff.
    public let intValue: Int
}

// MARK: - IntRepresentable

extension MXLStaffLinePosition: IntRepresentable {
}
