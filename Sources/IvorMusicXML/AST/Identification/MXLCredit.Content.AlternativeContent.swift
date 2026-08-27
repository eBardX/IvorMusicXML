// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLCredit.Content {

    /// One of the alternatives for Content.
    public enum AlternativeContent {
        /// The credit-symbol element, a SMuFL musical symbol with formatting and id attributes.
        case creditSymbol(MXLFormattedSymbolID)

        /// The credit-words element, a text element with text-formatting and id attributes.
        case creditWords(MXLFormattedTextID)
    }
}

// MARK: - Equatable

extension MXLCredit.Content.AlternativeContent: Equatable {
}

// MARK: - Hashable

extension MXLCredit.Content.AlternativeContent: Hashable {
}

// MARK: - Sendable

extension MXLCredit.Content.AlternativeContent: Sendable {
}
