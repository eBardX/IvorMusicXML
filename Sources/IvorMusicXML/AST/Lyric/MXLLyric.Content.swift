// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLLyric {

    /// One of the alternatives for Lyric.
    public enum Content {
        /// The `extend` alternative.
        case extend(MXLExtend)

        /// The humming element represents a humming voice.
        case humming

        /// The laughing element represents a laughing voice.
        case laughing

        /// The `syllabic` alternative.
        case syllabic(_ syllabic: MXLSyllabic?,
                      text: MXLTextElementData,
                      group: [SyllabicGroup],
                      extend: MXLExtend?)
    }
}

// MARK: - Equatable

extension MXLLyric.Content: Equatable {
}

// MARK: - Hashable

extension MXLLyric.Content: Hashable {
}

// MARK: - Sendable

extension MXLLyric.Content: Sendable {
}
