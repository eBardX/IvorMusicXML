// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTechnical {

    /// One of the alternatives for Technical.
    public enum Item {
        /// The arrow element represents an arrow used for a musical technical indication, which can be either a
        /// Unicode or a SMuFL arrow.
        case arrow(MXLArrow)

        /// The bend element is used in guitar notation and tablature to represent a bend or release.
        case bend(MXLBend)

        /// The brass-bend element represents the u-shaped bend symbol used in brass notation, distinct from the bend
        /// element used in guitar music.
        case brassBend(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The double-tongue element represents the double tongue symbol (two dots arranged horizontally).
        case doubleTongue(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The down-bow element represents the symbol that is used both for down-bowing on bowed instruments, and down-
        /// stroke on plucked instruments.
        case downBow(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The fingering element represents fingering for an individual note, typically indicated 1, 2, 3, 4, 5.
        case fingering(MXLFingering)

        /// The fingernails element is used in notation for harp and other plucked string instruments.
        case fingernails(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The flip element represents the flip symbol used in brass notation.
        case flip(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The fret element is used with tablature notation and chord diagrams.
        case fret(MXLFret)

        /// The golpe element represents the golpe symbol that is used for tapping the pick guard in guitar music.
        case golpe(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The half-muted element represents the half-muted symbol, which looks like a circle with a plus sign inside.
        /// The smufl attribute can be used to distinguish different SMuFL glyphs that have a similar appearance such as
        /// brassMuteHalfClosed and guitarHalfOpenPedal. If not present, the default glyph is brassMuteHalfClosed.
        case halfMuted(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?, smufl: MXLSmuflGlyphName?)

        /// The hammer-on element is used in guitar and fretted instrument notation to specify the start or stop of
        /// a hammer-on between a pair of notes.
        case hammerOn(MXLHammerOnPullOff)

        /// The handbell element represents notation for various techniques used in handbell and handchime music.
        case handbell(MXLHandbell)

        /// The harmon-mute element represents the symbols used for harmon mutes in brass notation.
        case harmonMute(MXLHarmonMute)

        /// The harmonic element indicates natural and artificial harmonics.
        case harmonic(MXLHarmonic)

        /// The heel element is used with organ pedals to indicate use of the heel.
        case heel(MXLHeelToe)

        /// The hole element represents the symbols used for woodwind and brass fingerings as well as other
        /// notations.
        case hole(MXLHole)

        /// The open element represents the open symbol, which looks like a circle. The smufl attribute can be used to
        /// distinguish different SMuFL glyphs that have a similar appearance such as brassMuteOpen and guitarOpenPedal.
        /// If not present, the default glyph is brassMuteOpen.
        case open(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?, smufl: MXLSmuflGlyphName?)

        /// The open-string element represents the zero-shaped open string symbol.
        case openString(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The other-technical element is used to define any technical indications not yet in the MusicXML format. The
        /// smufl attribute can be used to specify a particular glyph, allowing application interoperability without
        /// requiring every SMuFL technical indication to have a MusicXML element equivalent. Using the other-technical
        /// element without the smufl attribute allows for extended representation, though without application
        /// interoperability.
        case otherTechnical(MXLOtherPlacementText)

        /// The pluck element is used to specify the plucking fingering on a fretted instrument, where the fingering
        /// element refers to the fretting fingering. Typical values are p, i, m, a for pulgar/thumb, indicio/index,
        /// medio/middle, and anular/ring fingers.
        case pluck(MXLPlacementText)

        /// The pull-off element is used in guitar and fretted instrument notation to specify the start or stop of
        /// a pull-off between a pair of notes.
        case pullOff(MXLHammerOnPullOff)

        /// The smear element represents the tilde-shaped smear symbol used in brass notation.
        case smear(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The snap-pizzicato element represents the snap pizzicato symbol. This is a circle with a line, where the line
        /// comes inside the circle. It is distinct from the thumb-position symbol, where the line does not come inside
        /// the circle.
        case snapPizzicato(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The stopped element represents the stopped symbol, which looks like a plus sign. The smufl attribute
        /// distinguishes different SMuFL glyphs that have a similar appearance such as handbellsMalletBellSuspended and
        /// guitarClosePedal. If not present, the default glyph is brassMuteClosed.
        case stopped(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?, smufl: MXLSmuflGlyphName?)

        /// The string element is used with tablature notation, regular notation, and chord diagrams to indicate a
        /// string number.
        case string(MXLString)

        /// The tap element indicates a tap on the fretboard.
        case tap(MXLTap)

        /// The thumb-position element represents the thumb position symbol. This is a circle with a line, where the line
        /// does not come within the circle. It is distinct from the snap pizzicato symbol, where the line comes inside
        /// the circle.
        case thumbPosition(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The toe element is used with organ pedals to indicate use of the toe.
        case toe(MXLHeelToe)

        /// The triple-tongue element represents the triple tongue symbol (three dots arranged horizontally).
        case tripleTongue(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The up-bow element represents the symbol that is used both for up-bowing on bowed instruments, and up-stroke
        /// on plucked instruments.
        case upBow(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)
    }
}

// MARK: - Equatable

extension MXLTechnical.Item: Equatable {
}

// MARK: - Hashable

extension MXLTechnical.Item: Hashable {
}

// MARK: - Sendable

extension MXLTechnical.Item: Sendable {
}
