// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDirection.Kind {

    /// One of the alternatives for DirectionType.
    public enum Content {
        /// An accordion registration symbol.
        case accordionRegistration(MXLAccordionRegistration)

        /// A bracket line used with words in a musical direction.
        case bracket(MXLBracket)

        /// One or more coda signs.
        case coda([MXLCoda])

        /// The damp element specifies a harp damping mark.
        case damp(MXLEmptyPrintStyleAlignID)

        /// The damp-all element specifies a harp damping mark for all strings.
        case dampAll(MXLEmptyPrintStyleAlignID)

        /// Dashes, used for instance with cresc. and dim. marks.
        case dashes(MXLDashes)

        /// One or more dynamics markings.
        case dynamics([MXLDynamics])

        /// The eyeglasses element represents the eyeglasses symbol, common in commercial music.
        case eyeglasses(MXLEmptyPrintStyleAlignID)

        /// A harp pedal diagram.
        case harpPedals(MXLHarpPedals)

        /// A graphical image.
        case image(MXLImage)

        /// A metronome mark or other metric relationship.
        case metronome(MXLMetronome)

        /// An octave shift indicating notes shifted up or down from their true pitched values.
        case octaveShift(MXLOctaveShift)

        /// A direction symbol not yet defined elsewhere in the MusicXML format.
        case otherDirection(MXLOtherDirection)

        /// A piano pedal mark, such as damper or sostenuto.
        case pedal(MXLPedal)

        /// One or more percussion pictogram symbols.
        case percussion([MXLPercussion])

        /// A principal or secondary voice symbol.
        case principalVoice(MXLPrincipalVoice)

        /// The rehearsal element specifies letters, numbers, and section names that are notated in the score for
        /// reference during rehearsal. The enclosure is square if not specified. The language is Italian (“it”) if not
        /// specified. Left justification is used if not specified.
        case rehearsal([MXLFormattedTextID])

        /// A scordatura string tuning.
        case scordatura(MXLScordatura)

        /// One or more segno signs.
        case segno([MXLSegno])

        /// A staff division arrow symbol.
        case staffDivide(MXLStaffDivide)

        /// A string mute on or off symbol.
        case stringMute(MXLStringMute)

        /// The symbol element specifies a musical symbol using a canonical SMuFL glyph name. It is used when an
        /// occasional musical symbol is interspersed into text. It should not be used in place of semantic markup, such
        /// as metronome marks that mix text and symbols. Left justification is used if not specified. Enclosure is none
        /// if not specified.
        case symbol(MXLFormattedSymbolID)

        /// A crescendo or diminuendo wedge symbol.
        case wedge(MXLWedge)

        /// The words element specifies a standard text direction. The enclosure is none if not specified. The language is
        /// Italian (“it”) if not specified. Left justification is used if not specified.
        case words(MXLFormattedTextID)
    }
}

// MARK: - Equatable

extension MXLDirection.Kind.Content: Equatable {
}

// MARK: - Hashable

extension MXLDirection.Kind.Content: Hashable {
}

// MARK: - Sendable

extension MXLDirection.Kind.Content: Sendable {
}
