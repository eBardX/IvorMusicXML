// © 2026 John Gary Pusey (see LICENSE.md)

/// The backup and forward elements are required to coordinate multiple voices in one part, including music on
/// multiple staves. The backup type is generally used to move between voices and staves. Thus the backup element
/// does not include voice or staff elements. Duration values should always be positive, and should not cross
/// measure boundaries or mid-measure changes in the divisions value.
///
/// Maps the MusicXML `<backup>` element.
public struct MXLBackup {

    // MARK: Public Initializers

    /// Creates a new `MXLBackup`.
    ///
    /// - Parameter duration: The duration element is defined within a group due to its uses within the note, figured-bass, backup, and forward elements.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    public init(duration: MXLPositiveDivisions,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil) {
        self.duration = duration
        self.footnote = footnote
        self.level = level
    }

    // MARK: Public Instance Properties

    /// The duration element is defined within a group due to its uses within the note, figured-bass, backup, and
    /// forward elements.
    ///
    /// Maps to a nested MusicXML `<duration>` element.
    public let duration: MXLPositiveDivisions

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?
}

// MARK: - Equatable

extension MXLBackup: Equatable {
}

// MARK: - Hashable

extension MXLBackup: Hashable {
}

// MARK: - Sendable

extension MXLBackup: Sendable {
}
