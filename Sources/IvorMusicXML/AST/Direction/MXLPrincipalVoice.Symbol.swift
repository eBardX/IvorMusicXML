// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPrincipalVoice {

    /// The principal-voice-symbol type represents the type of symbol used to indicate a principal or secondary voice.
    /// The “plain” value represents a plain square bracket. The value of “none” is used for analysis markup when the
    /// principal-voice element does not have a corresponding appearance in the score.
    public enum Symbol {

        /// The Hauptstimme (principal voice) symbol.
        case hauptstimme

        /// No symbol, used for analysis markup with no corresponding appearance in the score.
        case invisible

        /// The Nebenstimme (secondary voice) symbol.
        case nebenstimme

        /// A plain square bracket symbol.
        case plain
    }
}

// MARK: - Equatable

extension MXLPrincipalVoice.Symbol: Equatable {
}

// MARK: - Hashable

extension MXLPrincipalVoice.Symbol: Hashable {
}

// MARK: - Sendable

extension MXLPrincipalVoice.Symbol: Sendable {
}
