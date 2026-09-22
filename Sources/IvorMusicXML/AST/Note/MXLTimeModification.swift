// © 2026 John Gary Pusey (see LICENSE.md)

/// Time modification indicates tuplets, double-note tremolos, and other durational changes. A time-modification
/// element shows how the cumulative, sounding effect of tuplets and double-note tremolos compare to the written
/// note type represented by the type and dot elements. Nested tuplets and other notations that use more detailed
/// information need both the time-modification and tuplet elements to be represented accurately.
///
/// Maps the MusicXML `<time-modification>` element.
public struct MXLTimeModification {

    // MARK: Public Initializers

    /// Creates a new `MXLTimeModification`.
    ///
    /// - Parameter actualNotes:  The actual-notes element describes how many notes are played in the time usually occupied by the number in the normal-notes element.
    /// - Parameter normalNotes:  The normal-notes element describes how many notes are usually played in the time occupied by the number in the actual-notes element.
    /// - Parameter group:        The graphic note type and augmentation dots for the normal-notes portion of this time modification, when they differ from the notated type of the current note.
    public init(actualNotes: Int,
                normalNotes: Int,
                group: Group? = nil) {
        self.actualNotes = actualNotes
        self.group = group
        self.normalNotes = normalNotes
    }

    // MARK: Public Instance Properties

    /// The actual-notes element describes how many notes are played in the time usually occupied by the number in the
    /// normal-notes element.
    ///
    /// Maps to a nested MusicXML `<actual-notes>` element.
    public let actualNotes: Int

    /// The graphic note type and augmentation dots for the normal-notes portion of this time modification, when they
    /// differ from the notated type of the current note.
    ///
    /// Maps to nested MusicXML `<normal-type>` and `<normal-dot>` elements.
    public let group: Group?

    /// The normal-notes element describes how many notes are usually played in the time occupied by the number in the
    /// actual-notes element.
    ///
    /// Maps to a nested MusicXML `<normal-notes>` element.
    public let normalNotes: Int
}

// MARK: - Equatable

extension MXLTimeModification: Equatable {
}

// MARK: - Hashable

extension MXLTimeModification: Hashable {
}

// MARK: - Sendable

extension MXLTimeModification: Sendable {
}
