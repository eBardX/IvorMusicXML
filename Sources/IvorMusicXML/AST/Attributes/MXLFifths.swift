// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The fifths type represents the number of flats or sharps in a traditional key signature. Negative numbers are
/// used for flats and positive numbers for sharps, reflecting the key’s placement within the circle of fifths
/// (hence the type name).
///
/// Maps the MusicXML `<fifths>` element.
public struct MXLFifths {

    // MARK: Public Initializers

    /// Creates a new `MXLFifths` with the provided integer value.
    ///
    /// - Parameter intValue: Negative values indicate flats and positive values indicate sharps, reflecting the
    ///                       key’s placement within the circle of fifths.
    public init?(intValue: Int) {
        self.intValue = intValue
    }

    // MARK: Public Instance Properties

    /// Negative values indicate flats and positive values indicate sharps, reflecting the key’s placement within
    /// the circle of fifths.
    public let intValue: Int
}

// MARK: - IntRepresentable

extension MXLFifths: IntRepresentable {
}
