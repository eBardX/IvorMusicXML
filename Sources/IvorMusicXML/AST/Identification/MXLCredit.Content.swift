// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLCredit {

    /// One of the alternatives for Credit.
    public enum Content {
        /// The `alternative` alternative.
        case alternative(content: AlternativeContent, group: [AlternativeGroup])

        /// A graphical image included in the score.
        case creditImage(MXLImage)
    }
}

// MARK: - Equatable

extension MXLCredit.Content: Equatable {
}

// MARK: - Hashable

extension MXLCredit.Content: Hashable {
}

// MARK: - Sendable

extension MXLCredit.Content: Sendable {
}
