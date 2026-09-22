// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTremolo {

    /// The tremolo-type is used to distinguish double-note, single-note, and unmeasured tremolos.
    public enum Kind {

        /// A single-note tremolo.
        case single

        /// The start of a double-note tremolo.
        case start

        /// The end of a double-note tremolo.
        case stop

        /// An unmeasured tremolo.
        case unmeasured
    }
}

// MARK: - Equatable

extension MXLTremolo.Kind: Equatable {
}

// MARK: - Hashable

extension MXLTremolo.Kind: Hashable {
}

// MARK: - Sendable

extension MXLTremolo.Kind: Sendable {
}
