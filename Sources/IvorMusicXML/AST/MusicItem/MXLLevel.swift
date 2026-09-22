// © 2026 John Gary Pusey (see LICENSE.md)

/// The level type is used to specify editorial information for different MusicXML elements. The content contains
/// identifying and/or descriptive text about the editorial status of the parent element.
///
/// If the reference attribute is yes, this indicates editorial information that is for display only and should
/// not affect playback. For instance, a modern edition of older music may set reference=“yes” on the attributes
/// containing the music’s original clef, key, and time signature. It is no if not specified.
///
/// The type attribute indicates whether the editorial information applies to the start of a series of symbols,
/// the end of a series of symbols, or a single symbol. It is single if not specified for compatibility with
/// earlier MusicXML versions.
///
/// Maps the MusicXML `<level>` element.
public struct MXLLevel {

    // MARK: Public Initializers

    /// Creates a new `MXLLevel`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter isReferenceOnly: A Boolean value indicating whether this is editorial information that is for display only and should not affect playback — for instance, a modern edition of older music may set this to `true` on the attributes containing the music’s original clef, key, and time signature.
    /// - Parameter kind: Whether the editorial information applies to the start of a series of symbols, the end of a series of symbols, or a single symbol.
    /// - Parameter display: The level-display attribute group specifies three common ways to indicate editorial indications: putting parentheses or square brackets around a symbol, or making the symbol a different size. If not specified, they are left to application defaults. It is used by the level and accidental elements.
    public init(value: String,
                isReferenceOnly: Bool? = nil,
                kind: MXLStartStopSingle? = nil,
                display: Display) {
        self.display = display
        self.isReferenceOnly = isReferenceOnly
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The level-display attribute group specifies three common ways to indicate editorial indications: putting
    /// parentheses or square brackets around a symbol, or making the symbol a different size. If not specified, they
    /// are left to application defaults. It is used by the level and accidental elements.
    ///
    /// Maps to the MusicXML `level-display` attribute group.
    public let display: Display

    /// A Boolean value indicating whether this is editorial information that is for display only and should not
    /// affect playback — for instance, a modern edition of older music may set this to `true` on the attributes
    /// containing the music’s original clef, key, and time signature.
    ///
    /// Maps to the MusicXML `reference` attribute.
    public let isReferenceOnly: Bool?

    /// Whether the editorial information applies to the start of a series of symbols, the end of a series of
    /// symbols, or a single symbol.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStopSingle?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLLevel: Equatable {
}

// MARK: - Hashable

extension MXLLevel: Hashable {
}

// MARK: - Sendable

extension MXLLevel: Sendable {
}
