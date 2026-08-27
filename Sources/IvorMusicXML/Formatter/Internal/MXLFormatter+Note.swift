// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal func formatBeamValue(_ value: MXLBeamValue) -> String {
        switch value {
        case .backwardHook:
            "backward hook"

        case .begin:
            "begin"

        case .continue:
            "continue"

        case .end:
            "end"

        case .forwardHook:
            "forward hook"
        }
    }

    internal mutating func writeAccidental(_ accidental: MXLAccidental) {
        var attributes: [(MXLAttributeName, String)] = []

        if let isCautionary = accidental.isCautionary {
            attributes.append((.cautionary, formatYesNo(isCautionary)))
        }

        if let isEditorial = accidental.isEditorial {
            attributes.append((.editorial, formatYesNo(isEditorial)))
        }

        attributes += levelDisplayAttributes(accidental.levelDisplay)
        attributes += positionAttributes(accidental.position)
        attributes += fontAttributes(accidental.font)
        attributes += colorAttributes(accidental.color)

        if let smufl = accidental.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.accidental,
                         formatAccidentalValue(accidental.value),
                         attributes: attributes)
    }

    internal mutating func writeAccidentalText(_ accidentalText: MXLAccidentalText) {
        var attributes: [(MXLAttributeName, String)] = []

        if let justify = accidentalText.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        attributes += positionAttributes(accidentalText.position)
        attributes += fontAttributes(accidentalText.font)
        attributes += colorAttributes(accidentalText.color)

        if let halign = accidentalText.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = accidentalText.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        attributes += textDecorationAttributes(accidentalText.underline,
                                               accidentalText.overline,
                                               accidentalText.lineThrough)

        if let rotation = accidentalText.rotation {
            attributes.append((.rotation, formatDecimal(rotation)))
        }

        attributes.append((.letterSpacing, formatNumberOrNormal(accidentalText.letterSpacing)))
        attributes.append((.lineHeight, formatNumberOrNormal(accidentalText.lineHeight)))

        if let xmlLang = accidentalText.xmlLang {
            attributes.append((.xmlLang, xmlLang))
        }

        if let xmlSpace = accidentalText.xmlSpace {
            attributes.append((.xmlSpace, formatXmlSpace(xmlSpace)))
        }

        attributes.append((.dir, formatTextDirection(accidentalText.dir)))

        if let enclosure = accidentalText.enclosure {
            attributes.append((.enclosure, formatEnclosureShape(enclosure)))
        }

        if let smufl = accidentalText.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.accidentalText,
                         formatAccidentalValue(accidentalText.value),
                         attributes: attributes)
    }

    internal mutating func writeBeam(_ beam: MXLBeam) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = beam.id {
            attributes.append((.id, id))
        }

        attributes.append((.number, String(beam.number.uintValue)))

        if let repeater = beam.repeater {
            attributes.append((.repeater, formatYesNo(repeater)))
        }

        if let fan = beam.fan {
            attributes.append((.fan, _formatFan(fan)))
        }

        attributes += colorAttributes(beam.color)

        writeTextElement(.beam,
                         formatBeamValue(beam.value),
                         attributes: attributes)
    }

    internal mutating func writeDisplayStepOctave(_ displayStepOctave: MXLDisplayStepOctave) {
        writeTextElement(.displayStep,
                         formatStep(displayStepOctave.displayStep))
        writeTextElement(.displayOctave,
                         String(displayStepOctave.displayOctave.uintValue))
    }

    internal mutating func writeFullNote(_ fullNote: MXLFullNote) {
        if fullNote.isChord {
            writeEmptyElement(.chord)
        }

        writeFullNoteContent(fullNote.content)
    }

    internal mutating func writeFullNoteContent(_ content: MXLFullNote.Content) {
        switch content {
        case let .pitch(pitch):
            writePitch(pitch)

        case let .rest(rest):
            writeRest(rest)

        case let .unpitched(unpitched):
            writeUnpitched(unpitched)
        }
    }

    internal mutating func writeGrace(_ grace: MXLGrace) {
        var attributes: [(MXLAttributeName, String)] = []

        if let stealTimePrevious = grace.stealTimePrevious {
            attributes.append((.stealTimePrevious, formatDecimal(stealTimePrevious)))
        }

        if let stealTimeFollowing = grace.stealTimeFollowing {
            attributes.append((.stealTimeFollowing, formatDecimal(stealTimeFollowing)))
        }

        if let makeTime = grace.makeTime {
            attributes.append((.makeTime, String(makeTime.intValue)))
        }

        if let isSlashed = grace.isSlashed {
            attributes.append((.slash, formatYesNo(isSlashed)))
        }

        writeEmptyElement(.grace,
                          attributes: attributes)
    }

    internal mutating func writeNote(_ note: MXLNote) {
        openElement(.note,
                    attributes: _noteAttributes(note))

        writeNoteContent(note.content)

        for instrument in note.instrument {
            writeInstrument(instrument)
        }

        if let footnote = note.footnote {
            writeFormattedText(.footnote, footnote)
        }

        if let level = note.level {
            writeLevel(level)
        }

        writeNoteChildren(note)

        for notations in note.notations {
            writeNotations(notations)
        }

        for lyric in note.lyric {
            writeLyric(lyric)
        }

        if let play = note.play {
            writePlay(play)
        }

        if let listen = note.listen {
            writeListen(listen)
        }

        closeElement()
    }

    internal mutating func writeNoteChildren(_ note: MXLNote) {
        if let voice = note.voice {
            writeTextElement(.voice, voice.voice)
        }

        if let kind = note.kind {
            writeNoteKind(kind)
        }

        for dot in note.dot {
            _writeDot(dot)
        }

        if let accidental = note.accidental {
            writeAccidental(accidental)
        }

        if let timeModification = note.timeModification {
            writeTimeModification(timeModification)
        }

        if let stem = note.stem {
            writeStem(stem)
        }

        if let notehead = note.notehead {
            writeNotehead(notehead)
        }

        // The notehead-text child is written in a later phase.

        if let staff = note.staff {
            writeTextElement(.staff, String(staff.uintValue))
        }

        for beam in note.beam {
            writeBeam(beam)
        }
    }

    internal mutating func writeNoteContent(_ content: MXLNote.Content) {
        switch content {
        case let .graceNote(fullNote, grace, tie):
            writeGrace(grace)
            writeFullNote(fullNote)

            for tie in tie {
                writeTie(tie)
            }

        case let .graceNoteCue(fullNote, grace):
            writeGrace(grace)
            writeEmptyElement(.cue)
            writeFullNote(fullNote)

        case let .regularNote(fullNote, duration, tie):
            writeFullNote(fullNote)
            writeTextElement(.duration, String(duration.intValue))

            for tie in tie {
                writeTie(tie)
            }

        case let .regularNoteCue(fullNote, duration):
            writeEmptyElement(.cue)
            writeFullNote(fullNote)
            writeTextElement(.duration, String(duration.intValue))
        }
    }

    // MARK: Private Instance Methods

    private func _formatFan(_ value: MXLFan) -> String {
        switch value {
        case .accel:
            "accel"

        case .rit:
            "rit"

        case .steady:
            "none"
        }
    }

    private func _noteAttributes(_ note: MXLNote) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = note.id {
            attributes.append((.id, id))
        }

        attributes += xPositionAttributes(note.xPosition)
        attributes += fontAttributes(note.font)
        attributes += colorAttributes(note.color)
        attributes += printoutAttributes(note.printout)
        attributes.append((.printLeger, formatYesNo(note.printsLeger)))

        if let dynamics = note.dynamics {
            attributes.append((.dynamics, formatDecimal(dynamics)))
        }

        if let endDynamics = note.endDynamics {
            attributes.append((.endDynamics, formatDecimal(endDynamics)))
        }

        if let attack = note.attack {
            attributes.append((.attack, String(attack.intValue)))
        }

        if let release = note.release {
            attributes.append((.release, String(release.intValue)))
        }

        if let timeOnly = note.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        if let isPizzicato = note.isPizzicato {
            attributes.append((.pizzicato, formatYesNo(isPizzicato)))
        }

        return attributes
    }

    private mutating func _writeDot(_ dot: MXLEmptyPlacement) {
        var attributes = printStyleAttributes(dot.printStyle)

        if let placement = dot.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeEmptyElement(.dot,
                          attributes: attributes)
    }
}
