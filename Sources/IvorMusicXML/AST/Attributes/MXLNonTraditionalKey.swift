// © 2026 John Gary Pusey (see LICENSE.md)

/// The non-traditional-key group represents a single alteration within a non-traditional key signature. A
/// sequence of these groups makes up a non-traditional key signature
public struct MXLNonTraditionalKey {

    // MARK: Public Initializers

    /// Creates a new `MXLNonTraditionalKey`.
    ///
    /// - Parameter step: Non-traditional key signatures are represented using a list of altered tones. The key-step element indicates the pitch step to be altered, represented using the same names as in the step element.
    /// - Parameter alter: Non-traditional key signatures are represented using a list of altered tones. The key-alter element represents the alteration for a given pitch step, represented with semitones in the same manner as the alter element.
    /// - Parameter accidental: Non-traditional key signatures are represented using a list of altered tones. The key-accidental element indicates the accidental to be displayed in the key signature, represented in the same manner as the accidental element. It is used for disambiguating microtonal accidentals.
    public init(step: MXLStep,
                alter: MXLSemitones,
                accidental: MXLKeyAccidental? = nil) {
        self.accidental = accidental
        self.alter = alter
        self.step = step
    }

    // MARK: Public Instance Properties

    /// Non-traditional key signatures are represented using a list of altered tones. The key-accidental element
    /// indicates the accidental to be displayed in the key signature, represented in the same manner as the
    /// accidental element. It is used for disambiguating microtonal accidentals.
    ///
    /// Maps to a nested MusicXML `<key-accidental>` element.
    public let accidental: MXLKeyAccidental?

    /// Non-traditional key signatures are represented using a list of altered tones. The key-alter element represents
    /// the alteration for a given pitch step, represented with semitones in the same manner as the alter element.
    ///
    /// Maps to a nested MusicXML `<key-alter>` element.
    public let alter: MXLSemitones

    /// Non-traditional key signatures are represented using a list of altered tones. The key-step element indicates
    /// the pitch step to be altered, represented using the same names as in the step element.
    ///
    /// Maps to a nested MusicXML `<key-step>` element.
    public let step: MXLStep
}

// MARK: - Equatable

extension MXLNonTraditionalKey: Equatable {
}

// MARK: - Hashable

extension MXLNonTraditionalKey: Hashable {
}

// MARK: - Sendable

extension MXLNonTraditionalKey: Sendable {
}
