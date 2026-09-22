// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLClef {

    /// The clef-sign type represents the different clef symbols. The jianpu sign indicates that the music that
    /// follows should be in jianpu numbered notation, just as the TAB sign indicates that the music that follows
    /// should be in tablature notation. Unlike TAB, a jianpu sign does not correspond to a visual clef notation.
    ///
    /// The none sign is deprecated as of MusicXML 4.0. Use the clef element’s print-object attribute instead. When
    /// the none sign is used, notes should be displayed as if in treble clef.
    ///
    /// Maps the MusicXML `<sign>` element.
    public enum Sign {

        /// A C clef.
        case c

        /// An F clef.
        case f

        /// A G clef.
        case g

        /// No visible clef sign. Deprecated as of MusicXML 4.0; notes should be displayed as if in treble clef.
        case invisible

        /// A jianpu numbered notation sign.
        case jianpu

        /// A percussion clef.
        case percussion

        /// A tablature (TAB) sign.
        case tAB
    }
}

// MARK: - Equatable

extension MXLClef.Sign: Equatable {
}

// MARK: - Hashable

extension MXLClef.Sign: Hashable {
}

// MARK: - Sendable

extension MXLClef.Sign: Sendable {
}
