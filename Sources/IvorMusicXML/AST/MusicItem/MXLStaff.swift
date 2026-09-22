// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The staff element is defined within a group due to its use by both notes and direction elements.
///
/// Maps the MusicXML `<staff>` element.
public struct MXLStaff {

    // MARK: Public Initializers

    /// Creates a new `MXLStaff` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue: Staff assignment is only needed for music notated on multiple staves. Used by both notes and directions. Staff values are numbers, with 1 referring to the top-most staff in a part.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// Staff assignment is only needed for music notated on multiple staves. Used by both notes and directions. Staff
    /// values are numbers, with 1 referring to the top-most staff in a part.
    public let uintValue: UInt
}

// MARK: -

extension MXLStaff {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLStaff`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is greater than zero; `false` otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        uintValue > 0
    }
}

// MARK: - UIntRepresentable

extension MXLStaff: UIntRepresentable {
}
