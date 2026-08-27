// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmonic {

    /// One of the alternatives for Harmonic.
    public enum Content2 {
        /// The base pitch is the pitch at which the string is played before touching to create the harmonic.
        case basePitch

        /// The sounding-pitch is the pitch which is heard when playing the harmonic.
        case soundingPitch

        /// The touching-pitch is the pitch at which the string is touched lightly to produce the harmonic.
        case touchingPitch
    }
}

// MARK: - Equatable

extension MXLHarmonic.Content2: Equatable {
}

// MARK: - Hashable

extension MXLHarmonic.Content2: Hashable {
}

// MARK: - Sendable

extension MXLHarmonic.Content2: Sendable {
}
