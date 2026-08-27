// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFrame {

    /// The frame-note type represents each note included in the frame. An open string will have a fret value of 0,
    /// while a muted string will not be associated with a frame-note element.
    ///
    /// Maps the MusicXML `<frame-note>` element.
    public struct Note {

        // MARK: Public Initializers

        /// Creates a new `MXLFrame.Note`.
        ///
        /// - Parameter string:  The string this note is played on.
        /// - Parameter fret:  The fret this note is played on. A fret value of 0 indicates an open string.
        /// - Parameter fingering:  The fingering used for this note.
        /// - Parameter barre:  A barre placed at this note’s fret and string.
        public init(string: MXLString,
                    fret: MXLFret,
                    fingering: MXLFingering? = nil,
                    barre: MXLBarre? = nil) {
            self.barre = barre
            self.fingering = fingering
            self.fret = fret
            self.string = string
        }

        // MARK: Public Instance Properties

        /// A barre placed at this note’s fret and string.
        ///
        /// Maps to a nested MusicXML `<barre>` element.
        public let barre: MXLBarre?

        /// The fingering used for this note.
        ///
        /// Maps to a nested MusicXML `<fingering>` element.
        public let fingering: MXLFingering?

        /// The fret this note is played on. A fret value of 0 indicates an open string.
        ///
        /// Maps to a nested MusicXML `<fret>` element.
        public let fret: MXLFret

        /// The string this note is played on.
        ///
        /// Maps to a nested MusicXML `<string>` element.
        public let string: MXLString
    }
}

// MARK: - Equatable

extension MXLFrame.Note: Equatable {
}

// MARK: - Hashable

extension MXLFrame.Note: Hashable {
}

// MARK: - Sendable

extension MXLFrame.Note: Sendable {
}
