// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The midi-128 type is used to express MIDI 1.0 values that range from 1 to 128.
///
/// Maps the MusicXML `<midi-program>` and `<midi-unpitched>` elements.
public struct MXLMidi128: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLMidi128` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue:  A MIDI 1.0 value ranging from 1 to 128.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// A MIDI 1.0 value ranging from 1 to 128.
    public let uintValue: UInt
}

// MARK: -

extension MXLMidi128 {

    // MARK: Public Type Methods

    /// Returns a Boolean value indicating whether the given unsigned integer value is a valid representation for a
    /// `MXLMidi128`.
    ///
    /// - Parameter uintValue:  The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `1` and `128`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (1...128).contains(uintValue)
    }
}
