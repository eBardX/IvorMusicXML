// © 2026 John Gary Pusey (see LICENSE.md)

/// Lyric hyphenation is indicated by the syllabic type. The single, begin, end, and middle values represent
/// single-syllable words, word-beginning syllables, word-ending syllables, and mid-word syllables, respectively.
///
/// Maps the MusicXML `<syllabic>` element.
public enum MXLSyllabic {

    /// A word-beginning syllable.
    case begin

    /// A word-ending syllable.
    case end

    /// A mid-word syllable.
    case middle

    /// A single-syllable word.
    case single
}

// MARK: - Equatable

extension MXLSyllabic: Equatable {
}

// MARK: - Hashable

extension MXLSyllabic: Hashable {
}

// MARK: - Sendable

extension MXLSyllabic: Sendable {
}
