// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNumeral {

    /// The numeral-mode type specifies the mode similar to the mode type, but with a restricted set of values. The
    /// different minor values are used to interpret numeral-root values of 6 and 7 when present in a minor key. The
    /// harmonic minor value sharpens the 7 and the melodic minor value sharpens both 6 and 7. If a minor mode is used
    /// without qualification, either in the mode or numeral-mode elements, natural minor is used.
    ///
    /// Maps the MusicXML `<numeral-mode>` element.
    public enum Mode {

        /// Harmonic minor mode, which sharpens the 7th degree.
        case harmonicMinor

        /// Major mode.
        case major

        /// Melodic minor mode, which sharpens both the 6th and 7th degrees.
        case melodicMinor

        /// A minor mode used without further qualification, equivalent to natural minor.
        case minor

        /// Natural minor mode.
        case naturalMinor
    }
}

// MARK: - Equatable

extension MXLNumeral.Mode: Equatable {
}

// MARK: - Hashable

extension MXLNumeral.Mode: Hashable {
}

// MARK: - Sendable

extension MXLNumeral.Mode: Sendable {
}
