// © 2026 John Gary Pusey (see LICENSE.md)

/// The note-type-value type is used for the MusicXML type element and represents the graphic note type, from
/// 1024th (shortest) to maxima (longest).
public enum MXLNoteKindValue {

    /// A breve (double whole) note.
    case breve

    /// An eighth note.
    case eighth

    /// A half note.
    case half

    /// A long note.
    case long

    /// A maxima note, the longest note type.
    case maxima

    /// A 1024th note, the shortest note type.
    case n1024th

    /// A 128th note.
    case n128th

    /// A 16th note.
    case n16th

    /// A 256th note.
    case n256th

    /// A 32nd note.
    case n32nd

    /// A 512th note.
    case n512th

    /// A 64th note.
    case n64th

    /// A quarter note.
    case quarter

    /// A whole note.
    case whole
}

// MARK: - Equatable

extension MXLNoteKindValue: Equatable {
}

// MARK: - Hashable

extension MXLNoteKindValue: Hashable {
}

// MARK: - Sendable

extension MXLNoteKindValue: Sendable {
}
