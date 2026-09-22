// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeBarre(_ barre: MXLBarre) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStop(barre.kind))]

        attributes += colorAttributes(barre.color)

        writeEmptyElement(.barre,
                          attributes: attributes)
    }

    internal mutating func writeFigure(_ figure: MXLFigure) {
        openElement(.figure)

        if let prefix = figure.prefix {
            writeStyleText(.prefix, prefix)
        }

        if let number = figure.number {
            writeStyleText(.figureNumber, number)
        }

        if let suffix = figure.suffix {
            writeStyleText(.suffix, suffix)
        }

        if let extend = figure.extend {
            writeExtend(extend)
        }

        // The footnote and level children are written in a later phase.

        closeElement()
    }

    internal mutating func writeFiguredBass(_ figuredBass: MXLFiguredBass) {
        openElement(.figuredBass,
                    attributes: _figuredBassAttributes(figuredBass))

        for figure in figuredBass.figure {
            writeFigure(figure)
        }

        if let duration = figuredBass.duration {
            writeTextElement(.duration, String(duration.intValue))
        }

        // The footnote and level children are written in a later phase.

        closeElement()
    }

    internal mutating func writeFirstFret(_ firstFret: MXLFirstFret) {
        var attributes: [(MXLAttributeName, String)] = []

        if let text = firstFret.text {
            attributes.append((.text, text))
        }

        if let location = firstFret.location {
            attributes.append((.location, formatLeftRight(location)))
        }

        writeTextElement(.firstFret,
                         String(firstFret.value),
                         attributes: attributes)
    }

    internal mutating func writeFrame(_ frame: MXLFrame) {
        openElement(.frame,
                    attributes: _frameAttributes(frame))

        writeTextElement(.frameStrings, String(frame.strings))
        writeTextElement(.frameFrets, String(frame.frets))

        if let firstFret = frame.firstFret {
            writeFirstFret(firstFret)
        }

        for note in frame.note {
            writeFrameNote(note)
        }

        closeElement()
    }

    internal mutating func writeFrameNote(_ note: MXLFrame.Note) {
        openElement(.frameNote)

        writeString(note.string)
        writeFret(note.fret)

        if let fingering = note.fingering {
            writeFingering(fingering)
        }

        if let barre = note.barre {
            writeBarre(barre)
        }

        closeElement()
    }

    internal mutating func writeNumeral(_ numeral: MXLNumeral) {
        openElement(.numeral)

        writeNumeralRoot(numeral.root)

        if let alter = numeral.alter {
            writeHarmonyAlter(.numeralAlter, alter)
        }

        if let key = numeral.key {
            writeNumeralKey(key)
        }

        closeElement()
    }

    internal mutating func writeNumeralKey(_ key: MXLNumeral.Key) {
        var attributes: [(MXLAttributeName, String)] = []

        if let printsObject = key.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        openElement(.numeralKey,
                    attributes: attributes)

        writeTextElement(.numeralFifths, String(key.fifths.intValue))
        writeTextElement(.numeralMode, _formatNumeralMode(key.mode))

        closeElement()
    }

    internal mutating func writeNumeralRoot(_ root: MXLNumeral.Root) {
        var attributes: [(MXLAttributeName, String)] = []

        if let text = root.text {
            attributes.append((.text, text))
        }

        attributes += positionAttributes(root.position)
        attributes += fontAttributes(root.font)
        attributes += colorAttributes(root.color)

        writeTextElement(.numeralRoot,
                         String(root.value.uintValue),
                         attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _figuredBassAttributes(_ figuredBass: MXLFiguredBass) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = figuredBass.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(figuredBass.position)
        attributes += fontAttributes(figuredBass.font)
        attributes += colorAttributes(figuredBass.color)

        if let halign = figuredBass.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = figuredBass.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let placement = figuredBass.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += printoutAttributes(figuredBass.printout)

        if let hasParentheses = figuredBass.hasParentheses {
            attributes.append((.parentheses, formatYesNo(hasParentheses)))
        }

        return attributes
    }

    private func _formatNumeralMode(_ value: MXLNumeral.Mode) -> String {
        switch value {
        case .harmonicMinor:
            "harmonic minor"

        case .major:
            "major"

        case .melodicMinor:
            "melodic minor"

        case .minor:
            "minor"

        case .naturalMinor:
            "natural minor"
        }
    }

    private func _frameAttributes(_ frame: MXLFrame) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = frame.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(frame.position)
        attributes += colorAttributes(frame.color)

        if let halign = frame.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = frame.valign {
            attributes.append((.valign, formatValignImage(valign)))
        }

        if let height = frame.height {
            attributes.append((.height, formatDecimal(height)))
        }

        if let width = frame.width {
            attributes.append((.width, formatDecimal(width)))
        }

        if let unplayed = frame.unplayed {
            attributes.append((.unplayed, unplayed))
        }

        return attributes
    }
}
