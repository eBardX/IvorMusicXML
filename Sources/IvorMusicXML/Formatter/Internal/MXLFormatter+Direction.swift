// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeAccordionRegistration(_ registration: MXLAccordionRegistration) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = registration.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(registration.position)
        attributes += fontAttributes(registration.font)
        attributes += colorAttributes(registration.color)

        if let halign = registration.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = registration.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        openElement(.accordionRegistration,
                    attributes: attributes)

        if registration.hasHighDot {
            writeEmptyElement(.accordionHigh)
        }

        if let accordionMiddle = registration.accordionMiddle {
            writeTextElement(.accordionMiddle, String(accordionMiddle.uintValue))
        }

        if registration.hasLowDot {
            writeEmptyElement(.accordionLow)
        }

        closeElement()
    }

    internal mutating func writeBracket(_ bracket: MXLBracket) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = bracket.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStopContinue(bracket.kind)))

        if let number = bracket.number {
            attributes.append((.number, String(number.uintValue)))
        }

        attributes.append((.lineEnd, formatLineEnd(bracket.lineEnd)))

        if let endLength = bracket.endLength {
            attributes.append((.endLength, formatDecimal(endLength)))
        }

        if let lineKind = bracket.lineKind {
            attributes.append((.lineType, formatLineKind(lineKind)))
        }

        if let dashLength = bracket.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = bracket.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(bracket.position)
        attributes += colorAttributes(bracket.color)

        writeEmptyElement(.bracket,
                          attributes: attributes)
    }

    internal mutating func writeCoda(_ coda: MXLCoda) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = coda.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(coda.position)
        attributes += fontAttributes(coda.font)
        attributes += colorAttributes(coda.color)

        if let halign = coda.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = coda.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let smufl = coda.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeEmptyElement(.coda,
                          attributes: attributes)
    }

    internal mutating func writeDashes(_ dashes: MXLDashes) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = dashes.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStopContinue(dashes.kind)))

        if let number = dashes.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let dashLength = dashes.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = dashes.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(dashes.position)
        attributes += colorAttributes(dashes.color)

        writeEmptyElement(.dashes,
                          attributes: attributes)
    }

    internal mutating func writeDirection(_ direction: MXLDirection) {
        openElement(.direction,
                    attributes: _directionAttributes(direction))

        for kind in direction.kind {
            writeDirectionKind(kind)
        }

        if let offset = direction.offset {
            writeOffset(offset)
        }

        // The footnote and level children are written in a later phase.

        if let voice = direction.voice {
            writeTextElement(.voice, voice.voice)
        }

        if let staff = direction.staff {
            writeTextElement(.staff, String(staff.uintValue))
        }

        if let sound = direction.sound {
            writeSound(sound)
        }

        if let listening = direction.listening {
            writeListening(listening)
        }

        closeElement()
    }

    internal mutating func writeDirectionKind(_ kind: MXLDirection.Kind) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = kind.id {
            attributes.append((.id, id))
        }

        openElement(.directionType,
                    attributes: attributes)

        writeDirectionKindContent(kind.content)

        closeElement()
    }

    internal mutating func writeDirectionKindContent(_ content: MXLDirection.Kind.Content) {
        switch content {
        case let .accordionRegistration(registration):
            writeAccordionRegistration(registration)

        case let .bracket(bracket):
            writeBracket(bracket)

        case let .coda(coda):
            for coda in coda {
                writeCoda(coda)
            }

        case let .damp(damp):
            writeEmptyPrintStyleAlignID(.damp, damp)

        case let .dampAll(dampAll):
            writeEmptyPrintStyleAlignID(.dampAll, dampAll)

        case let .dashes(dashes):
            writeDashes(dashes)

        case let .dynamics(dynamics):
            for dynamics in dynamics {
                writeDynamics(dynamics)
            }

        case let .eyeglasses(eyeglasses):
            writeEmptyPrintStyleAlignID(.eyeglasses, eyeglasses)

        case let .harpPedals(harpPedals):
            writeHarpPedals(harpPedals)

        case let .image(image):
            writeImage(.image, image)

        case let .metronome(metronome):
            writeMetronome(metronome)

        case let .octaveShift(octaveShift):
            writeOctaveShift(octaveShift)

        case let .otherDirection(otherDirection):
            writeOtherDirection(otherDirection)

        case let .pedal(pedal):
            writePedal(pedal)

        case let .percussion(percussion):
            for percussion in percussion {
                writePercussion(percussion)
            }

        case let .principalVoice(principalVoice):
            writePrincipalVoice(principalVoice)

        case let .rehearsal(rehearsal):
            for rehearsal in rehearsal {
                writeFormattedTextID(.rehearsal, rehearsal)
            }

        case let .scordatura(scordatura):
            writeScordatura(scordatura)

        case let .segno(segno):
            for segno in segno {
                writeSegno(segno)
            }

        case let .staffDivide(staffDivide):
            writeStaffDivide(staffDivide)

        case let .stringMute(stringMute):
            writeStringMute(stringMute)

        case let .symbol(symbol):
            writeFormattedSymbolID(.symbol, symbol)

        case let .wedge(wedge):
            writeWedge(wedge)

        case let .words(words):
            writeFormattedTextID(.words, words)
        }
    }

    internal mutating func writeDynamics(_ dynamics: MXLDynamics) {
        openElement(.dynamics,
                    attributes: _dynamicsAttributes(dynamics))

        for item in dynamics.items {
            writeDynamicsItem(item)
        }

        closeElement()
    }

    // MARK: Private Instance Methods

    private func _directionAttributes(_ direction: MXLDirection) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = direction.id {
            attributes.append((.id, id))
        }

        if let placement = direction.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let isDirective = direction.isDirective {
            attributes.append((.directive, formatYesNo(isDirective)))
        }

        if let system = direction.system {
            attributes.append((.system, formatSystemRelation(system)))
        }

        return attributes
    }

    private func _dynamicsAttributes(_ dynamics: MXLDynamics) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = dynamics.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(dynamics.position)
        attributes += fontAttributes(dynamics.font)
        attributes += colorAttributes(dynamics.color)

        if let halign = dynamics.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = dynamics.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let placement = dynamics.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += textDecorationAttributes(dynamics.underline, dynamics.overline, dynamics.lineThrough)

        if let enclosure = dynamics.enclosure {
            attributes.append((.enclosure, formatEnclosureShape(enclosure)))
        }

        return attributes
    }
}
