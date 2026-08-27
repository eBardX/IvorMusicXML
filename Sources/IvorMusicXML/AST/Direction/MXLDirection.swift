// © 2026 John Gary Pusey (see LICENSE.md)

/// A direction is a musical indication that is not necessarily attached to a specific note. Two or more may be
/// combined to indicate words followed by the start of a dashed line, the end of a wedge followed by dynamics,
/// etc. For applications where a specific direction is indeed attached to a specific note, the direction element
/// can be associated with the first note element that follows it in score order that is not in a different voice.
///
/// By default, a series of direction-type elements and a series of child elements of a direction-type within a
/// single direction element follow one another in sequence visually. For a series of direction-type children,
/// non-positional formatting attributes are carried over from the previous element by default.
///
/// Maps the MusicXML `<direction>` element.
public struct MXLDirection {

    // MARK: Public Initializers

    /// Creates a new `MXLDirection`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind:  The direction-type elements that make up this direction.
    /// - Parameter offset:  Indicates where the direction will appear relative to the current musical location, in divisions.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter voice: A voice is a sequence of musical events (e.g. notes, chords, rests) that proceeds linearly in time. The voice element is used to distinguish between multiple voices in individual parts. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter staff: The staff element is defined within a group due to its use by both notes and direction elements.
    /// - Parameter sound:  General playback parameters associated with this direction.
    /// - Parameter listening:  Specifies how a score-following or machine-listening application should interact with a performer, from this point in the performance onward.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter isDirective: A Boolean value indicating whether this direction is a directive, changing its default horizontal position so its left-hand side aligns with the left-hand side of the time signature (or, if no time signature is present, the first music notational element in the measure). A default-x, justify, or halign attribute, if present, overrides this.
    /// - Parameter system: The system-relation attribute group distinguishes elements that are associated with a system rather than the particular part where the element appears.
    public init(id: String? = nil,
                kind: [Kind] = [],
                offset: MXLOffset? = nil,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                voice: MXLVoice? = nil,
                staff: MXLStaff? = nil,
                sound: MXLSound? = nil,
                listening: MXLListening? = nil,
                placement: MXLAboveBelow? = nil,
                isDirective: Bool? = nil,
                system: MXLSystemRelation? = nil) {
        self.footnote = footnote
        self.id = id
        self.isDirective = isDirective
        self.kind = kind
        self.level = level
        self.listening = listening
        self.offset = offset
        self.placement = placement
        self.sound = sound
        self.staff = staff
        self.system = system
        self.voice = voice
    }

    // MARK: Public Instance Properties

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// A Boolean value indicating whether this direction is a directive, changing its default horizontal position so
    /// its left-hand side aligns with the left-hand side of the time signature (or, if no time signature is present,
    /// the first music notational element in the measure). A default-x, justify, or halign attribute, if present,
    /// overrides this.
    ///
    /// Maps to the MusicXML `directive` attribute.
    public let isDirective: Bool?

    /// The direction-type elements that make up this direction.
    ///
    /// Maps to nested MusicXML `<direction-type>` elements.
    public let kind: [Kind]

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// Specifies how a score-following or machine-listening application should interact with a performer, from this
    /// point in the performance onward.
    ///
    /// Maps to a nested MusicXML `<listening>` element.
    public let listening: MXLListening?

    /// Indicates where the direction will appear relative to the current musical location, in divisions.
    ///
    /// Maps to a nested MusicXML `<offset>` element.
    public let offset: MXLOffset?

    /// The placement attribute indicates whether something is above or below another element, such as a note or a
    /// notation.
    ///
    /// Maps to the MusicXML `placement` attribute.
    public let placement: MXLAboveBelow?

    /// General playback parameters associated with this direction.
    ///
    /// Maps to a nested MusicXML `<sound>` element.
    public let sound: MXLSound?

    /// The staff element is defined within a group due to its use by both notes and direction elements.
    ///
    /// Maps to a nested MusicXML `<staff>` element.
    public let staff: MXLStaff?

    /// The system-relation attribute group distinguishes elements that are associated with a system rather than the
    /// particular part where the element appears.
    ///
    /// Maps to the MusicXML `system` attribute.
    public let system: MXLSystemRelation?

    /// A voice is a sequence of musical events (e.g. notes, chords, rests) that proceeds linearly in time. The voice
    /// element is used to distinguish between multiple voices in individual parts. It is defined within a group due
    /// to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<voice>` element.
    public let voice: MXLVoice?
}

// MARK: - Equatable

extension MXLDirection: Equatable {
}

// MARK: - Hashable

extension MXLDirection: Hashable {
}

// MARK: - Sendable

extension MXLDirection: Sendable {
}
