// © 2026 John Gary Pusey (see LICENSE.md)

/// The play type specifies playback techniques to be used in conjunction with the instrument-sound element. When
/// used as part of a sound element, it applies to all notes going forward in score order. In multi-instrument
/// parts, the affected instrument should be specified using the id attribute. When used as part of a note
/// element, it applies to the current note only.
///
/// Maps the MusicXML `<play>` element.
public struct MXLPlay {

    // MARK: Public Initializers

    /// Creates a new `MXLPlay`.
    ///
    /// - Parameter id:     Specifies the affected instrument when used within multi-instrument parts.
    /// - Parameter items:  One of the alternatives for Play.
    public init(id: String? = nil,
                items: [Item] = []) {
        self.id = id
        self.items = items
    }

    // MARK: Public Instance Properties

    /// Specifies the affected instrument when used within multi-instrument parts.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// One of the alternatives for Play.
    public let items: [Item]
}

// MARK: - Equatable

extension MXLPlay: Equatable {
}

// MARK: - Hashable

extension MXLPlay: Hashable {
}

// MARK: - Sendable

extension MXLPlay: Sendable {
}
