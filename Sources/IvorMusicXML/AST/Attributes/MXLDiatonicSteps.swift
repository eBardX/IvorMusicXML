// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The number of diatonic pitch steps needed to go from a written to a sounding pitch. This allows for correct
/// spelling of enharmonic transpositions. This value does not include octave-change values; the values for both
/// need to be added to the written pitch to get the correct sounding pitch.
///
/// Maps the MusicXML `<diatonic>` element.
public struct MXLDiatonicSteps {

    // MARK: Public Initializers

    /// Creates a new `MXLDiatonicSteps` with the provided integer value.
    ///
    /// - Parameter intValue: The number of diatonic pitch steps needed to go from a written to a sounding pitch.
    public init?(intValue: Int) {
        self.intValue = intValue
    }

    // MARK: Public Instance Properties

    /// The number of diatonic pitch steps needed to go from a written to a sounding pitch.
    public let intValue: Int
}

// MARK: - IntRepresentable

extension MXLDiatonicSteps: IntRepresentable {
}
