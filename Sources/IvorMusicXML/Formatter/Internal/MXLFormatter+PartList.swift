// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeGroupBarline(_ barline: MXLGroupBarline) {
        writeTextElement(.groupBarline,
                         _formatGroupBarlineValue(barline.value),
                         attributes: colorAttributes(barline.color))
    }

    internal mutating func writeGroupName(_ element: MXLElementName,
                                          _ name: MXLGroupName) {
        writeTextElement(element,
                         name.value,
                         attributes: _groupNameTextAttributes(name.text))
    }

    internal mutating func writeGroupSymbol(_ symbol: MXLGroupSymbol) {
        var attributes = positionAttributes(symbol.position)

        attributes += colorAttributes(symbol.color)

        writeTextElement(.groupSymbol,
                         _formatGroupSymbolValue(symbol.value),
                         attributes: attributes)
    }

    internal mutating func writeInstrument(_ instrument: MXLInstrument) {
        writeEmptyElement(.instrument,
                          attributes: [(.id, instrument.id)])
    }

    internal mutating func writeInstrumentLink(_ instrumentLink: MXLInstrumentLink) {
        writeEmptyElement(.instrumentLink,
                          attributes: [(.id, instrumentLink.id)])
    }

    internal mutating func writeNameDisplay(_ element: MXLElementName,
                                            _ nameDisplay: MXLNameDisplay) {
        var attributes: [(MXLAttributeName, String)] = []

        if let printsObject = nameDisplay.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        openElement(element,
                    attributes: attributes)

        for item in nameDisplay.items {
            writeNameDisplayItem(item)
        }

        closeElement()
    }

    internal mutating func writeNameDisplayItem(_ item: MXLNameDisplay.Item) {
        switch item {
        case let .accidentalText(accidentalText):
            writeAccidentalText(accidentalText)

        case let .displayText(displayText):
            writeFormattedText(.displayText, displayText)
        }
    }

    internal mutating func writePartGroup(_ partGroup: MXLPartGroup) {
        openElement(.partGroup,
                    attributes: [(.type, formatStartStop(partGroup.kind)),
                                 (.number, partGroup.number)])

        if let name = partGroup.name {
            writeGroupName(.groupName, name)
        }

        if let nameDisplay = partGroup.nameDisplay {
            writeNameDisplay(.groupNameDisplay, nameDisplay)
        }

        if let abbreviation = partGroup.abbreviation {
            writeGroupName(.groupAbbreviation, abbreviation)
        }

        if let abbreviationDisplay = partGroup.abbreviationDisplay {
            writeNameDisplay(.groupAbbreviationDisplay, abbreviationDisplay)
        }

        if let symbol = partGroup.symbol {
            writeGroupSymbol(symbol)
        }

        if let barline = partGroup.barline {
            writeGroupBarline(barline)
        }

        if partGroup.stretchesTimeSignature {
            writeEmptyElement(.groupTime)
        }

        if let footnote = partGroup.footnote {
            writeFormattedText(.footnote, footnote)
        }

        if let level = partGroup.level {
            writeLevel(level)
        }

        closeElement()
    }

    internal mutating func writePartLink(_ partLink: MXLPartLink) {
        openElement(.partLink,
                    attributes: xlinkAttributes(partLink.xlink))

        for instrumentLink in partLink.instrumentLink {
            writeInstrumentLink(instrumentLink)
        }

        for groupLink in partLink.groupLink {
            writeTextElement(.groupLink, groupLink)
        }

        closeElement()
    }

    internal mutating func writePartList(_ partList: MXLPartList) {
        openElement(.partList)

        for item in partList.items {
            writePartListItem(item)
        }

        closeElement()
    }

    internal mutating func writePartListItem(_ item: MXLPartList.Item) {
        switch item {
        case let .partGroup(partGroup):
            writePartGroup(partGroup)

        case let .scorePart(scorePart):
            writeScorePart(scorePart)
        }
    }

    internal mutating func writePartName(_ element: MXLElementName,
                                         _ name: MXLPartName) {
        writeTextElement(element,
                         name.value,
                         attributes: _partNameTextAttributes(name.text))
    }

    internal mutating func writePlayer(_ player: MXLPlayer) {
        openElement(.player,
                    attributes: [(.id, player.id)])

        writeTextElement(.playerName, player.name)

        closeElement()
    }

    internal mutating func writeScoreInstrument(_ scoreInstrument: MXLScoreInstrument) {
        openElement(.scoreInstrument,
                    attributes: [(.id, scoreInstrument.id)])

        writeTextElement(.instrumentName, scoreInstrument.name)

        if let abbreviation = scoreInstrument.abbreviation {
            writeTextElement(.instrumentAbbreviation, abbreviation)
        }

        writeVirtualInstrumentData(scoreInstrument.virtualInstrumentData)

        closeElement()
    }

    internal mutating func writeScorePart(_ scorePart: MXLScorePart) {
        openElement(.scorePart,
                    attributes: [(.id, scorePart.id)])

        if let identification = scorePart.identification {
            writeIdentification(identification)
        }

        for link in scorePart.link {
            writePartLink(link)
        }

        writePartName(.partName,
                      scorePart.name)

        if let nameDisplay = scorePart.nameDisplay {
            writeNameDisplay(.partNameDisplay, nameDisplay)
        }

        if let abbreviation = scorePart.abbreviation {
            writePartName(.partAbbreviation, abbreviation)
        }

        if let abbreviationDisplay = scorePart.abbreviationDisplay {
            writeNameDisplay(.partAbbreviationDisplay, abbreviationDisplay)
        }

        for group in scorePart.group {
            writeTextElement(.group, group)
        }

        for instrument in scorePart.instrument {
            writeScoreInstrument(instrument)
        }

        for player in scorePart.player {
            writePlayer(player)
        }

        writeScorePartGroup2s(scorePart.group2)

        closeElement()
    }

    internal mutating func writeScorePartGroup2s(_ group2s: [MXLScorePart.Group2]) {
        for group2 in group2s {
            if let midiDevice = group2.midiDevice {
                writeMidiDevice(midiDevice)
            }

            if let midiInstrument = group2.midiInstrument {
                writeMidiInstrument(midiInstrument)
            }
        }
    }

    // MARK: Private Instance Methods

    private func _formatGroupBarlineValue(_ value: MXLGroupBarline.Value) -> String {
        switch value {
        case .mensurstrich:
            "Mensurstrich"

        case .no:
            "no"

        case .yes:
            "yes"
        }
    }

    private func _formatGroupSymbolValue(_ value: MXLGroupSymbolValue) -> String {
        switch value {
        case .brace:
            "brace"

        case .bracket:
            "bracket"

        case .line:
            "line"

        case .square:
            "square"

        case .unmarked:
            "none"
        }
    }

    private func _groupNameTextAttributes(_ text: MXLGroupName.Text) -> [(MXLAttributeName, String)] {
        var attributes = positionAttributes(text.position)

        attributes += fontAttributes(text.font)
        attributes += colorAttributes(text.color)

        if let justify = text.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        return attributes
    }

    private func _partNameTextAttributes(_ text: MXLPartName.Text) -> [(MXLAttributeName, String)] {
        var attributes = positionAttributes(text.position)

        attributes += fontAttributes(text.font)

        if let color = text.color {
            attributes.append((.color, color.stringValue))
        }

        if let printsObject = text.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        if let justify = text.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        return attributes
    }
}
