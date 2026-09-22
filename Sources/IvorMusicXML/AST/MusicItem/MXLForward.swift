// © 2026 John Gary Pusey (see LICENSE.md)

/// The backup and forward elements are required to coordinate multiple voices in one part, including music on
/// multiple staves. The forward element is generally used within voices and staves. Duration values should always
/// be positive, and should not cross measure boundaries or mid-measure changes in the divisions value.
///
/// Maps the MusicXML `<forward>` element.
public struct MXLForward {

    // MARK: Public Initializers

    /// Creates a new `MXLForward`.
    ///
    /// - Parameter duration: The duration element is defined within a group due to its uses within the note, figured-bass, backup, and forward elements.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter voice: A voice is a sequence of musical events (e.g. notes, chords, rests) that proceeds linearly in time. The voice element is used to distinguish between multiple voices in individual parts. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter staff: The staff element is defined within a group due to its use by both notes and direction elements.
    public init(duration: MXLPositiveDivisions,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                voice: MXLVoice? = nil,
                staff: MXLStaff? = nil) {
        self.duration = duration
        self.footnote = footnote
        self.level = level
        self.staff = staff
        self.voice = voice
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

    /// The staff element is defined within a group due to its use by both notes and direction elements.
    ///
    /// Maps to a nested MusicXML `<staff>` element.
    public let staff: MXLStaff?

    /// A voice is a sequence of musical events (e.g. notes, chords, rests) that proceeds linearly in time. The voice
    /// element is used to distinguish between multiple voices in individual parts. It is defined within a group due
    /// to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<voice>` element.
    public let voice: MXLVoice?
}

// MARK: - Equatable

extension MXLForward: Equatable {
}

// MARK: - Hashable

extension MXLForward: Hashable {
}

// MARK: - Sendable

extension MXLForward: Sendable {
}
