// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHandbell {

    /// The handbell-value type represents the type of handbell technique being notated.
    public enum Value {

        /// The belltree handbell technique.
        case belltree

        /// The damp handbell technique.
        case damp

        /// The echo handbell technique.
        case echo

        /// The gyro handbell technique.
        case gyro

        /// The hand martellato handbell technique.
        case handMartellato

        /// The mallet lift handbell technique.
        case malletLift

        /// The mallet table handbell technique.
        case malletTable

        /// The martellato handbell technique.
        case martellato

        /// The martellato lift handbell technique.
        case martellatoLift

        /// The muted martellato handbell technique.
        case mutedMartellato

        /// The pluck lift handbell technique.
        case pluckLift

        /// The swing handbell technique.
        case swing
    }
}

// MARK: - Equatable

extension MXLHandbell.Value: Equatable {
}

// MARK: - Hashable

extension MXLHandbell.Value: Hashable {
}

// MARK: - Sendable

extension MXLHandbell.Value: Sendable {
}
