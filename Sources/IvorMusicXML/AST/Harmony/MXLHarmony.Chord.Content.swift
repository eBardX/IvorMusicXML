// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmony.Chord {

    /// One of the alternatives for HarmonyChord.
    public enum Content {
        /// The function element represents classical functional harmony with an indication like I, II, III rather than C,
        /// D, E. It represents the Roman numeral part of a functional harmony rather than the complete function itself.
        /// It has been deprecated as of MusicXML 4.0 in favor of the numeral element.
        case function(MXLStyleText)

        /// The Roman numeral or Nashville number part of a classical functional harmony analysis.
        case numeral(MXLNumeral)

        /// The pitch name used with popular music chord symbols, such as C, D, or E.
        case root(MXLRoot)
    }
}

// MARK: - Equatable

extension MXLHarmony.Chord.Content: Equatable {
}

// MARK: - Hashable

extension MXLHarmony.Chord.Content: Hashable {
}

// MARK: - Sendable

extension MXLHarmony.Chord.Content: Sendable {
}
