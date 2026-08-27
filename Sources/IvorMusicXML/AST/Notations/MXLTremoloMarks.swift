// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The number of tremolo marks is represented by a number from 0 to 8: the same as beam-level with 0 added.
public struct MXLTremoloMarks {

    // MARK: Public Initializers

    /// Creates a new `MXLTremoloMarks` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue: The number of tremolo marks, from 0 to 8.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// The number of tremolo marks, from 0 to 8.
    public let uintValue: UInt
}

// MARK: -

extension MXLTremoloMarks {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLTremoloMarks`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `0` and `8`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (0...8).contains(uintValue)
    }
}

// MARK: - UIntRepresentable

extension MXLTremoloMarks: UIntRepresentable {
}
