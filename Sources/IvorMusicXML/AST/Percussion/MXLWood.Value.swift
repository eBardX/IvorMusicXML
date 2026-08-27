// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLWood {

    /// The wood-value type represents pictograms for wood percussion instruments. The maraca and maracas values
    /// distinguish the one- and two-maraca versions of the pictogram.
    public enum Value {

        /// A pictogram of a bamboo scraper.
        case bambooScraper

        /// A pictogram of a board clapper.
        case boardClapper

        /// A pictogram of a cabasa.
        case cabasa

        /// A pictogram of castanets.
        case castanets

        /// A pictogram of castanets with a handle.
        case castanetsWithHandle

        /// A pictogram of claves.
        case claves

        /// A pictogram of a football rattle.
        case footballRattle

        /// A pictogram of a guiro.
        case guiro

        /// A pictogram of a log drum.
        case logDrum

        /// A pictogram of a single maraca.
        case maraca

        /// A pictogram of a pair of maracas.
        case maracas

        /// A pictogram of a quijada.
        case quijada

        /// A pictogram of a rainstick.
        case rainstick

        /// A pictogram of a ratchet.
        case ratchet

        /// A pictogram of a reco-reco.
        case recoReco

        /// A pictogram of sandpaper blocks.
        case sandpaperBlocks

        /// A pictogram of a slit drum.
        case slitDrum

        /// A pictogram of a temple block.
        case templeBlock

        /// A pictogram of a vibraslap.
        case vibraslap

        /// A pictogram of a whip.
        case whip

        /// A pictogram of a wood block.
        case woodBlock
    }
}

// MARK: - Equatable

extension MXLWood.Value: Equatable {
}

// MARK: - Hashable

extension MXLWood.Value: Hashable {
}

// MARK: - Sendable

extension MXLWood.Value: Sendable {
}
