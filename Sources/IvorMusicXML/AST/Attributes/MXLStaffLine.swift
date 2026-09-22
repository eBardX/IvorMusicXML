// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The staff-line type indicates the line on a given staff. Staff lines are numbered from bottom to top, with 1
/// being the bottom line on a staff.
public struct MXLStaffLine {

    // MARK: Public Initializers

    /// Creates a new `MXLStaffLine` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue: Staff lines are numbered from bottom to top, with 1 being the bottom line on a
    ///                        staff.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// Staff lines are numbered from bottom to top, with 1 being the bottom line on a staff.
    public let uintValue: UInt
}

// MARK: -

extension MXLStaffLine {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLStaffLine`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is greater than zero; `false` otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        uintValue > 0
    }
}

// MARK: - UIntRepresentable

extension MXLStaffLine: UIntRepresentable {
}
