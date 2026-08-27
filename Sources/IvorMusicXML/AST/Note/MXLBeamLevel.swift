// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The MusicXML format supports six levels of beaming, up to 1024th notes. Unlike the number-level type, the
/// beam-level type identifies concurrent beams in a beam group. It does not distinguish overlapping beams such as
/// grace notes within regular notes, or beams used in different voices.
public struct MXLBeamLevel: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLBeamLevel` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue:  Identifies concurrent beams in a beam group, from 1 to 8.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// Identifies concurrent beams in a beam group, from 1 to 8.
    public let uintValue: UInt
}

// MARK: -

extension MXLBeamLevel {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLBeamLevel`.
    ///
    /// - Parameter uintValue:  The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `1` and `8`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (1...8).contains(uintValue)
    }
}
