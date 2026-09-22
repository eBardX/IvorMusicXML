// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLBend {

    /// The bend-shape type distinguishes between the angled bend symbols commonly used in standard notation and the
    /// curved bend symbols commonly used in both tablature and standard notation.
    public enum Shape {

        /// An angled bend symbol, commonly used in standard notation.
        case angled

        /// A curved bend symbol, commonly used in both tablature and standard notation.
        case curved
    }
}

// MARK: - Equatable

extension MXLBend.Shape: Equatable {
}

// MARK: - Hashable

extension MXLBend.Shape: Hashable {
}

// MARK: - Sendable

extension MXLBend.Shape: Sendable {
}
