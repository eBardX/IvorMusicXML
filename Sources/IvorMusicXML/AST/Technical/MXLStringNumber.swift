// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The string-number type indicates a string number. Strings are numbered from high to low, with 1 being the
/// highest pitched full-length string.
public struct MXLStringNumber: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLStringNumber` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue:  Strings are numbered from high to low, with 1 being the highest pitched full-length
    ///                        string.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// Strings are numbered from high to low, with 1 being the highest pitched full-length string.
    public let uintValue: UInt
}

// MARK: -

extension MXLStringNumber {

    // MARK: Public Type Methods

    /// Returns a Boolean value indicating whether the given unsigned integer value is a valid `MXLStringNumber`.
    ///
    /// - Parameter uintValue:  The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is greater than zero; `false` otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        uintValue > 0
    }
}
