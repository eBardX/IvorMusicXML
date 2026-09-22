// © 2026 John Gary Pusey (see LICENSE.md)

/// The pedal-tuning type specifies the tuning of a single harp pedal.
///
/// Maps the MusicXML `<pedal-tuning>` element.
public struct MXLPedalTuning {

    // MARK: Public Initializers

    /// Creates a new `MXLPedalTuning`.
    ///
    /// - Parameter pedalStep: The pedal-step element defines the pitch step for a single harp pedal.
    /// - Parameter pedalAlter: The pedal-alter element defines the chromatic alteration for a single harp pedal.
    public init(pedalStep: MXLStep,
                pedalAlter: MXLSemitones) {
        self.pedalAlter = pedalAlter
        self.pedalStep = pedalStep
    }

    // MARK: Public Instance Properties

    /// The pedal-alter element defines the chromatic alteration for a single harp pedal.
    ///
    /// Maps to a nested MusicXML `<pedal-alter>` element.
    public let pedalAlter: MXLSemitones

    /// The pedal-step element defines the pitch step for a single harp pedal.
    ///
    /// Maps to a nested MusicXML `<pedal-step>` element.
    public let pedalStep: MXLStep
}

// MARK: - Equatable

extension MXLPedalTuning: Equatable {
}

// MARK: - Hashable

extension MXLPedalTuning: Hashable {
}

// MARK: - Sendable

extension MXLPedalTuning: Sendable {
}
