// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The accordion-middle type may have values of 1, 2, or 3, corresponding to having 1 to 3 dots in the middle
/// section of the accordion registration symbol. This type is not used if no dots are present.
///
/// Maps the MusicXML `<accordion-middle>` element.
public struct MXLAccordionMiddle: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLAccordionMiddle` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue: The number of dots (1 to 3) in the middle section of the accordion registration
    ///                        symbol.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// The number of dots (1 to 3) in the middle section of the accordion registration symbol.
    public let uintValue: UInt
}

// MARK: -

extension MXLAccordionMiddle {

    // MARK: Public Type Methods

    /// Returns a Boolean value indicating whether the given unsigned integer value is a valid `MXLAccordionMiddle`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `1` and `3`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (1...3).contains(uintValue)
    }
}
