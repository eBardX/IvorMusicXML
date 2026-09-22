// © 2026 John Gary Pusey (see LICENSE.md)

/// The note-size type indicates the percentage of the regular note size to use for notes with a cue and large
/// size as defined in the type element. The grace type is used for notes of cue size that that include a grace
/// element. The cue type is used for all other notes with cue size, whether defined explicitly or implicitly via
/// a cue element. The large type is used for notes of large size. The text content represent the numeric
/// percentage. A value of 100 would be identical to the size of a regular note as defined by the music font.
///
/// Maps the MusicXML `<note-size>` element.
public struct MXLNoteSize {

    // MARK: Public Initializers

    /// Creates a new `MXLNoteSize`.
    ///
    /// - Parameter value:  The value of this element.
    /// - Parameter kind:   Whether the percentage applies to grace, cue, or large size notes.
    public init(value: Double,
                kind: Kind) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Whether the percentage applies to grace, cue, or large size notes.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// The value of this element.
    public let value: Double
}

// MARK: - Equatable

extension MXLNoteSize: Equatable {
}

// MARK: - Hashable

extension MXLNoteSize: Hashable {
}

// MARK: - Sendable

extension MXLNoteSize: Sendable {
}
