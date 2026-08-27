// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNoteSize {

    /// The note-size-type type indicates the type of note being defined by a note-size element. The grace-cue type
    /// is used for notes of grace-cue size. The grace type is used for notes of cue size that include a grace
    /// element. The cue type is used for all other notes with cue size, whether defined explicitly or implicitly
    /// via a cue element. The large type is used for notes of large size.
    public enum Kind {

        /// A note with cue size, whether defined explicitly or implicitly via a cue element.
        case cue

        /// A note of cue size that includes a grace element.
        case grace

        /// A note of grace-cue size.
        case graceCue

        /// A note of large size.
        case large
    }
}

// MARK: - Equatable

extension MXLNoteSize.Kind: Equatable {
}

// MARK: - Hashable

extension MXLNoteSize.Kind: Hashable {
}

// MARK: - Sendable

extension MXLNoteSize.Kind: Sendable {
}
