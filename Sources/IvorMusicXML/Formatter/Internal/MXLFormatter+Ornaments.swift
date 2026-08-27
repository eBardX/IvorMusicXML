// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeEmptyTrillSound(_ name: MXLElementName,
                                                _ trill: MXLEmptyTrillSound) {
        var attributes = positionAttributes(trill.position)

        attributes += fontAttributes(trill.font)
        attributes += colorAttributes(trill.color)

        if let placement = trill.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += _trillSoundAttributes(trill.trillSound)

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writeHorizontalTurn(_ name: MXLElementName,
                                               _ turn: MXLHorizontalTurn) {
        var attributes = positionAttributes(turn.position)

        attributes += fontAttributes(turn.font)
        attributes += colorAttributes(turn.color)

        if let placement = turn.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += _trillSoundAttributes(turn.trillSound)

        if let isSlashed = turn.isSlashed {
            attributes.append((.slash, formatYesNo(isSlashed)))
        }

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writeMordent(_ name: MXLElementName,
                                        _ mordent: MXLMordent) {
        var attributes = positionAttributes(mordent.position)

        attributes += fontAttributes(mordent.font)
        attributes += colorAttributes(mordent.color)

        if let placement = mordent.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += _trillSoundAttributes(mordent.trillSound)
        attributes.append((.long, formatYesNo(mordent.isLong)))

        if let approach = mordent.approach {
            attributes.append((.approach, formatAboveBelow(approach)))
        }

        if let departure = mordent.departure {
            attributes.append((.departure, formatAboveBelow(departure)))
        }

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writeOrnaments(_ ornaments: MXLOrnaments) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = ornaments.id {
            attributes.append((.id, id))
        }

        openElement(.ornaments,
                    attributes: attributes)

        writeOrnamentsContent(ornaments.content)

        for accidentalMark in ornaments.accidentalMark {
            writeAccidentalMark(accidentalMark)
        }

        closeElement()
    }

    internal mutating func writeOrnamentsContent(_ content: MXLOrnaments.Content) {
        switch content {
        case let .delayedInvertedTurn(turn):
            writeHorizontalTurn(.delayedInvertedTurn, turn)

        case let .delayedTurn(turn):
            writeHorizontalTurn(.delayedTurn, turn)

        case let .haydn(trill):
            writeEmptyTrillSound(.haydn, trill)

        case let .invertedMordent(mordent):
            writeMordent(.invertedMordent, mordent)

        case let .invertedTurn(turn):
            writeHorizontalTurn(.invertedTurn, turn)

        case let .invertedVerticalTurn(trill):
            writeEmptyTrillSound(.invertedVerticalTurn, trill)

        case let .mordent(mordent):
            writeMordent(.mordent, mordent)

        case let .otherOrnament(text):
            writeOtherPlacementText(.otherOrnament, text)

        case let .schleifer(position, font, color, placement):
            writePlacementStyle(.schleifer, position: position, font: font, color: color, placement: placement)

        case let .shake(trill):
            writeEmptyTrillSound(.shake, trill)

        case let .tremolo(tremolo):
            writeTremolo(tremolo)

        case let .trillMark(trill):
            writeEmptyTrillSound(.trillMark, trill)

        case let .turn(turn):
            writeHorizontalTurn(.turn, turn)

        case let .verticalTurn(trill):
            writeEmptyTrillSound(.verticalTurn, trill)

        case let .wavyLine(wavyLine):
            writeWavyLine(wavyLine)
        }
    }

    internal mutating func writeTremolo(_ tremolo: MXLTremolo) {
        var attributes: [(MXLAttributeName, String)] = [(.type, _formatTremoloKind(tremolo.kind))]

        attributes += positionAttributes(tremolo.position)
        attributes += fontAttributes(tremolo.font)
        attributes += colorAttributes(tremolo.color)

        if let placement = tremolo.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let smufl = tremolo.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.tremolo,
                         String(tremolo.value.uintValue),
                         attributes: attributes)
    }

    internal mutating func writeWavyLine(_ wavyLine: MXLWavyLine) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStopContinue(wavyLine.kind))]

        if let number = wavyLine.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let smufl = wavyLine.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        attributes += positionAttributes(wavyLine.position)

        if let placement = wavyLine.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += colorAttributes(wavyLine.color)
        attributes += _trillSoundAttributes(wavyLine.trillSound)

        writeEmptyElement(.wavyLine,
                          attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatStartNote(_ value: MXLStartNote) -> String {
        switch value {
        case .below:
            "below"

        case .main:
            "main"

        case .upper:
            "upper"
        }
    }

    private func _formatTremoloKind(_ value: MXLTremolo.Kind) -> String {
        switch value {
        case .single:
            "single"

        case .start:
            "start"

        case .stop:
            "stop"

        case .unmeasured:
            "unmeasured"
        }
    }

    private func _formatTrillStep(_ value: MXLTrillStep) -> String {
        switch value {
        case .half:
            "half"

        case .unison:
            "unison"

        case .whole:
            "whole"
        }
    }

    private func _formatTwoNoteTurn(_ value: MXLTwoNoteTurn) -> String {
        switch value {
        case .half:
            "half"

        case .omitted:
            "none"

        case .whole:
            "whole"
        }
    }

    private func _trillSoundAttributes(_ sound: MXLTrillSound) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let startNote = sound.startNote {
            attributes.append((.startNote, _formatStartNote(startNote)))
        }

        if let trillStep = sound.trillStep {
            attributes.append((.trillStep, _formatTrillStep(trillStep)))
        }

        if let twoNoteTurn = sound.twoNoteTurn {
            attributes.append((.twoNoteTurn, _formatTwoNoteTurn(twoNoteTurn)))
        }

        if let accelerates = sound.accelerates {
            attributes.append((.accelerate, formatYesNo(accelerates)))
        }

        if let beats = sound.beats {
            attributes.append((.beats, formatDecimal(beats)))
        }

        if let secondBeat = sound.secondBeat {
            attributes.append((.secondBeat, formatDecimal(secondBeat)))
        }

        if let lastBeat = sound.lastBeat {
            attributes.append((.lastBeat, formatDecimal(lastBeat)))
        }

        return attributes
    }
}
