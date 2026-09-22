// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLGroupBarline {

    /// The group-barline-value type indicates if the group should have common barlines.
    public enum Value {

        /// The group has a Mensurstrich barline, drawn between staves rather than through them.
        case mensurstrich

        /// The group does not have common barlines.
        case no

        /// The group has common barlines.
        case yes
    }
}

// MARK: - Equatable

extension MXLGroupBarline.Value: Equatable {
}

// MARK: - Hashable

extension MXLGroupBarline.Value: Hashable {
}

// MARK: - Sendable

extension MXLGroupBarline.Value: Sendable {
}
