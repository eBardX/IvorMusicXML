// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNotations {

    /// One of the alternatives for Notations.
    public enum Item {
        /// The `accidental-mark` alternative.
        case accidentalMark(MXLAccidentalMark)

        /// The `arpeggiate` alternative.
        case arpeggiate(MXLArpeggiate)

        /// The `articulations` alternative.
        case articulations(MXLArticulations)

        /// The `dynamics` alternative.
        case dynamics(MXLDynamics)

        /// The `fermata` alternative.
        case fermata(MXLFermata)

        /// The `glissando` alternative.
        case glissando(MXLGlissando)

        /// The `non-arpeggiate` alternative.
        case nonArpeggiate(MXLNonArpeggiate)

        /// The `ornaments` alternative.
        case ornaments(MXLOrnaments)

        /// The `other-notation` alternative.
        case otherNotation(MXLOtherNotation)

        /// The `slide` alternative.
        case slide(MXLSlide)

        /// The `slur` alternative.
        case slur(MXLSlur)

        /// The `technical` alternative.
        case technical(MXLTechnical)

        /// The `tied` alternative.
        case tied(MXLTied)

        /// The `tuplet` alternative.
        case tuplet(MXLTuplet)
    }
}

// MARK: - Equatable

extension MXLNotations.Item: Equatable {
}

// MARK: - Hashable

extension MXLNotations.Item: Hashable {
}

// MARK: - Sendable

extension MXLNotations.Item: Sendable {
}
