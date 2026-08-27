// © 2026 John Gary Pusey (see LICENSE.md)

/// The attributes element contains musical information that typically changes on measure boundaries. This
/// includes key and time signatures, clefs, transpositions, and staving. When attributes are changed mid-measure,
/// it affects the music in score order, not in MusicXML document order.
///
/// Maps the MusicXML `<attributes>` element.
public struct MXLAttributes {

    // MARK: Public Initializers

    /// Creates a new `MXLAttributes`.
    ///
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter divisions: Musical notation duration is commonly represented as fractions. The divisions element indicates how many divisions per quarter note are used to indicate a note’s duration. For example, if duration = 1 and divisions = 2, this is an eighth note duration. Duration and divisions are used directly for generating sound output, so they must be chosen to take tuplets into account. Using a divisions element lets us use just one number to represent a duration for each note in the score, while retaining the full power of a fractional representation. If maximum compatibility with Standard MIDI 1.0 files is important, do not have the divisions value exceed 16383.
    /// - Parameter key: The key element represents a key signature. Both traditional and non-traditional key signatures are supported. The optional number attribute refers to staff numbers. If absent, the key signature applies to all staves in the part.
    /// - Parameter time: Time signatures are represented by the beats element for the numerator and the beat-type element for the denominator.
    /// - Parameter staves: The staves element is used if there is more than one staff represented in the given part (e.g., 2 staves for typical piano parts). If absent, a value of 1 is assumed. Staves are ordered from top to bottom in a part in numerical order, with staff 1 above staff 2.
    /// - Parameter partSymbol: The part-symbol element indicates how a symbol for a multi-staff part is indicated in the score.
    /// - Parameter instruments: The instruments element is only used if more than one instrument is represented in the part (e.g., oboe I and II where they play together most of the time). If absent, a value of 1 is assumed.
    /// - Parameter clef: Clefs are represented by a combination of sign, line, and clef-octave-change elements.
    /// - Parameter staffDetails: The staff-details element is used to indicate different types of staves.
    /// - Parameter content: One of the alternatives for Attributes.
    /// - Parameter directive: Directives are like directions, but can be grouped together with attributes for convenience. This is typically used for tempo markings at the beginning of a piece of music. This element was deprecated in Version 2.0 in favor of the direction element’s directive attribute. Language names come from ISO 639, with optional country subcodes from ISO 3166.
    /// - Parameter measureStyle: A measure-style indicates a special way to print partial to multiple measures within a part. This includes multiple rests over several measures, repeats of beats, single, or multiple measures, and use of slash notation.
    public init(footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                divisions: MXLPositiveDivisions? = nil,
                key: [MXLKey] = [],
                time: [MXLTime] = [],
                staves: Int? = nil,
                partSymbol: MXLPartSymbol? = nil,
                instruments: Int? = nil,
                clef: [MXLClef] = [],
                staffDetails: [MXLStaffDetails] = [],
                content: Content,
                directive: [Directive] = [],
                measureStyle: [MXLMeasureStyle] = []) {
        self.clef = clef
        self.content = content
        self.directive = directive
        self.divisions = divisions
        self.footnote = footnote
        self.instruments = instruments
        self.key = key
        self.level = level
        self.measureStyle = measureStyle
        self.partSymbol = partSymbol
        self.staffDetails = staffDetails
        self.staves = staves
        self.time = time
    }

    // MARK: Public Instance Properties

    /// Clefs are represented by a combination of sign, line, and clef-octave-change elements.
    ///
    /// Maps to nested MusicXML `<clef>` elements.
    public let clef: [MXLClef]

    /// One of the alternatives for Attributes.
    public let content: Content

    /// Directives are like directions, but can be grouped together with attributes for convenience. This is typically
    /// used for tempo markings at the beginning of a piece of music. This element was deprecated in Version 2.0 in
    /// favor of the direction element’s directive attribute. Language names come from ISO 639, with optional country
    /// subcodes from ISO 3166.
    ///
    /// Maps to nested MusicXML `<directive>` elements.
    public let directive: [Directive]

    /// Musical notation duration is commonly represented as fractions. The divisions element indicates how many
    /// divisions per quarter note are used to indicate a note’s duration. For example, if duration = 1 and divisions
    /// = 2, this is an eighth note duration. Duration and divisions are used directly for generating sound output, so
    /// they must be chosen to take tuplets into account. Using a divisions element lets us use just one number to
    /// represent a duration for each note in the score, while retaining the full power of a fractional
    /// representation. If maximum compatibility with Standard MIDI 1.0 files is important, do not have the divisions
    /// value exceed 16383.
    ///
    /// Maps to a nested MusicXML `<divisions>` element.
    public let divisions: MXLPositiveDivisions?

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The instruments element is only used if more than one instrument is represented in the part (e.g., oboe I and
    /// II where they play together most of the time). If absent, a value of 1 is assumed.
    ///
    /// Maps to a nested MusicXML `<instruments>` element.
    public let instruments: Int?

    /// The key element represents a key signature. Both traditional and non-traditional key signatures are supported.
    /// The optional number attribute refers to staff numbers. If absent, the key signature applies to all staves in
    /// the part.
    ///
    /// Maps to nested MusicXML `<key>` elements.
    public let key: [MXLKey]

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// A measure-style indicates a special way to print partial to multiple measures within a part. This includes
    /// multiple rests over several measures, repeats of beats, single, or multiple measures, and use of slash
    /// notation.
    ///
    /// Maps to nested MusicXML `<measure-style>` elements.
    public let measureStyle: [MXLMeasureStyle]

    /// The part-symbol element indicates how a symbol for a multi-staff part is indicated in the score.
    ///
    /// Maps to a nested MusicXML `<part-symbol>` element.
    public let partSymbol: MXLPartSymbol?

    /// The staff-details element is used to indicate different types of staves.
    ///
    /// Maps to nested MusicXML `<staff-details>` elements.
    public let staffDetails: [MXLStaffDetails]

    /// The staves element is used if there is more than one staff represented in the given part (e.g., 2 staves for
    /// typical piano parts). If absent, a value of 1 is assumed. Staves are ordered from top to bottom in a part in
    /// numerical order, with staff 1 above staff 2.
    ///
    /// Maps to a nested MusicXML `<staves>` element.
    public let staves: Int?

    /// Time signatures are represented by the beats element for the numerator and the beat-type element for the
    /// denominator.
    ///
    /// Maps to nested MusicXML `<time>` elements.
    public let time: [MXLTime]
}

// MARK: - Equatable

extension MXLAttributes: Equatable {
}

// MARK: - Hashable

extension MXLAttributes: Hashable {
}

// MARK: - Sendable

extension MXLAttributes: Sendable {
}
