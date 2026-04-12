// © 2025–2026 John Gary Pusey (see LICENSE.md)

extension MXLOpus {
    /// An item in a MusicXML opus.
    public enum Item {
        /// A nested opus.
        case opus(MXLOpus)

        /// A link to an external opus, with the specified URL.
        case opusLink(String)

        /// A link to an external score, with the specified URL.
        case score(String)
    }
}

// MARK: - Sendable

extension MXLOpus.Item: Sendable {
}
