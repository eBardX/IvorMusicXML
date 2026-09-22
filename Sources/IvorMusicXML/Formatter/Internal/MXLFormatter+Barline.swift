// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeBarline(_ barline: MXLBarline) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = barline.id {
            attributes.append((.id, id))
        }

        attributes.append((.location, formatRightLeftMiddle(barline.location)))

        if let segno = barline.segnoAttribute {
            attributes.append((.segno, segno))
        }

        if let coda = barline.codaAttribute {
            attributes.append((.coda, coda))
        }

        if let divisions = barline.divisions {
            attributes.append((.divisions, String(divisions.intValue)))
        }

        openElement(.barline,
                    attributes: attributes)

        if let barStyle = barline.barStyle {
            writeBarlineStyleColor(barStyle)
        }

        // The footnote, level, wavy-line, segno, coda, and fermata elements are
        // written in a later phase.

        if let ending = barline.ending {
            writeEnding(ending)
        }

        if let repeatMark = barline.repeat {
            writeRepeat(repeatMark)
        }

        closeElement()
    }

    internal mutating func writeBarlineStyleColor(_ styleColor: MXLBarline.StyleColor) {
        writeTextElement(.barStyle,
                         _formatBarlineStyleColorStyle(styleColor.value),
                         attributes: colorAttributes(styleColor.color))
    }

    internal mutating func writeEnding(_ ending: MXLEnding) {
        var attributes: [(MXLAttributeName, String)] = [(.number, ending.number.map(String.init).joined(separator: ",")),
                                                        (.type, formatStartStopDiscontinue(ending.kind))]

        attributes += positionAttributes(ending.position)
        attributes += fontAttributes(ending.font)
        attributes += colorAttributes(ending.color)

        if let printsObject = ending.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        if let system = ending.system {
            attributes.append((.system, formatSystemRelation(system)))
        }

        if let endLength = ending.endLength {
            attributes.append((.endLength, formatDecimal(endLength)))
        }

        if let textX = ending.textX {
            attributes.append((.textX, formatDecimal(textX)))
        }

        if let textY = ending.textY {
            attributes.append((.textY, formatDecimal(textY)))
        }

        writeTextElement(.ending,
                         ending.value,
                         attributes: attributes)
    }

    internal mutating func writeRepeat(_ repeatMark: MXLRepeat) {
        var attributes: [(MXLAttributeName, String)] = [(.direction, _formatRepeatDirection(repeatMark.direction))]

        if let times = repeatMark.times {
            attributes.append((.times, String(times)))
        }

        if let isAfterJump = repeatMark.isAfterJump {
            attributes.append((.afterJump, formatYesNo(isAfterJump)))
        }

        attributes.append((.winged, formatWinged(repeatMark.winged)))

        writeEmptyElement(.repeat,
                          attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatBarlineStyleColorStyle(_ value: MXLBarline.StyleColor.Style) -> String {
        switch value {
        case .dashed:
            "dashed"

        case .dotted:
            "dotted"

        case .heavy:
            "heavy"

        case .heavyHeavy:
            "heavy-heavy"

        case .heavyLight:
            "heavy-light"

        case .invisible:
            "none"

        case .lightHeavy:
            "light-heavy"

        case .lightLight:
            "light-light"

        case .regular:
            "regular"

        case .short:
            "short"

        case .tick:
            "tick"
        }
    }

    private func _formatRepeatDirection(_ value: MXLRepeat.Direction) -> String {
        switch value {
        case .backward:
            "backward"

        case .forward:
            "forward"
        }
    }
}
