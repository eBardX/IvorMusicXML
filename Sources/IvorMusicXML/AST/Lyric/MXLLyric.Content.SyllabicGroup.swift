// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLLyric.Content {

    /// An elided continuation of a lyric syllable, consisting of an optional elision-and-syllabic marker paired
    /// with additional text.
    public struct SyllabicGroup {

        // MARK: Public Initializers

        /// Creates a new `MXLLyric.Content.SyllabicGroup`.
        ///
        /// - Parameter group: The elision and syllabic hyphenation type preceding this text, if present.
        /// - Parameter text: The text of this elided lyric continuation.
        public init(group: Group? = nil,
                    text: MXLTextElementData) {
            self.group = group
            self.text = text
        }

        // MARK: Public Instance Properties

        /// The elision and syllabic hyphenation type preceding this text, if present.
        public let group: Group?

        /// The text of this elided lyric continuation.
        public let text: MXLTextElementData
    }
}

// MARK: - Equatable

extension MXLLyric.Content.SyllabicGroup: Equatable {
}

// MARK: - Hashable

extension MXLLyric.Content.SyllabicGroup: Hashable {
}

// MARK: - Sendable

extension MXLLyric.Content.SyllabicGroup: Sendable {
}
