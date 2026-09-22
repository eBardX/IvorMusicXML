// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeArrow(_ arrow: MXLArrow) {
        var attributes = positionAttributes(arrow.position)

        attributes += fontAttributes(arrow.font)
        attributes += colorAttributes(arrow.color)

        if let placement = arrow.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let smufl = arrow.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        openElement(.arrow,
                    attributes: attributes)

        writeArrowContent(arrow.content)

        closeElement()
    }

    internal mutating func writeArrowContent(_ content: MXLArrow.Content) {
        switch content {
        case let .arrowDirection(direction, style, hasArrowhead):
            writeTextElement(.arrowDirection, _formatArrowDirection(direction))

            if let style {
                writeTextElement(.arrowStyle, _formatArrowStyle(style))
            }

            if hasArrowhead {
                writeEmptyElement(.arrowhead)
            }

        case let .circularArrow(circularArrow):
            writeTextElement(.circularArrow, _formatCircularArrow(circularArrow))
        }
    }

    internal mutating func writeBend(_ bend: MXLBend) {
        var attributes: [(MXLAttributeName, String)] = []

        if let shape = bend.shape {
            attributes.append((.shape, _formatBendShape(shape)))
        }

        attributes += positionAttributes(bend.position)
        attributes += fontAttributes(bend.font)
        attributes += colorAttributes(bend.color)
        attributes += bendSoundAttributes(bend.sound)

        openElement(.bend,
                    attributes: attributes)

        writeTextElement(.bendAlter, formatDecimal(bend.alter))

        if let content = bend.content {
            switch content {
            case .preBend:
                writeEmptyElement(.preBend)

            case let .release(release):
                writeRelease(release)
            }
        }

        if let withBar = bend.withBar {
            writePlacementText(.withBar, withBar)
        }

        closeElement()
    }

    internal mutating func writeFingering(_ fingering: MXLFingering) {
        var attributes: [(MXLAttributeName, String)] = []

        if let isSubstitute = fingering.isSubstitute {
            attributes.append((.substitution, formatYesNo(isSubstitute)))
        }

        if let isAlternate = fingering.isAlternate {
            attributes.append((.alternate, formatYesNo(isAlternate)))
        }

        attributes += positionAttributes(fingering.position)
        attributes += fontAttributes(fingering.font)
        attributes += colorAttributes(fingering.color)

        if let placement = fingering.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(.fingering,
                         fingering.value,
                         attributes: attributes)
    }

    internal mutating func writeFret(_ fret: MXLFret) {
        writeTextElement(.fret,
                         String(fret.value),
                         attributes: fontAttributes(fret.font) + colorAttributes(fret.color))
    }

    internal mutating func writeHammerOnPullOff(_ name: MXLElementName,
                                                _ hammerOnPullOff: MXLHammerOnPullOff) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStop(hammerOnPullOff.kind)),
                                                        (.number, String(hammerOnPullOff.number.uintValue))]

        attributes += positionAttributes(hammerOnPullOff.position)
        attributes += fontAttributes(hammerOnPullOff.font)
        attributes += colorAttributes(hammerOnPullOff.color)

        if let placement = hammerOnPullOff.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(name,
                         hammerOnPullOff.value,
                         attributes: attributes)
    }

    internal mutating func writeHandbell(_ handbell: MXLHandbell) {
        var attributes = positionAttributes(handbell.position)

        attributes += fontAttributes(handbell.font)
        attributes += colorAttributes(handbell.color)

        if let placement = handbell.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(.handbell,
                         _formatHandbellValue(handbell.value),
                         attributes: attributes)
    }

    internal mutating func writeHarmonClosed(_ harmonClosed: MXLHarmonClosed) {
        var attributes: [(MXLAttributeName, String)] = []

        if let location = harmonClosed.location {
            attributes.append((.location, _formatHarmonClosedLocation(location)))
        }

        writeTextElement(.harmonClosed,
                         _formatHarmonClosedValue(harmonClosed.value),
                         attributes: attributes)
    }

    internal mutating func writeHarmonic(_ harmonic: MXLHarmonic) {
        var attributes: [(MXLAttributeName, String)] = []

        if let printsObject = harmonic.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        attributes += positionAttributes(harmonic.position)
        attributes += fontAttributes(harmonic.font)
        attributes += colorAttributes(harmonic.color)

        if let placement = harmonic.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        openElement(.harmonic,
                    attributes: attributes)

        _writeHarmonicContent(harmonic.content)
        _writeHarmonicContent2(harmonic.content2)

        closeElement()
    }

    internal mutating func writeHarmonMute(_ harmonMute: MXLHarmonMute) {
        var attributes = positionAttributes(harmonMute.position)

        attributes += fontAttributes(harmonMute.font)
        attributes += colorAttributes(harmonMute.color)

        if let placement = harmonMute.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        openElement(.harmonMute,
                    attributes: attributes)

        writeHarmonClosed(harmonMute.harmonClosed)

        closeElement()
    }

    internal mutating func writeHeelToe(_ name: MXLElementName,
                                        _ heelToe: MXLHeelToe) {
        var attributes = positionAttributes(heelToe.position)

        attributes += fontAttributes(heelToe.font)
        attributes += colorAttributes(heelToe.color)

        if let placement = heelToe.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes.append((.substitution, formatYesNo(heelToe.isSubstitute)))

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writeHole(_ hole: MXLHole) {
        var attributes = positionAttributes(hole.position)

        attributes += fontAttributes(hole.font)
        attributes += colorAttributes(hole.color)

        if let placement = hole.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        openElement(.hole,
                    attributes: attributes)

        if let kind = hole.kind {
            writeTextElement(.holeType, kind)
        }

        writeHoleClosed(hole.closed)

        writeTextElement(.holeShape, hole.shape)

        closeElement()
    }

    internal mutating func writeHoleClosed(_ closed: MXLHole.Closed) {
        var attributes: [(MXLAttributeName, String)] = []

        if let location = closed.location {
            attributes.append((.location, _formatHoleClosedLocation(location)))
        }

        writeTextElement(.holeClosed,
                         _formatHoleClosedValue(closed.value),
                         attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatArrowDirection(_ value: MXLArrow.Direction) -> String {
        switch value {
        case .down:
            "down"

        case .left:
            "left"

        case .leftRight:
            "left right"

        case .northeast:
            "northeast"

        case .northeastSouthwest:
            "northeast southwest"

        case .northwest:
            "northwest"

        case .northwestSoutheast:
            "northwest southeast"

        case .other:
            "other"

        case .right:
            "right"

        case .southeast:
            "southeast"

        case .southwest:
            "southwest"

        case .up:
            "up"

        case .upDown:
            "up down"
        }
    }

    private func _formatArrowStyle(_ value: MXLArrow.Style) -> String {
        switch value {
        case .combined:
            "combined"

        case .double:
            "double"

        case .filled:
            "filled"

        case .hollow:
            "hollow"

        case .other:
            "other"

        case .paired:
            "paired"

        case .single:
            "single"
        }
    }

    private func _formatBendShape(_ value: MXLBend.Shape) -> String {
        switch value {
        case .angled:
            "angled"

        case .curved:
            "curved"
        }
    }

    private func _formatCircularArrow(_ value: MXLCircularArrow) -> String {
        switch value {
        case .anticlockwise:
            "anticlockwise"

        case .clockwise:
            "clockwise"
        }
    }

    private func _formatHandbellValue(_ value: MXLHandbell.Value) -> String {
        switch value {
        case .belltree:
            "belltree"

        case .damp:
            "damp"

        case .echo:
            "echo"

        case .gyro:
            "gyro"

        case .handMartellato:
            "hand martellato"

        case .malletLift:
            "mallet lift"

        case .malletTable:
            "mallet table"

        case .martellato:
            "martellato"

        case .martellatoLift:
            "martellato lift"

        case .mutedMartellato:
            "muted martellato"

        case .pluckLift:
            "pluck lift"

        case .swing:
            "swing"
        }
    }

    private func _formatHarmonClosedLocation(_ value: MXLHarmonClosed.Location) -> String {
        switch value {
        case .bottom:
            "bottom"

        case .left:
            "left"

        case .right:
            "right"

        case .top:
            "top"
        }
    }

    private func _formatHarmonClosedValue(_ value: MXLHarmonClosed.Value) -> String {
        switch value {
        case .half:
            "half"

        case .no:
            "no"

        case .yes:
            "yes"
        }
    }

    private func _formatHoleClosedLocation(_ value: MXLHole.Closed.Location) -> String {
        switch value {
        case .bottom:
            "bottom"

        case .left:
            "left"

        case .right:
            "right"

        case .top:
            "top"
        }
    }

    private func _formatHoleClosedValue(_ value: MXLHole.Closed.Value) -> String {
        switch value {
        case .half:
            "half"

        case .no:
            "no"

        case .yes:
            "yes"
        }
    }

    private mutating func _writeHarmonicContent(_ content: MXLHarmonic.Content?) {
        guard let content
        else { return }

        switch content {
        case .artificial:
            writeEmptyElement(.artificial)

        case .natural:
            writeEmptyElement(.natural)
        }
    }

    private mutating func _writeHarmonicContent2(_ content: MXLHarmonic.Content2?) {
        guard let content
        else { return }

        switch content {
        case .basePitch:
            writeEmptyElement(.basePitch)

        case .soundingPitch:
            writeEmptyElement(.soundingPitch)

        case .touchingPitch:
            writeEmptyElement(.touchingPitch)
        }
    }
}
