// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmony {

    /// A harmony element can contain many stacked chords (e.g. V of II). A sequence of harmony-chord groups is used
    /// for this type of secondary function, where V of II would be represented by a harmony-chord with a 5 numeral
    /// followed by a harmony-chord with a 2 numeral.
    ///
    /// A root is a pitch name like C, D, E, while a numeral is a scale degree like 1, 2, 3. The root element is
    /// generally used with pop chord symbols, while the numeral element is generally used with classical functional
    /// harmony and Nashville numbers. It is an either/or choice to avoid data inconsistency. The function element,
    /// which represents Roman numerals with roman numeral text, has been deprecated as of MusicXML 4.0.
    public struct Chord {

        // MARK: Public Initializers

        /// Creates a new `MXLHarmony.Chord`.
        ///
        /// - Parameter content:    One of the alternatives for HarmonyChord.
        /// - Parameter kind:       The kind of chord, such as major, minor, or diminished.
        /// - Parameter inversion:  The harmony inversion, where `0` indicates root position, `1` indicates first inversion, and so on.
        /// - Parameter bass:       The bass note used in popular music chord symbols (e.g. the C in G/C), generally not used together with an inversion.
        /// - Parameter degree:     The individual notes added, altered, or subtracted from the chord kind.
        public init(content: MXLHarmony.Chord.Content,
                    kind: Kind,
                    inversion: MXLInversion? = nil,
                    bass: MXLBass? = nil,
                    degree: [MXLDegree] = []) {
            self.bass = bass
            self.content = content
            self.degree = degree
            self.inversion = inversion
            self.kind = kind
        }

        // MARK: Public Instance Properties

        /// The bass note used in popular music chord symbols (e.g. the C in G/C), generally not used together with
        /// an inversion.
        public let bass: MXLBass?

        /// One of the alternatives for HarmonyChord.
        public let content: MXLHarmony.Chord.Content

        /// The individual notes added, altered, or subtracted from the chord kind.
        public let degree: [MXLDegree]

        /// The harmony inversion, where `0` indicates root position, `1` indicates first inversion, and so on.
        public let inversion: MXLInversion?

        /// The kind of chord, such as major, minor, or diminished.
        public let kind: Kind
    }
}

// MARK: - Equatable

extension MXLHarmony.Chord: Equatable {
}

// MARK: - Hashable

extension MXLHarmony.Chord: Hashable {
}

// MARK: - Sendable

extension MXLHarmony.Chord: Sendable {
}
