// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLOrnaments {

    /// One of the alternatives for Ornaments.
    public enum Content {
        /// The delayed-inverted-turn element indicates an inverted turn that is delayed until the end of the current
        /// note.
        case delayedInvertedTurn(MXLHorizontalTurn)

        /// The delayed-turn element indicates a normal turn that is delayed until the end of the current note.
        case delayedTurn(MXLHorizontalTurn)

        /// The haydn element represents the Haydn ornament. This is defined in SMuFL as ornamentHaydn.
        case haydn(MXLEmptyTrillSound)

        /// The inverted-mordent element represents the sign without the vertical line. The choice of which mordent is
        /// inverted differs between MusicXML and SMuFL. The long attribute is "no" by default.
        case invertedMordent(MXLMordent)

        /// The inverted-turn element has the shape which goes down and then up.
        case invertedTurn(MXLHorizontalTurn)

        /// The inverted-vertical-turn element has the turn symbol shape arranged vertically going from upper right to
        /// lower left.
        case invertedVerticalTurn(MXLEmptyTrillSound)

        /// The mordent element represents the sign with the vertical line. The choice of which mordent sign is inverted
        /// differs between MusicXML and SMuFL. The long attribute is "no" by default.
        case mordent(MXLMordent)

        /// The other-ornament element is used to define any ornaments not yet in the MusicXML format. The smufl attribute
        /// can be used to specify a particular ornament, allowing application interoperability without requiring every
        /// SMuFL ornament to have a MusicXML element equivalent. Using the other-ornament element without the smufl
        /// attribute allows for extended representation, though without application interoperability.
        case otherOrnament(MXLOtherPlacementText)

        /// The name for this ornament is based on the German, to avoid confusion with the more common slide element
        /// defined earlier.
        case schleifer(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The shake element has a similar appearance to an inverted-mordent element.
        case shake(MXLEmptyTrillSound)

        /// The tremolo element represents tremolo marks used to indicate a note or chord that is repeated
        /// individually, or repeated alternation between two notes or chords.
        case tremolo(MXLTremolo)

        /// The trill-mark element represents the trill-mark symbol.
        case trillMark(MXLEmptyTrillSound)

        /// The turn element is the normal turn shape which goes up then down.
        case turn(MXLHorizontalTurn)

        /// The vertical-turn element has the turn symbol shape arranged vertically going from upper left to lower right.
        case verticalTurn(MXLEmptyTrillSound)

        /// The wavy-line element represents a wavy line that is used to indicate a trill.
        case wavyLine(MXLWavyLine)
    }
}

// MARK: - Equatable

extension MXLOrnaments.Content: Equatable {
}

// MARK: - Hashable

extension MXLOrnaments.Content: Hashable {
}

// MARK: - Sendable

extension MXLOrnaments.Content: Sendable {
}
