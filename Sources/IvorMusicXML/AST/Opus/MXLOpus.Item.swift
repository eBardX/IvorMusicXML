// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLOpus {

    /// One of the alternatives for Opus.
    public enum Item {
        /// The `opus` alternative.
        indirect case opus(MXLOpus)

        /// The `opus-link` alternative.
        case opusLink(MXLXLink)

        /// The `score` alternative.
        case score(Score)
    }
}

// MARK: - Equatable

extension MXLOpus.Item: Equatable {
}

// MARK: - Hashable

extension MXLOpus.Item: Hashable {
}

// MARK: - Sendable

extension MXLOpus.Item: Sendable {
}
