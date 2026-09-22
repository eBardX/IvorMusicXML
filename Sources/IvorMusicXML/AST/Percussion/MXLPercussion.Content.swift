// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPercussion {

    /// One of the alternatives for Percussion.
    public enum Content {
        /// The beater element represents pictograms for beaters, mallets, and sticks used in percussion notation.
        case beater(MXLBeater)

        /// The effect element represents pictograms for sound effect percussion instruments.
        case effect(MXLEffect)

        /// The glass element represents pictograms for glass percussion instruments.
        case glass(MXLGlass)

        /// The membrane element represents pictograms for membrane percussion instruments.
        case membrane(MXLMembrane)

        /// The metal element represents pictograms for metal percussion instruments.
        case metal(MXLMetal)

        /// The other-percussion element represents percussion pictograms not defined elsewhere.
        case otherPercussion(MXLOtherText)

        /// The pitched element represents pictograms for pitched percussion instruments.
        case pitched(MXLPitched)

        /// The stick element represents pictograms where the material of the stick, mallet, or beater is included.
        case stick(MXLStick)

        /// The stick-location element represents pictograms for the location of sticks, beaters, or mallets on a
        /// cymbal.
        case stickLocation(MXLStickLocation)

        /// The timpani element represents the timpani pictogram.
        case timpani(MXLTimpani)

        /// The wood element represents pictograms for wood percussion instruments.
        case wood(MXLWood)
    }
}

// MARK: - Equatable

extension MXLPercussion.Content: Equatable {
}

// MARK: - Hashable

extension MXLPercussion.Content: Hashable {
}

// MARK: - Sendable

extension MXLPercussion.Content: Sendable {
}
