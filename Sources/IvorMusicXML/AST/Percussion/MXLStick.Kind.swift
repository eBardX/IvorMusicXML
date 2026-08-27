// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLStick {

    /// The stick-type type represents the shape of pictograms where the material in the stick, mallet, or beater is
    /// represented in the pictogram.
    ///
    /// Maps the MusicXML `<stick-type>` element.
    public enum Kind {

        /// A bass drum stick.
        case bassDrum

        /// A double bass drum stick.
        case doubleBassDrum

        /// A glockenspiel stick.
        case glockenspiel

        /// A gum-headed stick.
        case gum

        /// A hammer-headed stick.
        case hammer

        /// A superball-headed stick.
        case superball

        /// A timpani stick.
        case timpani

        /// A wound stick.
        case wound

        /// A xylophone stick.
        case xylophone

        /// A yarn-headed stick.
        case yarn
    }
}

// MARK: - Equatable

extension MXLStick.Kind: Equatable {
}

// MARK: - Hashable

extension MXLStick.Kind: Hashable {
}

// MARK: - Sendable

extension MXLStick.Kind: Sendable {
}
