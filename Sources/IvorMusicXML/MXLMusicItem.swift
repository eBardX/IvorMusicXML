// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A music item found in a MusicXML measure or part.
public enum MXLMusicItem {
    /// An attributes item with the specified number of divisions per quarter
    /// note.
    case attributes(UInt)

    /// A backup item with the specified duration in divisions.
    case backup(UInt)

    /// A forward item with the specified duration in divisions.
    case forward(UInt)

    /// A grace note item.
    case graceNote(MXLGraceNote)

    /// A note item.
    case note(MXLNote)

    /// A sound item with the specified tempo in beats per minute.
    case sound(Float)
}

// MARK: - Sendable

extension MXLMusicItem: Sendable {
}
