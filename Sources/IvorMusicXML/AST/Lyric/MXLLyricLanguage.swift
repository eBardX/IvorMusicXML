// © 2026 John Gary Pusey (see LICENSE.md)

/// The lyric-language type specifies the default language for a particular name and number of lyric.
///
/// Maps the MusicXML `<lyric-language>` element.
public struct MXLLyricLanguage {

    // MARK: Public Initializers

    /// Creates a new `MXLLyricLanguage`.
    ///
    /// - Parameter number: The lyric number that this default language applies to.
    /// - Parameter name: The lyric name that this default language applies to.
    /// - Parameter xmlLang: The xml:lang attribute value.
    public init(number: String? = nil,
                name: String? = nil,
                xmlLang: String? = nil) {
        self.name = name
        self.number = number
        self.xmlLang = xmlLang
    }

    // MARK: Public Instance Properties

    /// The lyric name that this default language applies to.
    ///
    /// Maps to the MusicXML `name` attribute.
    public let name: String?

    /// The lyric number that this default language applies to.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: String?

    /// The xml:lang attribute value.
    ///
    /// Maps to the MusicXML `xml:lang` attribute.
    public let xmlLang: String?
}

// MARK: - Equatable

extension MXLLyricLanguage: Equatable {
}

// MARK: - Hashable

extension MXLLyricLanguage: Hashable {
}

// MARK: - Sendable

extension MXLLyricLanguage: Sendable {
}
