// © 2026 John Gary Pusey (see LICENSE.md)

/// The beat-repeat type is used to indicate that a single beat (but possibly many notes) is repeated. The slashes
/// attribute specifies the number of slashes to use in the symbol. The use-dots attribute indicates whether or
/// not to use dots as well (for instance, with mixed rhythm patterns). The value for slashes is 1 and the value
/// for use-dots is no if not specified.
///
/// The stop type indicates the first beat where the repeats are no longer displayed. Both the start and stop of
/// the beat being repeated should be specified unless the repeats are displayed through the end of the part.
///
/// The beat-repeat element specifies a notation style for repetitions. The actual music being repeated needs to
/// be repeated within the MusicXML file. This element specifies the notation that indicates the repeat.
///
/// Maps the MusicXML `<beat-repeat>` element.
public struct MXLBeatRepeat {

    // MARK: Public Initializers

    /// Creates a new `MXLBeatRepeat`.
    ///
    /// - Parameter slashContent: The slash group combines elements used for more complete specification of the slash and beat-repeat measure-style elements. They have the same values as the type and dot elements, and define what the beat is for the display of repetition marks. If not present, the beat is based on the current time signature.
    /// - Parameter kind:  Whether this indicates the start or stop of the beat being repeated.
    /// - Parameter slashes:  The number of slashes to use in the symbol. `1` if not specified.
    /// - Parameter usesDots:  A Boolean value indicating whether to use dots as well as slashes, for instance with mixed rhythm patterns. `false` if not specified.
    public init(slashContent: MXLSlashContent? = nil,
                kind: MXLStartStop,
                slashes: Int? = nil,
                usesDots: Bool? = nil) {
        self.slashContent = slashContent
        self.slashes = slashes
        self.kind = kind
        self.usesDots = usesDots
    }

    // MARK: Public Instance Properties

    /// Whether this indicates the start or stop of the beat being repeated.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStop

    /// The slash group combines elements used for more complete specification of the slash and beat-repeat measure-
    /// style elements. They have the same values as the type and dot elements, and define what the beat is for the
    /// display of repetition marks. If not present, the beat is based on the current time signature.
    public let slashContent: MXLSlashContent?

    /// The number of slashes to use in the symbol. `1` if not specified.
    ///
    /// Maps to the MusicXML `slashes` attribute.
    public let slashes: Int?

    /// A Boolean value indicating whether to use dots as well as slashes, for instance with mixed rhythm patterns.
    /// `false` if not specified.
    ///
    /// Maps to the MusicXML `use-dots` attribute.
    public let usesDots: Bool?
}

// MARK: - Equatable

extension MXLBeatRepeat: Equatable {
}

// MARK: - Hashable

extension MXLBeatRepeat: Hashable {
}

// MARK: - Sendable

extension MXLBeatRepeat: Sendable {
}
