// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNote {

    /// The note-type type indicates the graphic note type. Values range from 1024th to maxima. The size attribute
    /// indicates full, cue, grace-cue, or large size. The default is full for regular notes, grace-cue for notes that
    /// contain both grace and cue elements, and cue for notes that contain either a cue or a grace element, but not
    /// both.
    ///
    /// Maps the MusicXML `<type>` element.
    public struct Kind {

        // MARK: Public Initializers

        /// Creates a new `MXLNote.Kind`.
        ///
        /// - Parameter value:  The value of this element.
        /// - Parameter size:   Indicates full, cue, grace-cue, or large size.
        public init(value: MXLNoteKindValue,
                    size: MXLSymbolSize? = nil) {
            self.size = size
            self.value = value
        }

        // MARK: Public Instance Properties

        /// Indicates full, cue, grace-cue, or large size.
        ///
        /// Maps to the MusicXML `size` attribute.
        public let size: MXLSymbolSize?

        /// The value of this element.
        public let value: MXLNoteKindValue
    }
}

// MARK: - Equatable

extension MXLNote.Kind: Equatable {
}

// MARK: - Hashable

extension MXLNote.Kind: Hashable {
}

// MARK: - Sendable

extension MXLNote.Kind: Sendable {
}
