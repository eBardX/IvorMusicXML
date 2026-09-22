// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The divisions type is used to express values in terms of the musical divisions defined by the divisions
/// element. It is preferred that these be integer values both for MIDI interoperability and to avoid roundoff
/// errors.
public struct MXLDivisions {

    // MARK: Public Initializers

    /// Creates a new `MXLDivisions` with the provided integer value.
    ///
    /// - Parameter intValue: A value expressed in terms of the musical divisions defined by the divisions element.
    public init?(intValue: Int) {
        self.intValue = intValue
    }

    // MARK: Public Instance Properties

    /// A value expressed in terms of the musical divisions defined by the divisions element.
    public let intValue: Int
}

// MARK: - IntRepresentable

extension MXLDivisions: IntRepresentable {
}
