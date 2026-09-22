// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTranspose {

    /// The transpose group represents what must be added to a written pitch to get a correct sounding pitch.
    ///
    /// Maps the MusicXML `<part-transpose>` and `<transpose>` elements.
    public struct Content {

        // MARK: Public Initializers

        /// Creates a new `MXLTranspose.Content`.
        ///
        /// - Parameter diatonic: The diatonic element specifies the number of pitch steps needed to go from written to sounding pitch. This allows for correct spelling of enharmonic transpositions. This value does not include octave-change values; the values for both elements need to be added to the written pitch to get the correct sounding pitch.
        /// - Parameter chromatic: The chromatic element represents the number of semitones needed to get from written to sounding pitch. This value does not include octave-change values; the values for both elements need to be added to the written pitch to get the correct sounding pitch.
        /// - Parameter octaveChange: The octave-change element indicates how many octaves to add to get from written pitch to sounding pitch. The octave-change element should be included when using transposition intervals of an octave or more, and should not be present for intervals of less than an octave.
        /// - Parameter double: If the double element is present, it indicates that the music is doubled one octave from what is currently written.
        public init(diatonic: MXLDiatonicSteps? = nil,
                    chromatic: MXLSemitones,
                    octaveChange: MXLOctaveChange? = nil,
                    double: MXLDouble? = nil) {
            self.chromatic = chromatic
            self.diatonic = diatonic
            self.double = double
            self.octaveChange = octaveChange
        }

        // MARK: Public Instance Properties

        /// The chromatic element represents the number of semitones needed to get from written to sounding pitch. This
        /// value does not include octave-change values; the values for both elements need to be added to the written
        /// pitch to get the correct sounding pitch.
        ///
        /// Maps to a nested MusicXML `<chromatic>` element.
        public let chromatic: MXLSemitones

        /// The diatonic element specifies the number of pitch steps needed to go from written to sounding pitch. This
        /// allows for correct spelling of enharmonic transpositions. This value does not include octave-change values;
        /// the values for both elements need to be added to the written pitch to get the correct sounding pitch.
        ///
        /// Maps to a nested MusicXML `<diatonic>` element.
        public let diatonic: MXLDiatonicSteps?

        /// If the double element is present, it indicates that the music is doubled one octave from what is currently
        /// written.
        ///
        /// Maps to a nested MusicXML `<double>` element.
        public let double: MXLDouble?

        /// The octave-change element indicates how many octaves to add to get from written pitch to sounding pitch. The
        /// octave-change element should be included when using transposition intervals of an octave or more, and should
        /// not be present for intervals of less than an octave.
        ///
        /// Maps to a nested MusicXML `<octave-change>` element.
        public let octaveChange: MXLOctaveChange?
    }
}

// MARK: - Equatable

extension MXLTranspose.Content: Equatable {
}

// MARK: - Hashable

extension MXLTranspose.Content: Hashable {
}

// MARK: - Sendable

extension MXLTranspose.Content: Sendable {
}
