// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMetal {

    /// The metal-value type represents pictograms for metal percussion instruments. The hi-hat value refers to a
    /// pictogram like Stone’s high-hat cymbals but without the long vertical line at the bottom.
    public enum Value {

        /// A pictogram of an agogo bell.
        case agogo

        /// A pictogram of an almglocken.
        case almglocken

        /// A pictogram of a bell.
        case bell

        /// A pictogram of a bell plate.
        case bellPlate

        /// A pictogram of a bell tree.
        case bellTree

        /// A pictogram of a brake drum.
        case brakeDrum

        /// A pictogram of a cencerro.
        case cencerro

        /// A pictogram of a chain rattle.
        case chainRattle

        /// A pictogram of a Chinese cymbal.
        case chineseCymbal

        /// A pictogram of a cowbell.
        case cowbell

        /// A pictogram of crash cymbals.
        case crashCymbals

        /// A pictogram of a crotale.
        case crotale

        /// A pictogram of cymbal tongs.
        case cymbalTongs

        /// A pictogram of a domed gong.
        case domedGong

        /// A pictogram of finger cymbals.
        case fingerCymbals

        /// A pictogram of a flexatone.
        case flexatone

        /// A pictogram of a gong.
        case gong

        /// A pictogram of a handbell.
        case handbell

        /// A pictogram of a hi-hat, without the long vertical line at the bottom.
        case hiHat

        /// A pictogram of high-hat cymbals with the long vertical line at the bottom.
        case highHatCymbals

        /// A pictogram of a jaw harp.
        case jawHarp

        /// A pictogram of jingle bells.
        case jingleBells

        /// A pictogram of a musical saw.
        case musicalSaw

        /// A pictogram of shell bells.
        case shellBells

        /// A pictogram of a sistrum.
        case sistrum

        /// A pictogram of a sizzle cymbal.
        case sizzleCymbal

        /// A pictogram of sleigh bells.
        case sleighBells

        /// A pictogram of a suspended cymbal.
        case suspendedCymbal

        /// A pictogram of a tam tam.
        case tamTam

        /// A pictogram of a tam tam with a beater.
        case tamTamWithBeater

        /// A pictogram of a triangle.
        case triangle

        /// A pictogram of a Vietnamese hat cymbal.
        case vietnameseHat
    }
}

// MARK: - Equatable

extension MXLMetal.Value: Equatable {
}

// MARK: - Hashable

extension MXLMetal.Value: Hashable {
}

// MARK: - Sendable

extension MXLMetal.Value: Sendable {
}
