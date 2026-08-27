// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLBeater {

    /// The beater-value type represents pictograms for beaters, mallets, and sticks that do not have different
    /// materials represented in the pictogram. The finger and hammer values are in addition to Stone’s list.
    public enum Value {

        /// A pictogram of a bow.
        case bow

        /// A pictogram of a chime hammer.
        case chimeHammer

        /// A pictogram of a coin.
        case coin

        /// A pictogram of a drum stick.
        case drumStick

        /// A pictogram of a finger.
        case finger

        /// A pictogram of a fingernail.
        case fingernail

        /// A pictogram of a fist.
        case fist

        /// A pictogram of a guiro scraper.
        case guiroScraper

        /// A pictogram of a hammer.
        case hammer

        /// A pictogram of a hand.
        case hand

        /// A pictogram of a jazz stick.
        case jazzStick

        /// A pictogram of a knitting needle.
        case knittingNeedle

        /// A pictogram of a metal hammer.
        case metalHammer

        /// A pictogram of a slide brush on gong.
        case slideBrushOnGong

        /// A pictogram of a snare stick.
        case snareStick

        /// A pictogram of a spoon mallet.
        case spoonMallet

        /// A pictogram of a superball beater.
        case superball

        /// A pictogram of a triangle beater.
        case triangleBeater

        /// A pictogram of a plain triangle beater.
        case triangleBeaterPlain

        /// A pictogram of a wire brush.
        case wireBrush
    }
}

// MARK: - Equatable

extension MXLBeater.Value: Equatable {
}

// MARK: - Hashable

extension MXLBeater.Value: Hashable {
}

// MARK: - Sendable

extension MXLBeater.Value: Sendable {
}
