// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNote {

    /// One of the alternatives for Note.
    ///
    /// MusicXML distinguishes sound information from notation information: grace notes carry no duration, since
    /// they have no defined sounding length, while cue notes do carry a duration, since — despite being silent for
    /// playback — they still occupy a definite amount of time in the measure. The `cue` marker and the presence of
    /// `duration` are therefore independent: a grace note stays undurated even when it is also marked `cue`.
    public enum Content {
        /// A grace note that is not additionally marked `cue`. Like all grace notes, it has no duration, but it may
        /// carry ties.
        case graceNote(fullNote: MXLFullNote, grace: MXLGrace, tie: [MXLTie])

        /// A grace note that is also cue-sized/silent-for-playback. Like all grace notes, it has no duration.
        case graceNoteCue(fullNote: MXLFullNote, grace: MXLGrace)

        /// A normal, sounding note, with a duration and any ties.
        case regularNote(fullNote: MXLFullNote, duration: MXLPositiveDivisions, tie: [MXLTie])

        /// A cue-sized, silent-for-playback note that is not a grace note. Still occupies a definite duration in
        /// the measure.
        case regularNoteCue(fullNote: MXLFullNote, duration: MXLPositiveDivisions)
    }
}

// MARK: - Equatable

extension MXLNote.Content: Equatable {
}

// MARK: - Hashable

extension MXLNote.Content: Hashable {
}

// MARK: - Sendable

extension MXLNote.Content: Sendable {
}
