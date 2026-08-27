// © 2026 John Gary Pusey (see LICENSE.md)

/// The other-play element represents other types of playback. The required type attribute indicates the type of
/// playback to which the element content applies.
///
/// Maps the MusicXML `<other-play>` element.
public struct MXLOtherPlay {

    // MARK: Public Initializers

    /// Creates a new `MXLOtherPlay`.
    ///
    /// - Parameter value:  The value of this element.
    /// - Parameter kind:   The type of playback to which the element content applies.
    public init(value: String,
                kind: String) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type of playback to which the element content applies.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: String

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLOtherPlay: Equatable {
}

// MARK: - Hashable

extension MXLOtherPlay: Hashable {
}

// MARK: - Sendable

extension MXLOtherPlay: Sendable {
}
