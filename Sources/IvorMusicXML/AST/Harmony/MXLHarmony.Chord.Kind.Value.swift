// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHarmony.Chord.Kind {

    /// A kind-value indicates the type of chord. Degree elements can then add, subtract, or alter from these starting
    /// points. Values include:
    ///
    /// Triads: major (major third, perfect fifth) minor (minor third, perfect fifth) augmented (major third,
    /// augmented fifth) diminished (minor third, diminished fifth) Sevenths: dominant (major triad, minor seventh)
    /// major-seventh (major triad, major seventh) minor-seventh (minor triad, minor seventh) diminished-seventh
    /// (diminished triad, diminished seventh) augmented-seventh (augmented triad, minor seventh) half-diminished
    /// (diminished triad, minor seventh) major-minor (minor triad, major seventh) Sixths: major-sixth (major triad,
    /// added sixth) minor-sixth (minor triad, added sixth) Ninths: dominant-ninth (dominant-seventh, major ninth)
    /// major-ninth (major-seventh, major ninth) minor-ninth (minor-seventh, major ninth) 11ths (usually as the basis
    /// for alteration): dominant-11th (dominant-ninth, perfect 11th) major-11th (major-ninth, perfect 11th)
    /// minor-11th (minor-ninth, perfect 11th) 13ths (usually as the basis for alteration): dominant-13th
    /// (dominant-11th, major 13th) major-13th (major-11th, major 13th) minor-13th (minor-11th, major 13th) Suspended:
    /// suspended-second (major second, perfect fifth) suspended-fourth (perfect fourth, perfect fifth) Functional
    /// sixths: Neapolitan Italian French German Other: pedal (pedal-point bass) power (perfect fifth) Tristan
    ///
    /// The “other” kind is used when the harmony is entirely composed of add elements.
    ///
    /// The “none” kind is used to explicitly encode absence of chords or functional harmony. In this case, the root,
    /// numeral, or function element has no meaning. When using the root or numeral element, the root-step or numeral-
    /// step text attribute should be set to the empty string to keep the root or numeral from being displayed.
    public enum Value {

        /// An augmented triad (major third, augmented fifth).
        case augmented

        /// An augmented seventh chord (augmented triad, minor seventh).
        case augmentedSeventh

        /// A diminished triad (minor third, diminished fifth).
        case diminished

        /// A diminished seventh chord (diminished triad, diminished seventh).
        case diminishedSeventh

        /// A dominant seventh chord (major triad, minor seventh).
        case dominant

        /// A dominant 11th chord (dominant-ninth, perfect 11th).
        case dominant11th

        /// A dominant 13th chord (dominant-11th, major 13th).
        case dominant13th

        /// A dominant ninth chord (dominant-seventh, major ninth).
        case dominantNinth

        /// A French augmented sixth chord.
        case french

        /// A German augmented sixth chord.
        case german

        /// A half-diminished seventh chord (diminished triad, minor seventh).
        case halfDiminished

        /// An Italian augmented sixth chord.
        case italian

        /// A major triad (major third, perfect fifth).
        case major

        /// A major 11th chord (major-ninth, perfect 11th).
        case major11th

        /// A major 13th chord (major-11th, major 13th).
        case major13th

        /// A major-minor seventh chord (minor triad, major seventh).
        case majorMinor

        /// A major ninth chord (major-seventh, major ninth).
        case majorNinth

        /// A major seventh chord (major triad, major seventh).
        case majorSeventh

        /// A major sixth chord (major triad, added sixth).
        case majorSixth

        /// A minor triad (minor third, perfect fifth).
        case minor

        /// A minor 11th chord (minor-ninth, perfect 11th).
        case minor11th

        /// A minor 13th chord (minor-11th, major 13th).
        case minor13th

        /// A minor ninth chord (minor-seventh, major ninth).
        case minorNinth

        /// A minor seventh chord (minor triad, minor seventh).
        case minorSeventh

        /// A minor sixth chord (minor triad, added sixth).
        case minorSixth

        /// A Neapolitan sixth chord.
        case neapolitan

        /// No chord or functional harmony, used to explicitly encode the absence of a chord.
        case noChord

        /// A chord entirely composed of add elements, not covered by the other kind values.
        case other

        /// A pedal-point bass.
        case pedal

        /// A power chord (perfect fifth).
        case power

        /// A suspended fourth chord (perfect fourth, perfect fifth).
        case suspendedFourth

        /// A suspended second chord (major second, perfect fifth).
        case suspendedSecond

        /// A Tristan chord.
        case tristan
    }
}

// MARK: - Equatable

extension MXLHarmony.Chord.Kind.Value: Equatable {
}

// MARK: - Hashable

extension MXLHarmony.Chord.Kind.Value: Hashable {
}

// MARK: - Sendable

extension MXLHarmony.Chord.Kind.Value: Sendable {
}
