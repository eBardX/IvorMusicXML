// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeAccord(_ accord: MXLAccord) {
        openElement(.accord)

        writeTuning(accord.tuning)

        if let string = accord.string {
            writeTextElement(.string, String(string.uintValue))
        }

        closeElement()
    }

    internal mutating func writeDynamicsItem(_ item: MXLDynamics.Item) {
        switch item {
        case .f:
            writeEmptyElement(.f)

        case .ff:
            writeEmptyElement(.ff)

        case .fff:
            writeEmptyElement(.fff)

        case .ffff:
            writeEmptyElement(.ffff)

        case .fffff:
            writeEmptyElement(.fffff)

        case .ffffff:
            writeEmptyElement(.ffffff)

        case .fp:
            writeEmptyElement(.fp)

        case .fz:
            writeEmptyElement(.fz)

        case .mf:
            writeEmptyElement(.mf)

        case .mp:
            writeEmptyElement(.mp)

        case .n:
            writeEmptyElement(.n)

        case let .otherDynamics(otherText):
            var attributes: [(MXLAttributeName, String)] = []

            if let smufl = otherText.smufl {
                attributes.append((.smufl, smufl.stringValue))
            }

            writeTextElement(.otherDynamics,
                             otherText.value,
                             attributes: attributes)

        case .p:
            writeEmptyElement(.p)

        case .pf:
            writeEmptyElement(.pf)

        case .pp:
            writeEmptyElement(.pp)

        case .ppp:
            writeEmptyElement(.ppp)

        case .pppp:
            writeEmptyElement(.pppp)

        case .ppppp:
            writeEmptyElement(.ppppp)

        case .pppppp:
            writeEmptyElement(.pppppp)

        case .rf:
            writeEmptyElement(.rf)

        case .rfz:
            writeEmptyElement(.rfz)

        case .sf:
            writeEmptyElement(.sf)

        case .sffz:
            writeEmptyElement(.sffz)

        case .sfp:
            writeEmptyElement(.sfp)

        case .sfpp:
            writeEmptyElement(.sfpp)

        case .sfz:
            writeEmptyElement(.sfz)

        case .sfzp:
            writeEmptyElement(.sfzp)
        }
    }

    internal mutating func writeHarpPedals(_ harpPedals: MXLHarpPedals) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = harpPedals.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(harpPedals.position)
        attributes += fontAttributes(harpPedals.font)
        attributes += colorAttributes(harpPedals.color)

        if let halign = harpPedals.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = harpPedals.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        openElement(.harpPedals,
                    attributes: attributes)

        for pedalTuning in harpPedals.pedalTuning {
            writePedalTuning(pedalTuning)
        }

        closeElement()
    }

    internal mutating func writeOctaveShift(_ octaveShift: MXLOctaveShift) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = octaveShift.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatUpDownStopContinue(octaveShift.kind)))

        if let number = octaveShift.number {
            attributes.append((.number, String(number.uintValue)))
        }

        attributes.append((.size, String(octaveShift.size)))

        if let dashLength = octaveShift.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = octaveShift.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(octaveShift.position)
        attributes += fontAttributes(octaveShift.font)
        attributes += colorAttributes(octaveShift.color)

        writeEmptyElement(.octaveShift,
                          attributes: attributes)
    }

    internal mutating func writeOtherDirection(_ otherDirection: MXLOtherDirection) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = otherDirection.id {
            attributes.append((.id, id))
        }

        if let printsObject = otherDirection.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        attributes += positionAttributes(otherDirection.position)
        attributes += fontAttributes(otherDirection.font)
        attributes += colorAttributes(otherDirection.color)

        if let halign = otherDirection.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = otherDirection.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let smufl = otherDirection.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.otherDirection,
                         otherDirection.value,
                         attributes: attributes)
    }

    internal mutating func writePedal(_ pedal: MXLPedal) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = pedal.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, _formatPedalKind(pedal.kind)))

        if let number = pedal.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let usesLines = pedal.usesLines {
            attributes.append((.line, formatYesNo(usesLines)))
        }

        if let usesSigns = pedal.usesSigns {
            attributes.append((.sign, formatYesNo(usesSigns)))
        }

        if let isAbbreviated = pedal.isAbbreviated {
            attributes.append((.abbreviated, formatYesNo(isAbbreviated)))
        }

        attributes += positionAttributes(pedal.position)
        attributes += fontAttributes(pedal.font)
        attributes += colorAttributes(pedal.color)

        if let halign = pedal.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = pedal.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        writeEmptyElement(.pedal,
                          attributes: attributes)
    }

    internal mutating func writePedalTuning(_ pedalTuning: MXLPedalTuning) {
        openElement(.pedalTuning)

        writeTextElement(.pedalStep, formatStep(pedalTuning.pedalStep))
        writeTextElement(.pedalAlter, formatDecimal(pedalTuning.pedalAlter))

        closeElement()
    }

    internal mutating func writePrincipalVoice(_ principalVoice: MXLPrincipalVoice) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = principalVoice.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStop(principalVoice.kind)))
        attributes.append((.symbol, _formatPrincipalVoiceSymbol(principalVoice.symbol)))
        attributes += positionAttributes(principalVoice.position)
        attributes += fontAttributes(principalVoice.font)
        attributes += colorAttributes(principalVoice.color)

        if let halign = principalVoice.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = principalVoice.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        writeTextElement(.principalVoice,
                         principalVoice.value,
                         attributes: attributes)
    }

    internal mutating func writeScordatura(_ scordatura: MXLScordatura) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = scordatura.id {
            attributes.append((.id, id))
        }

        openElement(.scordatura,
                    attributes: attributes)

        for accord in scordatura.accord {
            writeAccord(accord)
        }

        closeElement()
    }

    internal mutating func writeSegno(_ segno: MXLSegno) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = segno.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(segno.position)
        attributes += fontAttributes(segno.font)
        attributes += colorAttributes(segno.color)

        if let halign = segno.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = segno.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let smufl = segno.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeEmptyElement(.segno,
                          attributes: attributes)
    }

    internal mutating func writeStaffDivide(_ staffDivide: MXLStaffDivide) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = staffDivide.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, _formatStaffDivideSymbol(staffDivide.kind)))
        attributes += positionAttributes(staffDivide.position)
        attributes += fontAttributes(staffDivide.font)
        attributes += colorAttributes(staffDivide.color)

        if let halign = staffDivide.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = staffDivide.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        writeEmptyElement(.staffDivide,
                          attributes: attributes)
    }

    internal mutating func writeWedge(_ wedge: MXLWedge) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = wedge.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, _formatWedgeKind(wedge.kind)))

        if let number = wedge.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let spread = wedge.spread {
            attributes.append((.spread, formatDecimal(spread)))
        }

        if let isNiente = wedge.isNiente {
            attributes.append((.niente, formatYesNo(isNiente)))
        }

        if let lineKind = wedge.lineKind {
            attributes.append((.lineType, formatLineKind(lineKind)))
        }

        if let dashLength = wedge.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = wedge.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        attributes += positionAttributes(wedge.position)
        attributes += colorAttributes(wedge.color)

        writeEmptyElement(.wedge,
                          attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatPedalKind(_ value: MXLPedal.Kind) -> String {
        switch value {
        case .change:
            "change"

        case .continue:
            "continue"

        case .discontinue:
            "discontinue"

        case .resume:
            "resume"

        case .sostenuto:
            "sostenuto"

        case .start:
            "start"

        case .stop:
            "stop"
        }
    }

    private func _formatPrincipalVoiceSymbol(_ value: MXLPrincipalVoice.Symbol) -> String {
        switch value {
        case .hauptstimme:
            "Hauptstimme"

        case .invisible:
            "none"

        case .nebenstimme:
            "Nebenstimme"

        case .plain:
            "plain"
        }
    }

    private func _formatStaffDivideSymbol(_ value: MXLStaffDivide.Symbol) -> String {
        switch value {
        case .down:
            "down"

        case .up:
            "up"

        case .upDown:
            "up-down"
        }
    }

    private func _formatWedgeKind(_ value: MXLWedge.Kind) -> String {
        switch value {
        case .continue:
            "continue"

        case .crescendo:
            "crescendo"

        case .diminuendo:
            "diminuendo"

        case .stop:
            "stop"
        }
    }
}
