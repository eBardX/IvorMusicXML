// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeAccidentalMark(_ mark: MXLAccidentalMark) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = mark.id {
            attributes.append((.id, id))
        }

        attributes += levelDisplayAttributes(mark.levelDisplay)
        attributes += positionAttributes(mark.position)
        attributes += fontAttributes(mark.font)
        attributes += colorAttributes(mark.color)

        if let placement = mark.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let smufl = mark.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.accidentalMark,
                         formatAccidentalValue(mark.value),
                         attributes: attributes)
    }

    internal mutating func writeArpeggiate(_ arpeggiate: MXLArpeggiate) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = arpeggiate.id {
            attributes.append((.id, id))
        }

        if let number = arpeggiate.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let direction = arpeggiate.direction {
            attributes.append((.direction, formatUpDown(direction)))
        }

        if let isUnbroken = arpeggiate.isUnbroken {
            attributes.append((.unbroken, formatYesNo(isUnbroken)))
        }

        attributes += positionAttributes(arpeggiate.position)

        if let placement = arpeggiate.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += colorAttributes(arpeggiate.color)

        writeEmptyElement(.arpeggiate,
                          attributes: attributes)
    }

    internal mutating func writeArticulations(_ articulations: MXLArticulations) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = articulations.id {
            attributes.append((.id, id))
        }

        openElement(.articulations,
                    attributes: attributes)

        for item in articulations.items {
            writeArticulationsItem(item)
        }

        closeElement()
    }

    internal mutating func writeArticulationsItem(_ item: MXLArticulations.Item) {
        switch item {
        case let .accent(position, font, color, placement):
            writePlacementStyle(.accent, position: position, font: font, color: color, placement: placement)

        case let .breathMark(breathMark):
            writeBreathMark(breathMark)

        case let .caesura(caesura):
            writeCaesura(caesura)

        case let .detachedLegato(position, font, color, placement):
            writePlacementStyle(.detachedLegato, position: position, font: font, color: color, placement: placement)

        case let .doit(emptyLine):
            writeEmptyLine(.doit, emptyLine)

        case let .falloff(emptyLine):
            writeEmptyLine(.falloff, emptyLine)

        case let .otherArticulation(text):
            writeOtherPlacementText(.otherArticulation, text)

        case let .plop(emptyLine):
            writeEmptyLine(.plop, emptyLine)

        case let .scoop(emptyLine):
            writeEmptyLine(.scoop, emptyLine)

        case let .softAccent(position, font, color, placement):
            writePlacementStyle(.softAccent, position: position, font: font, color: color, placement: placement)

        case let .spiccato(position, font, color, placement):
            writePlacementStyle(.spiccato, position: position, font: font, color: color, placement: placement)

        case let .staccatissimo(position, font, color, placement):
            writePlacementStyle(.staccatissimo, position: position, font: font, color: color, placement: placement)

        case let .staccato(position, font, color, placement):
            writePlacementStyle(.staccato, position: position, font: font, color: color, placement: placement)

        case let .stress(position, font, color, placement):
            writePlacementStyle(.stress, position: position, font: font, color: color, placement: placement)

        case let .strongAccent(strongAccent):
            writeStrongAccent(strongAccent)

        case let .tenuto(position, font, color, placement):
            writePlacementStyle(.tenuto, position: position, font: font, color: color, placement: placement)

        case let .unstress(position, font, color, placement):
            writePlacementStyle(.unstress, position: position, font: font, color: color, placement: placement)
        }
    }

    internal mutating func writeBreathMark(_ breathMark: MXLBreathMark) {
        var attributes = positionAttributes(breathMark.position)

        attributes += fontAttributes(breathMark.font)
        attributes += colorAttributes(breathMark.color)

        if let placement = breathMark.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(.breathMark,
                         _formatBreathMarkValue(breathMark.value),
                         attributes: attributes)
    }

    internal mutating func writeCaesura(_ caesura: MXLCaesura) {
        var attributes = positionAttributes(caesura.position)

        attributes += fontAttributes(caesura.font)
        attributes += colorAttributes(caesura.color)

        if let placement = caesura.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(.caesura,
                         _formatCaesuraValue(caesura.value),
                         attributes: attributes)
    }

    internal mutating func writeFermata(_ fermata: MXLFermata) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = fermata.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatUprightInverted(fermata.kind)))
        attributes += positionAttributes(fermata.position)
        attributes += fontAttributes(fermata.font)
        attributes += colorAttributes(fermata.color)

        writeTextElement(.fermata,
                         _formatFermataShape(fermata.value),
                         attributes: attributes)
    }

    internal mutating func writeGlissando(_ glissando: MXLGlissando) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = glissando.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStop(glissando.kind)))
        attributes.append((.number, String(glissando.number.uintValue)))

        if let lineKind = glissando.lineKind {
            attributes.append((.lineType, formatLineKind(lineKind)))
        }

        if let dashLength = glissando.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = glissando.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(glissando.position)
        attributes += fontAttributes(glissando.font)
        attributes += colorAttributes(glissando.color)

        writeTextElement(.glissando,
                         glissando.value,
                         attributes: attributes)
    }

    internal mutating func writeNonArpeggiate(_ nonArpeggiate: MXLNonArpeggiate) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = nonArpeggiate.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatTopBottom(nonArpeggiate.kind)))

        if let number = nonArpeggiate.number {
            attributes.append((.number, String(number.uintValue)))
        }

        attributes += positionAttributes(nonArpeggiate.position)

        if let placement = nonArpeggiate.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += colorAttributes(nonArpeggiate.color)

        writeEmptyElement(.nonArpeggiate,
                          attributes: attributes)
    }

    internal mutating func writeNotations(_ notations: MXLNotations) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = notations.id {
            attributes.append((.id, id))
        }

        if let printsObject = notations.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        openElement(.notations,
                    attributes: attributes)

        // The footnote and level children are written in a later phase.

        for item in notations.items {
            writeNotationsItem(item)
        }

        closeElement()
    }

    internal mutating func writeNotationsItem(_ item: MXLNotations.Item) {
        switch item {
        case let .accidentalMark(accidentalMark):
            writeAccidentalMark(accidentalMark)

        case let .arpeggiate(arpeggiate):
            writeArpeggiate(arpeggiate)

        case let .articulations(articulations):
            writeArticulations(articulations)

        case let .dynamics(dynamics):
            writeDynamics(dynamics)

        case let .fermata(fermata):
            writeFermata(fermata)

        case let .glissando(glissando):
            writeGlissando(glissando)

        case let .nonArpeggiate(nonArpeggiate):
            writeNonArpeggiate(nonArpeggiate)

        case let .ornaments(ornaments):
            writeOrnaments(ornaments)

        case let .otherNotation(otherNotation):
            writeOtherNotation(otherNotation)

        case let .slide(slide):
            writeSlide(slide)

        case let .slur(slur):
            writeSlur(slur)

        case let .technical(technical):
            writeTechnical(technical)

        case let .tied(tied):
            writeTied(tied)

        case let .tuplet(tuplet):
            writeTuplet(tuplet)
        }
    }

    internal mutating func writeOtherNotation(_ otherNotation: MXLOtherNotation) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = otherNotation.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStopSingle(otherNotation.kind)))
        attributes.append((.number, String(otherNotation.number.uintValue)))

        if let printsObject = otherNotation.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        attributes += positionAttributes(otherNotation.position)
        attributes += fontAttributes(otherNotation.font)
        attributes += colorAttributes(otherNotation.color)

        if let placement = otherNotation.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let smufl = otherNotation.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.otherNotation,
                         otherNotation.value,
                         attributes: attributes)
    }

    internal mutating func writeSlide(_ slide: MXLSlide) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = slide.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStop(slide.kind)))
        attributes.append((.number, String(slide.number.uintValue)))

        if let lineKind = slide.lineKind {
            attributes.append((.lineType, formatLineKind(lineKind)))
        }

        if let dashLength = slide.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = slide.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(slide.position)
        attributes += fontAttributes(slide.font)
        attributes += colorAttributes(slide.color)
        attributes += bendSoundAttributes(slide.bendSound)

        writeTextElement(.slide,
                         slide.value,
                         attributes: attributes)
    }

    internal mutating func writeSlur(_ slur: MXLSlur) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = slur.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStopContinue(slur.kind)))
        attributes.append((.number, String(slur.number.uintValue)))

        if let lineKind = slur.lineKind {
            attributes.append((.lineType, formatLineKind(lineKind)))
        }

        if let dashLength = slur.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = slur.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(slur.position)

        if let placement = slur.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let orientation = slur.orientation {
            attributes.append((.orientation, formatOverUnder(orientation)))
        }

        attributes += _bezierAttributes(bezierX: slur.bezierX,
                                        bezierY: slur.bezierY,
                                        bezierX2: slur.bezierX2,
                                        bezierY2: slur.bezierY2,
                                        bezierOffset: slur.bezierOffset,
                                        bezierOffset2: slur.bezierOffset2)
        attributes += colorAttributes(slur.color)

        writeEmptyElement(.slur,
                          attributes: attributes)
    }

    internal mutating func writeStrongAccent(_ strongAccent: MXLStrongAccent) {
        var attributes = positionAttributes(strongAccent.position)

        attributes += fontAttributes(strongAccent.font)
        attributes += colorAttributes(strongAccent.color)

        if let placement = strongAccent.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes.append((.type, formatUpDown(strongAccent.kind)))

        writeEmptyElement(.strongAccent,
                          attributes: attributes)
    }

    internal mutating func writeTied(_ tied: MXLTied) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = tied.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, _formatTiedKind(tied.kind)))

        if let number = tied.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let lineKind = tied.lineKind {
            attributes.append((.lineType, formatLineKind(lineKind)))
        }

        if let dashLength = tied.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = tied.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(tied.position)

        if let placement = tied.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let orientation = tied.orientation {
            attributes.append((.orientation, formatOverUnder(orientation)))
        }

        attributes += _bezierAttributes(bezierX: tied.bezierX,
                                        bezierY: tied.bezierY,
                                        bezierX2: tied.bezierX2,
                                        bezierY2: tied.bezierY2,
                                        bezierOffset: tied.bezierOffset,
                                        bezierOffset2: tied.bezierOffset2)
        attributes += colorAttributes(tied.color)

        writeEmptyElement(.tied,
                          attributes: attributes)
    }

    internal mutating func writeTuplet(_ tuplet: MXLTuplet) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = tuplet.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStop(tuplet.kind)))

        if let number = tuplet.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let hasBracket = tuplet.hasBracket {
            attributes.append((.bracket, formatYesNo(hasBracket)))
        }

        if let showNumber = tuplet.showNumber {
            attributes.append((.showNumber, formatShowTuplet(showNumber)))
        }

        if let showType = tuplet.showType {
            attributes.append((.showType, formatShowTuplet(showType)))
        }

        if let lineShape = tuplet.lineShape {
            attributes.append((.lineShape, formatLineShape(lineShape)))
        }

        attributes += positionAttributes(tuplet.position)

        if let placement = tuplet.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        guard tuplet.actual != nil || tuplet.normal != nil
        else {
            writeEmptyElement(.tuplet,
                              attributes: attributes)

            return
        }

        openElement(.tuplet,
                    attributes: attributes)

        if let actual = tuplet.actual {
            _writeTupletPortion(.tupletActual, actual)
        }

        if let normal = tuplet.normal {
            _writeTupletPortion(.tupletNormal, normal)
        }

        closeElement()
    }

    // MARK: Private Instance Methods

    private func _bezierAttributes(bezierX: MXLTenths?,
                                   bezierY: MXLTenths?,
                                   bezierX2: MXLTenths?,
                                   bezierY2: MXLTenths?,
                                   bezierOffset: MXLDivisions?,
                                   bezierOffset2: MXLDivisions?) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let bezierX {
            attributes.append((.bezierX, formatDecimal(bezierX)))
        }

        if let bezierY {
            attributes.append((.bezierY, formatDecimal(bezierY)))
        }

        if let bezierX2 {
            attributes.append((.bezierX2, formatDecimal(bezierX2)))
        }

        if let bezierY2 {
            attributes.append((.bezierY2, formatDecimal(bezierY2)))
        }

        if let bezierOffset {
            attributes.append((.bezierOffset, String(bezierOffset.intValue)))
        }

        if let bezierOffset2 {
            attributes.append((.bezierOffset2, String(bezierOffset2.intValue)))
        }

        return attributes
    }

    private func _formatBreathMarkValue(_ value: MXLBreathMark.Value) -> String {
        switch value {
        case .comma:
            "comma"

        case .empty:
            ""

        case .salzedo:
            "salzedo"

        case .tick:
            "tick"

        case .upbow:
            "upbow"
        }
    }

    private func _formatCaesuraValue(_ value: MXLCaesura.Value) -> String {
        switch value {
        case .curved:
            "curved"

        case .empty:
            ""

        case .normal:
            "normal"

        case .short:
            "short"

        case .single:
            "single"

        case .thick:
            "thick"
        }
    }

    private func _formatFermataShape(_ value: MXLFermata.Shape) -> String {
        switch value {
        case .angled:
            "angled"

        case .curlew:
            "curlew"

        case .doubleAngled:
            "double-angled"

        case .doubleDot:
            "double-dot"

        case .doubleSquare:
            "double-square"

        case .empty:
            ""

        case .halfCurve:
            "half-curve"

        case .normal:
            "normal"

        case .square:
            "square"
        }
    }

    private func _formatTiedKind(_ value: MXLTied.Kind) -> String {
        switch value {
        case .continue:
            "continue"

        case .letRing:
            "let-ring"

        case .start:
            "start"

        case .stop:
            "stop"
        }
    }

    private mutating func _writeTupletPortion(_ name: MXLElementName,
                                              _ portion: MXLTuplet.Portion) {
        openElement(name)

        if let number = portion.number {
            writeTextElement(.tupletNumber,
                             String(number.value),
                             attributes: fontAttributes(number.font) + colorAttributes(number.color))
        }

        if let kind = portion.kind {
            writeTextElement(.tupletType,
                             formatNoteKindValue(kind.value),
                             attributes: fontAttributes(kind.font) + colorAttributes(kind.color))
        }

        for dot in portion.dot {
            writeEmptyElement(.tupletDot,
                              attributes: fontAttributes(dot.font) + colorAttributes(dot.color))
        }

        closeElement()
    }
}
