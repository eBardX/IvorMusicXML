// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal func formatTipDirection(_ value: MXLTipDirection) -> String {
        switch value {
        case .down:
            "down"

        case .left:
            "left"

        case .northeast:
            "northeast"

        case .northwest:
            "northwest"

        case .right:
            "right"

        case .southeast:
            "southeast"

        case .southwest:
            "southwest"

        case .up:
            "up"
        }
    }

    internal mutating func writeRelease(_ release: MXLRelease) {
        var attributes: [(MXLAttributeName, String)] = []

        if let offset = release.offset {
            attributes.append((.offset, String(offset.intValue)))
        }

        writeEmptyElement(.release,
                          attributes: attributes)
    }

    internal mutating func writeString(_ string: MXLString) {
        var attributes = positionAttributes(string.position)

        attributes += fontAttributes(string.font)
        attributes += colorAttributes(string.color)

        if let placement = string.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(.string,
                         String(string.value),
                         attributes: attributes)
    }

    internal mutating func writeStringMute(_ stringMute: MXLStringMute) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = stringMute.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, _formatOnOff(stringMute.isOn)))
        attributes += positionAttributes(stringMute.position)
        attributes += fontAttributes(stringMute.font)
        attributes += colorAttributes(stringMute.color)

        if let halign = stringMute.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = stringMute.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        writeEmptyElement(.stringMute,
                          attributes: attributes)
    }

    internal mutating func writeTap(_ tap: MXLTap) {
        var attributes: [(MXLAttributeName, String)] = []

        if let hand = tap.hand {
            attributes.append((.hand, _formatTapHand(hand)))
        }

        attributes += positionAttributes(tap.position)
        attributes += fontAttributes(tap.font)
        attributes += colorAttributes(tap.color)

        if let placement = tap.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(.tap,
                         tap.value,
                         attributes: attributes)
    }

    internal mutating func writeTechnical(_ technical: MXLTechnical) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = technical.id {
            attributes.append((.id, id))
        }

        openElement(.technical,
                    attributes: attributes)

        for item in technical.items {
            writeTechnicalItem(item)
        }

        closeElement()
    }

    internal mutating func writeTechnicalItem(_ item: MXLTechnical.Item) {
        switch item {
        case let .arrow(arrow):
            writeArrow(arrow)

        case let .bend(bend):
            writeBend(bend)

        case let .brassBend(position, font, color, placement):
            writePlacementStyle(.brassBend, position: position, font: font, color: color, placement: placement)

        case let .doubleTongue(position, font, color, placement):
            writePlacementStyle(.doubleTongue, position: position, font: font, color: color, placement: placement)

        case let .downBow(position, font, color, placement):
            writePlacementStyle(.downBow, position: position, font: font, color: color, placement: placement)

        case let .fingering(fingering):
            writeFingering(fingering)

        case let .fingernails(position, font, color, placement):
            writePlacementStyle(.fingernails, position: position, font: font, color: color, placement: placement)

        case let .flip(position, font, color, placement):
            writePlacementStyle(.flip, position: position, font: font, color: color, placement: placement)

        case let .fret(fret):
            writeFret(fret)

        case let .golpe(position, font, color, placement):
            writePlacementStyle(.golpe, position: position, font: font, color: color, placement: placement)

        case let .halfMuted(position, font, color, placement, smufl):
            writePlacementStyle(.halfMuted, position: position, font: font, color: color, placement: placement, smufl: smufl)

        case let .hammerOn(hammerOn):
            writeHammerOnPullOff(.hammerOn, hammerOn)

        case let .handbell(handbell):
            writeHandbell(handbell)

        case let .harmonMute(harmonMute):
            writeHarmonMute(harmonMute)

        case let .harmonic(harmonic):
            writeHarmonic(harmonic)

        default:
            writeTechnicalItemTail(item)
        }
    }

    internal mutating func writeTechnicalItemTail(_ item: MXLTechnical.Item) {
        switch item {
        case let .heel(heelToe):
            writeHeelToe(.heel, heelToe)

        case let .hole(hole):
            writeHole(hole)

        case let .open(position, font, color, placement, smufl):
            writePlacementStyle(.open, position: position, font: font, color: color, placement: placement, smufl: smufl)

        case let .openString(position, font, color, placement):
            writePlacementStyle(.openString, position: position, font: font, color: color, placement: placement)

        case let .otherTechnical(text):
            writeOtherPlacementText(.otherTechnical, text)

        case let .pluck(text):
            writePlacementText(.pluck, text)

        case let .pullOff(pullOff):
            writeHammerOnPullOff(.pullOff, pullOff)

        case let .smear(position, font, color, placement):
            writePlacementStyle(.smear, position: position, font: font, color: color, placement: placement)

        case let .snapPizzicato(position, font, color, placement):
            writePlacementStyle(.snapPizzicato, position: position, font: font, color: color, placement: placement)

        case let .stopped(position, font, color, placement, smufl):
            writePlacementStyle(.stopped, position: position, font: font, color: color, placement: placement, smufl: smufl)

        case let .string(string):
            writeString(string)

        case let .tap(tap):
            writeTap(tap)

        case let .thumbPosition(position, font, color, placement):
            writePlacementStyle(.thumbPosition, position: position, font: font, color: color, placement: placement)

        case let .toe(heelToe):
            writeHeelToe(.toe, heelToe)

        case let .tripleTongue(position, font, color, placement):
            writePlacementStyle(.tripleTongue, position: position, font: font, color: color, placement: placement)

        case let .upBow(position, font, color, placement):
            writePlacementStyle(.upBow, position: position, font: font, color: color, placement: placement)

        default:
            // The remaining alternatives are written by writeTechnicalItem.
            break
        }
    }

    // MARK: Private Instance Methods

    private func _formatOnOff(_ isOn: Bool) -> String {
        isOn ? "on" : "off"
    }

    private func _formatTapHand(_ value: MXLTap.Hand) -> String {
        switch value {
        case .left:
            "left"

        case .right:
            "right"
        }
    }
}
