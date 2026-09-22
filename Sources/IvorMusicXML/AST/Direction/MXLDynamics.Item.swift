// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDynamics {

    /// One of the alternatives for Dynamics.
    public enum Item {
        /// Forte (loud).
        case f

        /// Fortissimo (very loud).
        case ff

        /// Triple forte (extremely loud).
        case fff

        /// Quadruple forte.
        case ffff

        /// Quintuple forte.
        case fffff

        /// Sextuple forte.
        case ffffff

        /// Fortepiano (loud, then immediately soft).
        case fp

        /// Forzando (a sudden, forced accent).
        case fz

        /// Mezzo-forte (moderately loud).
        case mf

        /// Mezzo-piano (moderately soft).
        case mp

        /// Niente (nothing), used at the start or end of a hairpin.
        case n

        /// A dynamic mark not covered by the other cases.
        case otherDynamics(MXLOtherText)

        /// Piano (soft).
        case p

        /// Pianoforte (soft, then immediately loud).
        case pf

        /// Pianissimo (very soft).
        case pp

        /// Triple piano (extremely soft).
        case ppp

        /// Quadruple piano.
        case pppp

        /// Quintuple piano.
        case ppppp

        /// Sextuple piano.
        case pppppp

        /// Rinforzando (a reinforced accent).
        case rf

        /// Rinforzando (a reinforced accent).
        case rfz

        /// Sforzando (a sudden, forced accent).
        case sf

        /// Sforzando-fortissimo.
        case sffz

        /// Sforzando-piano.
        case sfp

        /// Sforzando-pianissimo.
        case sfpp

        /// Sforzando (a sudden, forced accent).
        case sfz

        /// Sforzando-piano.
        case sfzp
    }
}

// MARK: - Equatable

extension MXLDynamics.Item: Equatable {
}

// MARK: - Hashable

extension MXLDynamics.Item: Hashable {
}

// MARK: - Sendable

extension MXLDynamics.Item: Sendable {
}
