// © 2026 John Gary Pusey (see LICENSE.md)

/// The defaults type specifies score-wide defaults for scaling; whether or not the file is a concert score;
/// layout; and default values for the music font, word font, lyric font, and lyric language. Except for the
/// concert-score element, if any defaults are missing, the choice of what to use is determined by the
/// application.
///
/// Maps the MusicXML `<defaults>` element.
public struct MXLDefaults {

    // MARK: Public Initializers

    /// Creates a new `MXLDefaults`.
    ///
    /// - Parameter scaling:  Specifies how many millimeters are equal to how many tenths, translating tenths to absolute units.
    /// - Parameter isConcertScore: A Boolean value indicating whether the score is displayed in concert pitch, used for scores that contain parts for transposing instruments.
    /// - Parameter layout: The layout group specifies the sequence of page, system, and staff layout elements that is common to both the defaults and print elements.
    /// - Parameter appearance:  The general graphical appearance settings for the score, such as line widths, note sizes, and standard distances.
    /// - Parameter musicFont:  The default font used for musical symbols.
    /// - Parameter wordFont:  The default font used for words and other text.
    /// - Parameter lyricFont:  The default fonts for particular names and numbers of lyric.
    /// - Parameter lyricLanguage:  The default languages for particular names and numbers of lyric.
    public init(scaling: MXLScaling? = nil,
                isConcertScore: Bool,
                layout: MXLLayout = MXLLayout(),
                appearance: MXLAppearance? = nil,
                musicFont: MXLFont? = nil,
                wordFont: MXLFont? = nil,
                lyricFont: [MXLLyricFont] = [],
                lyricLanguage: [MXLLyricLanguage] = []) {
        self.appearance = appearance
        self.isConcertScore = isConcertScore
        self.layout = layout
        self.lyricFont = lyricFont
        self.lyricLanguage = lyricLanguage
        self.musicFont = musicFont
        self.scaling = scaling
        self.wordFont = wordFont
    }

    // MARK: Public Instance Properties

    /// The general graphical appearance settings for the score, such as line widths, note sizes, and standard
    /// distances.
    ///
    /// Maps to a nested MusicXML `<appearance>` element.
    public let appearance: MXLAppearance?

    /// A Boolean value indicating whether the score is displayed in concert pitch, used for scores that contain
    /// parts for transposing instruments.
    ///
    /// A document with a concert-score element may not contain any transpose elements that have non-zero values for
    /// either the diatonic or chromatic elements. Concert scores may include octave transpositions, so transpose
    /// elements with a double element or a non-zero octave-change element value are permitted.
    ///
    /// Maps to a nested MusicXML `<concert-score>` element.
    public let isConcertScore: Bool

    /// The layout group specifies the sequence of page, system, and staff layout elements that is common to both the
    /// defaults and print elements.
    public let layout: MXLLayout

    /// The default fonts for particular names and numbers of lyric.
    ///
    /// Maps to nested MusicXML `<lyric-font>` elements.
    public let lyricFont: [MXLLyricFont]

    /// The default languages for particular names and numbers of lyric.
    ///
    /// Maps to nested MusicXML `<lyric-language>` elements.
    public let lyricLanguage: [MXLLyricLanguage]

    /// The default font used for musical symbols.
    ///
    /// Maps to a nested MusicXML `<music-font>` element.
    public let musicFont: MXLFont?

    /// Specifies how many millimeters are equal to how many tenths, translating tenths to absolute units.
    ///
    /// Maps to a nested MusicXML `<scaling>` element.
    public let scaling: MXLScaling?

    /// The default font used for words and other text.
    ///
    /// Maps to a nested MusicXML `<word-font>` element.
    public let wordFont: MXLFont?
}

// MARK: - Equatable

extension MXLDefaults: Equatable {
}

// MARK: - Hashable

extension MXLDefaults: Hashable {
}

// MARK: - Sendable

extension MXLDefaults: Sendable {
}
