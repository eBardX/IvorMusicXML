// © 2026 John Gary Pusey (see LICENSE.md)

/// The part-group element indicates groupings of parts in the score, usually indicated by braces and brackets.
/// Braces that are used for multi-staff parts should be defined in the attributes element for that part. The
/// part-group start element appears before the first score-part in the group. The part-group stop element appears
/// after the last score-part in the group.
///
/// The number attribute is used to distinguish overlapping and nested part-groups, not the sequence of groups. As
/// with parts, groups can have a name and abbreviation. Values for the child elements are ignored at the stop of
/// a group.
///
/// A part-group element is not needed for a single multi-staff part. By default, multi-staff parts include a
/// brace symbol and (if appropriate given the bar-style) common barlines. The symbol formatting for a multi-staff
/// part can be more fully specified using the part-symbol element.
///
/// Maps the MusicXML `<part-group>` element.
public struct MXLPartGroup {

    // MARK: Public Initializers

    /// Creates a new `MXLPartGroup`.
    ///
    /// - Parameter name: The name of the group of parts.
    /// - Parameter nameDisplay: Formatting specified in the group-name-display element overrides formatting specified in the group-name element.
    /// - Parameter abbreviation: The abbreviation of the group of parts.
    /// - Parameter abbreviationDisplay: Formatting specified in the group-abbreviation-display element overrides formatting specified in the group-abbreviation element.
    /// - Parameter symbol: The symbol used to indicate the group, such as a brace or bracket.
    /// - Parameter barline: Indicates whether the group has common barlines across its parts.
    /// - Parameter stretchesTimeSignature: A Boolean value indicating whether the displayed time signatures should stretch across all parts and staves in the group.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter kind: Whether this element marks the start or the stop of the group.
    /// - Parameter number: The number used to distinguish overlapping and nested part-groups, not the sequence of groups. Defaults to `1` if not specified.
    public init(name: MXLGroupName? = nil,
                nameDisplay: MXLNameDisplay? = nil,
                abbreviation: MXLGroupName? = nil,
                abbreviationDisplay: MXLNameDisplay? = nil,
                symbol: MXLGroupSymbol? = nil,
                barline: MXLGroupBarline? = nil,
                stretchesTimeSignature: Bool,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                kind: MXLStartStop,
                number: String? = nil) {
        self.abbreviation = abbreviation
        self.abbreviationDisplay = abbreviationDisplay
        self.barline = barline
        self.footnote = footnote
        self.kind = kind
        self.level = level
        self.name = name
        self.nameDisplay = nameDisplay
        self.number = number ?? "1"
        self.stretchesTimeSignature = stretchesTimeSignature
        self.symbol = symbol
    }

    // MARK: Public Instance Properties

    /// The abbreviation of the group of parts.
    ///
    /// Maps to a nested MusicXML `<group-abbreviation>` element.
    public let abbreviation: MXLGroupName?

    /// Formatting specified in the group-abbreviation-display element overrides formatting specified in the group-
    /// abbreviation element.
    ///
    /// Maps to a nested MusicXML `<group-abbreviation-display>` element.
    public let abbreviationDisplay: MXLNameDisplay?

    /// Indicates whether the group has common barlines across its parts.
    ///
    /// Maps to a nested MusicXML `<group-barline>` element.
    public let barline: MXLGroupBarline?

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// Whether this element marks the start or the stop of the group.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStop

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// The name of the group of parts.
    ///
    /// Maps to a nested MusicXML `<group-name>` element.
    public let name: MXLGroupName?

    /// Formatting specified in the group-name-display element overrides formatting specified in the group-name
    /// element.
    ///
    /// Maps to a nested MusicXML `<group-name-display>` element.
    public let nameDisplay: MXLNameDisplay?

    /// The number used to distinguish overlapping and nested part-groups, not the sequence of groups. Defaults to
    /// `1` if not specified.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: String

    /// A Boolean value indicating whether the displayed time signatures should stretch across all parts and staves in
    /// the group.
    ///
    /// Maps to a nested MusicXML `<group-time>` element.
    public let stretchesTimeSignature: Bool

    /// The symbol used to indicate the group, such as a brace or bracket.
    ///
    /// Maps to a nested MusicXML `<group-symbol>` element.
    public let symbol: MXLGroupSymbol?
}

// MARK: - Equatable

extension MXLPartGroup: Equatable {
}

// MARK: - Hashable

extension MXLPartGroup: Hashable {
}

// MARK: - Sendable

extension MXLPartGroup: Sendable {
}
