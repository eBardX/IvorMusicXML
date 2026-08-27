// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// Slurs, tuplets, and many other features can be concurrent and overlap within a single musical part. The
/// number-level entity distinguishes up to 16 concurrent objects of the same type when the objects overlap in
/// MusicXML document order. Values greater than 6 are usually only needed for music with a large number of divisi
/// staves in a single part, or if there are more than 6 cross-staff arpeggios in a single measure. When a number-
/// level value is implied, the value is 1 by default.
///
/// When polyphonic parts are involved, the ordering within a MusicXML document can differ from musical score
/// order. As an example, say we have a piano part in 4/4 where within a single measure, all the notes on the top
/// staff are followed by all the notes on the bottom staff. In this example, each staff has a slur that starts on
/// beat 2 and stops on beat 3, and there is a third slur that goes from beat 1 of one staff to beat 4 of the
/// other staff.
///
/// In this situation, the two mid-measure slurs can use the same number because they do not overlap in MusicXML
/// document order, even though they do overlap in musical score order. Within the MusicXML document, the top
/// staff slur will both start and stop before the bottom staff slur starts and stops.
///
/// If the cross-staff slur starts in the top staff and stops in the bottom staff, it will need a separate number
/// from the mid-measure slurs because it overlaps those slurs in MusicXML document order. However, if the cross-
/// staff slur starts in the bottom staff and stops in the top staff, all three slurs can use the same number.
/// None of them overlap within the MusicXML document, even though they all overlap each other in the musical
/// score order. Within the MusicXML document, the start and stop of the top-staff slur will be followed by the
/// stop and start of the cross-staff slur, followed by the start and stop of the bottom-staff slur.
///
/// As this example demonstrates, a reading program should be prepared to handle cases where the number-levels
/// start and stop in an arbitrary order. Because the start and stop values refer to musical score order, a
/// program may find the stopping point of an object earlier in the MusicXML document than it will find its
/// starting point.
public struct MXLNumberLevel: UIntRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLNumberLevel` with the provided unsigned integer value.
    ///
    /// If the provided unsigned integer value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter uintValue: Distinguishes up to 16 concurrent objects of the same type when the objects overlap
    ///                        in MusicXML document order.
    public init?(uintValue: UInt) {
        guard Self.isValid(uintValue)
        else { return nil }

        self.uintValue = uintValue
    }

    // MARK: Public Instance Properties

    /// Distinguishes up to 16 concurrent objects of the same type when the objects overlap in MusicXML document
    /// order.
    public let uintValue: UInt
}

// MARK: -

extension MXLNumberLevel {

    // MARK: Public Type Methods

    /// Determines if the provided unsigned integer value is a valid representation for a `MXLNumberLevel`.
    ///
    /// - Parameter uintValue: The unsigned integer value to check for validity.
    ///
    /// - Returns: `true` when the provided unsigned integer value is between `1` and `16`, inclusive; `false`
    ///            otherwise.
    public static func isValid(_ uintValue: UInt) -> Bool {
        (1...16).contains(uintValue)
    }
}
