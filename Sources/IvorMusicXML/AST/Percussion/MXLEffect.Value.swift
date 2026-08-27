// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLEffect {

    /// The effect-value type represents pictograms for sound effect percussion instruments. The cannon, lotus flute,
    /// and megaphone values are in addition to Stone’s list.
    public enum Value {

        /// A pictogram of an anvil.
        case anvil

        /// A pictogram of an auto horn.
        case autoHorn

        /// A pictogram of a bird whistle.
        case birdWhistle

        /// A pictogram of a cannon.
        case cannon

        /// A pictogram of a duck call.
        case duckCall

        /// A pictogram of a gun shot.
        case gunShot

        /// A pictogram of a klaxon horn.
        case klaxonHorn

        /// A pictogram of a lion’s roar.
        case lionsRoar

        /// A pictogram of a lotus flute.
        case lotusFlute

        /// A pictogram of a megaphone.
        case megaphone

        /// A pictogram of a police whistle.
        case policeWhistle

        /// A pictogram of a siren.
        case siren

        /// A pictogram of a slide whistle.
        case slideWhistle

        /// A pictogram of a thunder sheet.
        case thunderSheet

        /// A pictogram of a wind machine.
        case windMachine

        /// A pictogram of a wind whistle.
        case windWhistle
    }
}

// MARK: - Equatable

extension MXLEffect.Value: Equatable {
}

// MARK: - Hashable

extension MXLEffect.Value: Hashable {
}

// MARK: - Sendable

extension MXLEffect.Value: Sendable {
}
