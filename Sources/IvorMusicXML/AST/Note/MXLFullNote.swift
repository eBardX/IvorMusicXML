// © 2026 John Gary Pusey (see LICENSE.md)

/// The full-note group is a sequence of the common note elements between cue/grace notes and regular (full)
/// notes: pitch, chord, and rest information, but not duration (cue and grace notes do not have duration
/// encoded). Unpitched elements are used for unpitched percussion, speaking voice, and other musical elements
/// lacking determinate pitch.
public struct MXLFullNote {

    // MARK: Public Initializers

    /// Creates a new `MXLFullNote`.
    ///
    /// - Parameter isChord:  A Boolean value indicating whether this note is an additional chord tone with the preceding note.
    /// - Parameter content:  One of the alternatives for FullNote.
    public init(isChord: Bool,
                content: Content) {
        self.isChord = isChord
        self.content = content
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for FullNote.
    public let content: Content

    /// A Boolean value indicating whether this note is an additional chord tone with the preceding note.
    ///
    /// The duration of a chord note does not move the musical position within a measure. That is done by the duration
    /// of the first preceding note without a chord element. Thus the duration of a chord note cannot be longer than
    /// the preceding note. In most cases the duration will be the same as the preceding note. However, it can be
    /// shorter in situations such as multiple stops for string instruments.
    ///
    /// Maps to a nested MusicXML `<chord>` element.
    public let isChord: Bool
}

// MARK: - Equatable

extension MXLFullNote: Equatable {
}

// MARK: - Hashable

extension MXLFullNote: Hashable {
}

// MARK: - Sendable

extension MXLFullNote: Sendable {
}
