// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeBeatUnit(_ beatUnit: MXLBeatUnit) {
        writeTextElement(.beatUnit, formatNoteKindValue(beatUnit.beatUnit))

        for _ in 0..<beatUnit.dot {
            writeEmptyElement(.beatUnitDot)
        }
    }

    internal mutating func writeBeatUnitTied(_ beatUnitTied: MXLMetronome.BeatUnitTied) {
        openElement(.beatUnitTied)

        writeTextElement(.beatUnit, formatNoteKindValue(beatUnitTied.beatUnit))

        for _ in 0..<beatUnitTied.beatUnitDot {
            writeEmptyElement(.beatUnitDot)
        }

        closeElement()
    }

    internal mutating func writeMetronome(_ metronome: MXLMetronome) {
        openElement(.metronome,
                    attributes: _metronomeAttributes(metronome))

        writeMetronomeContent(metronome.content)

        closeElement()
    }

    internal mutating func writeMetronomeBeatUnitContent(_ content: MXLMetronome.Content.BeatUnitContent) {
        switch content {
        case let .beatUnit(beatUnit, tied):
            writeBeatUnit(beatUnit)

            for tied in tied {
                writeBeatUnitTied(tied)
            }

        case let .perMinute(perMinute):
            writePerMinute(perMinute)
        }
    }

    internal mutating func writeMetronomeContent(_ content: MXLMetronome.Content) {
        switch content {
        case let .beatUnit(beatUnit, tied, content):
            writeBeatUnit(beatUnit)

            for tied in tied {
                writeBeatUnitTied(tied)
            }

            writeMetronomeBeatUnitContent(content)

        case let .metronomeArrows(hasMetronomeArrows, note, relation, _):
            // The parser reads every <metronome-note> into both `note` and `secondNote`, so
            // the note list is written once; `secondNote` is reconstructed on re-parse.
            if hasMetronomeArrows {
                writeEmptyElement(.metronomeArrows)
            }

            for note in note {
                writeMetronomeNote(note)
            }

            if let relation {
                writeTextElement(.metronomeRelation, relation)
            }
        }
    }

    internal mutating func writeMetronomeNote(_ note: MXLMetronome.Note) {
        openElement(.metronomeNote)

        writeTextElement(.metronomeType, formatNoteKindValue(note.kind))

        for _ in 0..<note.dot {
            writeEmptyElement(.metronomeDot)
        }

        for beam in note.beam {
            writeMetronomeNoteBeam(beam)
        }

        if let tied = note.tied {
            writeEmptyElement(.metronomeTied,
                              attributes: [(.type, formatStartStop(tied.kind))])
        }

        if let tuplet = note.tuplet {
            writeMetronomeNoteTuplet(tuplet)
        }

        closeElement()
    }

    internal mutating func writeMetronomeNoteBeam(_ beam: MXLMetronome.Note.Beam) {
        writeTextElement(.metronomeBeam,
                         formatBeamValue(beam.value),
                         attributes: [(.number, String(beam.number.uintValue))])
    }

    internal mutating func writeMetronomeNoteTuplet(_ tuplet: MXLMetronome.Note.Tuplet) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStop(tuplet.kind))]

        if let hasBracket = tuplet.hasBracket {
            attributes.append((.bracket, formatYesNo(hasBracket)))
        }

        if let showNumber = tuplet.showNumber {
            attributes.append((.showNumber, formatShowTuplet(showNumber)))
        }

        openElement(.metronomeTuplet,
                    attributes: attributes)

        writeTimeModificationContent(tuplet.timeModification)

        closeElement()
    }

    internal mutating func writePerMinute(_ perMinute: MXLPerMinute) {
        writeTextElement(.perMinute,
                         perMinute.value,
                         attributes: fontAttributes(perMinute.font))
    }

    // MARK: Private Instance Methods

    private func _metronomeAttributes(_ metronome: MXLMetronome) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = metronome.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(metronome.position)
        attributes += fontAttributes(metronome.font)
        attributes += colorAttributes(metronome.color)

        if let halign = metronome.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = metronome.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let printsObject = metronome.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        if let justify = metronome.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        attributes.append((.parentheses, formatYesNo(metronome.hasParentheses)))

        return attributes
    }
}
