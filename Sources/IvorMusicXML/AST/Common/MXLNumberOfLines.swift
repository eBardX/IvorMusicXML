// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The number-of-lines type is used to specify the number of lines in text decoration attributes.
public struct MXLNumberOfLines: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLNumberOfLines` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue: The number of lines used in a text decoration attribute: `0` (none), `1`, `2`, or `3`.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// The number of lines used in a text decoration attribute: `0` (none), `1`, `2`, or `3`.
    public let uintValue: UInt
}

// MARK: -

extension MXLNumberOfLines {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLNumberOfLines`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `0` and `3`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (0...3).contains(uintValue)
    }
}
