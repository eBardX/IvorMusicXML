// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The milliseconds type represents an integral number of milliseconds.
public struct MXLMilliseconds: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLMilliseconds` with the provided unsigned integer value.
    ///
    /// - Parameter uintValue: An integral number of milliseconds.
    public init?(uintValue: UInt) {
        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// An integral number of milliseconds.
    public let uintValue: UInt
}
