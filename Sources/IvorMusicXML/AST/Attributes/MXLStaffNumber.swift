// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The staff-number type indicates staff numbers within a multi-staff part. Staves are numbered from top to
/// bottom, with 1 being the top staff on a part.
public struct MXLStaffNumber {

    // MARK: Public Initializers

    /// Creates a new `MXLStaffNumber` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue: Staff numbers within a multi-staff part are numbered from top to bottom, with 1 being
    ///                        the top staff on a part.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// Staff numbers within a multi-staff part are numbered from top to bottom, with 1 being the top staff on a
    /// part.
    public let uintValue: UInt
}

// MARK: -

extension MXLStaffNumber {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLStaffNumber`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is greater than zero; `false` otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        uintValue > 0
    }
}

// MARK: - UIntRepresentable

extension MXLStaffNumber: UIntRepresentable {
}
