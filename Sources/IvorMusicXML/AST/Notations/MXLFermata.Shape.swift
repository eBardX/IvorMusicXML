// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFermata {

    /// The fermata-shape type represents the shape of the fermata sign. The empty value is equivalent to the normal
    /// value.
    public enum Shape {

        /// An angled fermata sign.
        case angled

        /// A curlew-shaped fermata sign.
        case curlew

        /// A double angled fermata sign.
        case doubleAngled

        /// A double dot fermata sign.
        case doubleDot

        /// A double square fermata sign.
        case doubleSquare

        /// The normal fermata sign.
        case empty

        /// A half-curve fermata sign.
        case halfCurve

        /// The normal, curved fermata sign.
        case normal

        /// A square fermata sign.
        case square
    }
}

// MARK: - Equatable

extension MXLFermata.Shape: Equatable {
}

// MARK: - Hashable

extension MXLFermata.Shape: Hashable {
}

// MARK: - Sendable

extension MXLFermata.Shape: Sendable {
}
