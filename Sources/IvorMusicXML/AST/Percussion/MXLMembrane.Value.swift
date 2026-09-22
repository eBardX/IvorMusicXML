// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMembrane {

    /// The membrane-value type represents pictograms for membrane percussion instruments.
    public enum Value {

        /// A pictogram of a bass drum.
        case bassDrum

        /// A pictogram of a bass drum on its side.
        case bassDrumOnSide

        /// A pictogram of bongos.
        case bongos

        /// A pictogram of a Chinese tomtom.
        case chineseTomtom

        /// A pictogram of a conga drum.
        case congaDrum

        /// A pictogram of a cuica.
        case cuica

        /// A pictogram of a goblet drum.
        case gobletDrum

        /// A pictogram of an Indo-American tomtom.
        case indoAmericanTomtom

        /// A pictogram of a Japanese tomtom.
        case japaneseTomtom

        /// A pictogram of a military drum.
        case militaryDrum

        /// A pictogram of a snare drum.
        case snareDrum

        /// A pictogram of a snare drum with the snares off.
        case snareDrumSnaresOff

        /// A pictogram of a tabla.
        case tabla

        /// A pictogram of a tambourine.
        case tambourine

        /// A pictogram of a tenor drum.
        case tenorDrum

        /// A pictogram of timbales.
        case timbales

        /// A pictogram of a tomtom.
        case tomtom
    }
}

// MARK: - Equatable

extension MXLMembrane.Value: Equatable {
}

// MARK: - Hashable

extension MXLMembrane.Value: Hashable {
}

// MARK: - Sendable

extension MXLMembrane.Value: Sendable {
}
