// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDegree {

    /// The degree-symbol-value type indicates which symbol should be used in specifying a degree.
    public enum SymbolValue {

        /// The augmented chord symbol.
        case augmented

        /// The diminished chord symbol.
        case diminished

        /// The half-diminished chord symbol.
        case halfDiminished

        /// The major chord symbol.
        case major

        /// The minor chord symbol.
        case minor
    }
}

// MARK: - Equatable

extension MXLDegree.SymbolValue: Equatable {
}

// MARK: - Hashable

extension MXLDegree.SymbolValue: Hashable {
}

// MARK: - Sendable

extension MXLDegree.SymbolValue: Sendable {
}
