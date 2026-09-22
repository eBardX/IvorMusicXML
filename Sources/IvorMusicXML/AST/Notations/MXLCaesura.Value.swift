// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLCaesura {

    /// The caesura-value type represents the shape of the caesura sign.
    public enum Value {

        /// A curved caesura sign.
        case curved

        /// The normal caesura sign.
        case empty

        /// A normal caesura sign.
        case normal

        /// A short caesura sign.
        case short

        /// A single-stroke caesura sign.
        case single

        /// A thick caesura sign.
        case thick
    }
}

// MARK: - Equatable

extension MXLCaesura.Value: Equatable {
}

// MARK: - Hashable

extension MXLCaesura.Value: Hashable {
}

// MARK: - Sendable

extension MXLCaesura.Value: Sendable {
}
