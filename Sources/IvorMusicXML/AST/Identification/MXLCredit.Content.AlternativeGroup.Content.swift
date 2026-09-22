// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLCredit.Content.AlternativeGroup {

    /// One of the alternatives for AlternativeGroup.
    public enum Content {
        /// The credit-symbol element, a SMuFL musical symbol with formatting and id attributes.
        case creditSymbol(MXLFormattedSymbolID)

        /// The credit-words element, a text element with text-formatting and id attributes.
        case creditWords(MXLFormattedTextID)
    }
}

// MARK: - Equatable

extension MXLCredit.Content.AlternativeGroup.Content: Equatable {
}

// MARK: - Hashable

extension MXLCredit.Content.AlternativeGroup.Content: Hashable {
}

// MARK: - Sendable

extension MXLCredit.Content.AlternativeGroup.Content: Sendable {
}
