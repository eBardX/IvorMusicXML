// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// Octaves are represented by the numbers 0 to 9, where 4 indicates the octave started by middle C.
///
/// Maps the MusicXML `<octave>` element.
public struct MXLOctave: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLOctave` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue:  The octave, from 0 to 9, where 4 indicates the octave started by middle C.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// The octave, from 0 to 9, where 4 indicates the octave started by middle C.
    public let uintValue: UInt
}

// MARK: -

extension MXLOctave {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLOctave`.
    ///
    /// - Parameter uintValue:  The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `0` and `9`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (0...9).contains(uintValue)
    }
}
