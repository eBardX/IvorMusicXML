// © 2026 John Gary Pusey (see LICENSE.md)

/// Time signatures are represented by the beats element for the numerator and the beat-type element for the
/// denominator.
public struct MXLTimeSignature {

    // MARK: Public Initializers

    /// Creates a new `MXLTimeSignature`.
    ///
    /// - Parameter beats: The beats element indicates the number of beats, as found in the numerator of a time signature.
    /// - Parameter beatType: The beat-type element indicates the beat unit, as found in the denominator of a time signature.
    public init(beats: String,
                beatType: String) {
        self.beatType = beatType
        self.beats = beats
    }

    // MARK: Public Instance Properties

    /// The beats element indicates the number of beats, as found in the numerator of a time signature.
    public let beats: String

    /// The beat-type element indicates the beat unit, as found in the denominator of a time signature.
    public let beatType: String
}

// MARK: - Equatable

extension MXLTimeSignature: Equatable {
}

// MARK: - Hashable

extension MXLTimeSignature: Hashable {
}

// MARK: - Sendable

extension MXLTimeSignature: Sendable {
}
