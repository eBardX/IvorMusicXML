// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLWedge {

    /// The wedge type is crescendo for the start of a wedge that is closed at the left side, diminuendo for the
    /// start of a wedge that is closed on the right side, and stop for the end of a wedge. The continue type is
    /// used for formatting wedges over a system break, or for other situations where a single wedge is divided
    /// into multiple segments.
    public enum Kind {

        /// A continuation of a wedge, used for formatting across a system break or when a wedge is divided into
        /// multiple segments.
        case `continue`

        /// The start of a wedge that is closed at the left side.
        case crescendo

        /// The start of a wedge that is closed at the right side.
        case diminuendo

        /// The end of a wedge.
        case stop
    }
}

// MARK: - Equatable

extension MXLWedge.Kind: Equatable {
}

// MARK: - Hashable

extension MXLWedge.Kind: Hashable {
}

// MARK: - Sendable

extension MXLWedge.Kind: Sendable {
}
