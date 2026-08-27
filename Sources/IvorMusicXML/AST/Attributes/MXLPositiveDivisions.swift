// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The positive-divisions type restricts divisions values to positive numbers.
///
/// Maps the MusicXML `<divisions>` and `<duration>` elements.
public struct MXLPositiveDivisions {

    // MARK: Public Initializers

    /// Creates a new `MXLPositiveDivisions` with the provided integer value.
    ///
    /// If the provided integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter intValue: A positive value expressed in terms of the musical divisions defined by the divisions
    ///                       element.
    public init?(intValue: Int) {
        guard Self.isValid(intValue)
        else { return nil }

        self.intValue = intValue
    }

    // MARK: Public Instance Properties

    /// A positive value expressed in terms of the musical divisions defined by the divisions element.
    public let intValue: Int
}

// MARK: -

extension MXLPositiveDivisions {

    // MARK: Public Type Methods

    /// Determines if the provided integer value is a valid representation for a `MXLPositiveDivisions`.
    ///
    /// - Parameter intValue: The integer value to check for validity.
    ///
    /// - Returns: `true` when the provided integer value is greater than zero; `false` otherwise.
    public static func isValid(_ intValue: Int) -> Bool {
        intValue > 0
    }
}

// MARK: - IntRepresentable

extension MXLPositiveDivisions: IntRepresentable {
}
