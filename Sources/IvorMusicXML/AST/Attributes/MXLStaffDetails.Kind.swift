// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLStaffDetails {

    /// The staff-type value can be ossia, editorial, cue, alternate, or regular. An ossia staff represents music
    /// that can be played instead of what appears on the regular staff. An editorial staff also represents musical
    /// alternatives, but is created by an editor rather than the composer. It can be used for suggested
    /// interpretations or alternatives from other sources. A cue staff represents music from another part. An
    /// alternate staff shares the same music as the prior staff, but displayed differently (e.g., treble and bass
    /// clef, standard notation and tablature). It is not included in playback. An alternate staff provides more
    /// information to an application reading a file than encoding the same music in separate parts, so its use is
    /// preferred in this situation if feasible. A regular staff is the standard default staff-type.
    ///
    /// Maps the MusicXML `<staff-type>` element.
    public enum Kind {

        /// A staff that shares the same music as the prior staff, but displayed differently. It is not included
        /// in playback.
        case alternate

        /// A staff representing music from another part.
        case cue

        /// A staff representing musical alternatives created by an editor rather than the composer.
        case editorial

        /// A staff representing music that can be played instead of what appears on the regular staff.
        case ossia

        /// The standard default staff type.
        case regular
    }
}

// MARK: - Equatable

extension MXLStaffDetails.Kind: Equatable {
}

// MARK: - Hashable

extension MXLStaffDetails.Kind: Hashable {
}

// MARK: - Sendable

extension MXLStaffDetails.Kind: Sendable {
}
