// © 2026 John Gary Pusey (see LICENSE.md)

/// The slash type is used to indicate that slash notation is to be used. If the slash is on every beat, use-stems
/// is no (the default). To indicate rhythms but not pitches, use-stems is set to yes. The type attribute
/// indicates whether this is the start or stop of a slash notation style. The use-dots attribute works as for the
/// beat-repeat element, and only has effect if use-stems is no.
///
/// Maps the MusicXML `<slash>` element.
public struct MXLSlash {

    // MARK: Public Initializers

    /// Creates a new `MXLSlash`.
    ///
    /// - Parameter content: The slash group combines elements used for more complete specification of the slash and beat-repeat measure-style elements. They have the same values as the type and dot elements, and define what the beat is for the display of repetition marks. If not present, the beat is based on the current time signature.
    /// - Parameter kind: Whether this element marks the start or the stop of the slash notation style.
    /// - Parameter usesDots: A Boolean value indicating whether to use dots, working as for the beat-repeat element. Only has effect when `useStems` is `false`.
    /// - Parameter usesStems: A Boolean value indicating whether to use stems to indicate rhythms rather than pitches. Defaults to `false`, indicating the slash is used on every beat.
    public init(content: MXLSlashContent? = nil,
                kind: MXLStartStop,
                usesDots: Bool? = nil,
                usesStems: Bool? = nil) {
        self.content = content
        self.kind = kind
        self.usesDots = usesDots
        self.usesStems = usesStems ?? false
    }

    // MARK: Public Instance Properties

    /// The slash group combines elements used for more complete specification of the slash and beat-repeat measure-
    /// style elements. They have the same values as the type and dot elements, and define what the beat is for the
    /// display of repetition marks. If not present, the beat is based on the current time signature.
    public let content: MXLSlashContent?

    /// Whether this element marks the start or the stop of the slash notation style.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStop

    /// A Boolean value indicating whether to use dots, working as for the beat-repeat element. Only has effect when
    /// `useStems` is `false`.
    ///
    /// Maps to the MusicXML `use-dots` attribute.
    public let usesDots: Bool?

    /// A Boolean value indicating whether to use stems to indicate rhythms rather than pitches. Defaults to
    /// `false`, indicating the slash is used on every beat.
    ///
    /// Maps to the MusicXML `use-stems` attribute.
    public let usesStems: Bool
}

// MARK: - Equatable

extension MXLSlash: Equatable {
}

// MARK: - Hashable

extension MXLSlash: Hashable {
}

// MARK: - Sendable

extension MXLSlash: Sendable {
}
