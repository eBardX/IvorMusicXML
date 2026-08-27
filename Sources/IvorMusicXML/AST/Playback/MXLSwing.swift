// © 2026 John Gary Pusey (see LICENSE.md)

/// The swing element specifies whether or not to use swing playback, where consecutive on-beat / off-beat eighth
/// or 16th notes are played with unequal nominal durations.
///
/// The straight element specifies that no swing is present, so consecutive notes have equal durations.
///
/// The first and second elements are positive integers that specify the ratio between durations of consecutive
/// notes. For example, a first element with a value of 2 and a second element with a value of 1 applied to eighth
/// notes specifies a quarter note / eighth note tuplet playback, where the first note is twice as long as the
/// second note. Ratios should be specified with the smallest integers possible. For example, a ratio of 6 to 4
/// should be specified as 3 to 2 instead.
///
/// The optional swing-type element specifies the note type, either eighth or 16th, to which the ratio is applied.
/// The value is eighth if this element is not present.
///
/// The optional swing-style element is a string describing the style of swing used.
///
/// The swing element has no effect for playback of grace notes, notes where a type element is not present, and
/// notes where the specified duration is different than the nominal value associated with the specified type. If
/// a swung note has attack and release attributes, those values modify the swung playback.
///
/// Maps the MusicXML `<swing>` element.
public struct MXLSwing {

    // MARK: Public Initializers

    /// Creates a new `MXLSwing`.
    ///
    /// - Parameter content:  One of the alternatives for Swing.
    /// - Parameter style:    A string describing the style of swing used.
    public init(content: Content,
                style: String? = nil) {
        self.content = content
        self.style = style
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for Swing.
    public let content: Content

    /// A string describing the style of swing used.
    ///
    /// Maps to a nested MusicXML `<swing-style>` element.
    public let style: String?
}

// MARK: - Equatable

extension MXLSwing: Equatable {
}

// MARK: - Hashable

extension MXLSwing: Hashable {
}

// MARK: - Sendable

extension MXLSwing: Sendable {
}
