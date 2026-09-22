// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPageMargins {

    /// The margin-type type specifies whether margins apply to even page, odd pages, or both.
    public enum Kind {

        /// The margins apply to both even and odd pages.
        case both

        /// The margins apply to even pages.
        case even

        /// The margins apply to odd pages.
        case odd
    }
}

// MARK: - Equatable

extension MXLPageMargins.Kind: Equatable {
}

// MARK: - Hashable

extension MXLPageMargins.Kind: Hashable {
}

// MARK: - Sendable

extension MXLPageMargins.Kind: Sendable {
}
