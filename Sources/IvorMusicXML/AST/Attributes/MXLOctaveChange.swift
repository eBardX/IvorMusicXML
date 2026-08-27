// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The number of octaves to shift a pitch or clef, such as when transposing a written pitch to a sounding pitch
/// (the octave-change element) or positioning a treble clef for tenors, which would use a value of -1 (the
/// clef-octave-change element).
///
/// Maps the MusicXML `<clef-octave-change>` and `<octave-change>` elements.
public struct MXLOctaveChange {

    // MARK: Public Initializers

    /// Creates a new `MXLOctaveChange` with the provided integer value.
    ///
    /// - Parameter intValue: The number of octaves to shift a written pitch or clef.
    public init?(intValue: Int) {
        self.intValue = intValue
    }

    // MARK: Public Instance Properties

    /// The number of octaves to shift a written pitch or clef.
    public let intValue: Int
}

// MARK: - IntRepresentable

extension MXLOctaveChange: IntRepresentable {
}
