// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLLyric.Content.SyllabicGroup {

    /// The elision and optional syllabic hyphenation type that precede a further syllable of elided lyric text.
    public struct Group {

        // MARK: Public Initializers

        /// Creates a new `MXLLyric.Content.SyllabicGroup.Group`.
        ///
        /// - Parameter elision: The elision symbol connecting this syllable to the following text.
        /// - Parameter syllabic: The syllable hyphenation type for the text that follows the elision, if any.
        public init(elision: MXLElision,
                    syllabic: MXLSyllabic? = nil) {
            self.elision = elision
            self.syllabic = syllabic
        }

        // MARK: Public Instance Properties

        /// The elision symbol connecting this syllable to the following text.
        public let elision: MXLElision

        /// The syllable hyphenation type for the text that follows the elision, if any.
        public let syllabic: MXLSyllabic?
    }
}

// MARK: - Equatable

extension MXLLyric.Content.SyllabicGroup.Group: Equatable {
}

// MARK: - Hashable

extension MXLLyric.Content.SyllabicGroup.Group: Hashable {
}

// MARK: - Sendable

extension MXLLyric.Content.SyllabicGroup.Group: Sendable {
}
