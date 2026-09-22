// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeNotehead(_ notehead: MXLNote.Notehead) {
        var attributes: [(MXLAttributeName, String)] = []

        if let isFilled = notehead.isFilled {
            attributes.append((.filled, formatYesNo(isFilled)))
        }

        attributes.append((.parentheses, formatYesNo(notehead.hasParentheses)))
        attributes += fontAttributes(notehead.font)
        attributes += colorAttributes(notehead.color)

        if let smufl = notehead.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.notehead,
                         _formatNoteNoteheadValue(notehead.value),
                         attributes: attributes)
    }

    internal mutating func writeNoteKind(_ kind: MXLNote.Kind) {
        var attributes: [(MXLAttributeName, String)] = []

        if let size = kind.size {
            attributes.append((.size, formatSymbolSize(size)))
        }

        writeTextElement(.type,
                         formatNoteKindValue(kind.value),
                         attributes: attributes)
    }

    internal mutating func writeNoteSize(_ noteSize: MXLNoteSize) {
        writeTextElement(.noteSize,
                         formatDecimal(noteSize.value),
                         attributes: [(.type, _formatNoteSizeKind(noteSize.kind))])
    }

    internal mutating func writePitch(_ pitch: MXLPitch) {
        openElement(.pitch)

        writeTextElement(.step, formatStep(pitch.step))

        if let alter = pitch.alter {
            writeTextElement(.alter, formatDecimal(alter))
        }

        writeTextElement(.octave, String(pitch.octave.uintValue))

        closeElement()
    }

    internal mutating func writeRest(_ rest: MXLRest) {
        var attributes: [(MXLAttributeName, String)] = []

        if let measure = rest.measure {
            attributes.append((.measure, formatYesNo(measure)))
        }

        guard let displayStepOctave = rest.displayStepOctave
        else {
            writeEmptyElement(.rest,
                              attributes: attributes)

            return
        }

        openElement(.rest,
                    attributes: attributes)

        writeDisplayStepOctave(displayStepOctave)

        closeElement()
    }

    internal mutating func writeStem(_ stem: MXLStem) {
        var attributes = yPositionAttributes(stem.yPosition)

        attributes += colorAttributes(stem.color)

        writeTextElement(.stem,
                         _formatStemValue(stem.value),
                         attributes: attributes)
    }

    internal mutating func writeTie(_ tie: MXLTie) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStop(tie.kind))]

        if let timeOnly = tie.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        writeEmptyElement(.tie,
                          attributes: attributes)
    }

    internal mutating func writeTimeModification(_ timeModification: MXLTimeModification) {
        openElement(.timeModification)

        writeTimeModificationContent(timeModification)

        closeElement()
    }

    internal mutating func writeTimeModificationContent(_ timeModification: MXLTimeModification) {
        writeTextElement(.actualNotes, String(timeModification.actualNotes))
        writeTextElement(.normalNotes, String(timeModification.normalNotes))

        if let group = timeModification.group {
            writeTextElement(.normalType, formatNoteKindValue(group.normalKind))

            for _ in 0..<group.normalDot {
                writeEmptyElement(.normalDot)
            }
        }
    }

    internal mutating func writeUnpitched(_ unpitched: MXLUnpitched) {
        guard let displayStepOctave = unpitched.displayStepOctave
        else {
            writeEmptyElement(.unpitched)

            return
        }

        openElement(.unpitched)

        writeDisplayStepOctave(displayStepOctave)

        closeElement()
    }

    // MARK: Private Instance Methods

    private func _formatNoteNoteheadValue(_ value: MXLNote.Notehead.Value) -> String {
        switch value {
        case .arrowDown:
            "arrow down"

        case .arrowUp:
            "arrow up"

        case .backSlashed:
            "back slashed"

        case .circled:
            "circled"

        case .circleDot:
            "circle dot"

        case .circleX:
            "circle-x"

        case .cluster:
            "cluster"

        case .cross:
            "cross"

        case .diamond:
            "diamond"

        case .do:
            "do"

        case .fa:
            "fa"

        case .faUp:
            "fa up"

        case .hidden:
            "none"

        case .invertedTriangle:
            "inverted triangle"

        case .la:
            "la"

        case .leftTriangle:
            "left triangle"

        case .mi:
            "mi"

        case .normal:
            "normal"

        case .other:
            "other"

        case .re:
            "re"

        case .rectangle:
            "rectangle"

        case .slash:
            "slash"

        case .slashed:
            "slashed"

        case .so:
            "so"

        case .square:
            "square"

        case .ti:
            "ti"

        case .triangle:
            "triangle"

        case .x:
            "x"
        }
    }

    private func _formatNoteSizeKind(_ kind: MXLNoteSize.Kind) -> String {
        switch kind {
        case .cue:
            "cue"

        case .grace:
            "grace"

        case .graceCue:
            "grace-cue"

        case .large:
            "large"
        }
    }

    private func _formatStemValue(_ value: MXLStem.Value) -> String {
        switch value {
        case .absent:
            "none"

        case .double:
            "double"

        case .down:
            "down"

        case .up:
            "up"
        }
    }
}
