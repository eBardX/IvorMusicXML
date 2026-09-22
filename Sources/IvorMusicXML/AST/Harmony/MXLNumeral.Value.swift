// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

extension MXLNumeral {

    /// The numeral-value type represents a Roman numeral or Nashville number value as a positive integer from 1 to 7.
    public struct Value: UIntRepresentable {

        // MARK: Public Initializers

        /// Creates a new `MXLNumeral.Value` with the provided unsigned integer value.
        ///
        /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
        ///
        /// - Parameter uintValue: A Roman numeral or Nashville number value from 1 to 7.
        public init?(uintValue: UInt) {
            guard Self.isValid(uintValue)
            else { return nil }

            self.uintValue = uintValue
        }

        // MARK: Public Instance Properties

        /// A Roman numeral or Nashville number value from 1 to 7.
        public let uintValue: UInt
    }
}

// MARK: -

extension MXLNumeral.Value {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLNumeral.Value`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `1` and `7`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (1...7).contains(uintValue)
    }
}
