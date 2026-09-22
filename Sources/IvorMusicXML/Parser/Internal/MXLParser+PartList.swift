// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseGroupBarline(_ node: Node) throws -> MXLGroupBarline {
        try MXLGroupBarline(value: node.requiredValue(parseGroupBarlineValue),
                            color: parseColor(node))
    }

    internal static func parseGroupBarlineValue(_ text: String) -> MXLGroupBarline.Value? {
        switch text {
        case "Mensurstrich":
            .mensurstrich

        case "no":
            .no

        case "yes":
            .yes

        default:
            nil
        }
    }

    internal static func parseGroupName(_ node: Node) throws -> MXLGroupName {
        try MXLGroupName(value: node.value ?? "",
                         text: parseGroupNameText(node))
    }

    internal static func parseGroupNameText(_ node: Node) throws -> MXLGroupName.Text {
        try MXLGroupName.Text(position: parsePosition(node),
                              font: parseFont(node),
                              color: parseColor(node),
                              justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight))
    }

    internal static func parseGroupSymbol(_ node: Node) throws -> MXLGroupSymbol {
        try MXLGroupSymbol(value: node.requiredValue(parseGroupSymbolValue),
                           position: parsePosition(node),
                           color: parseColor(node))
    }

    internal static func parseGroupSymbolValue(_ text: String) -> MXLGroupSymbolValue? {
        switch text {
        case "brace":
            .brace

        case "bracket":
            .bracket

        case "line":
            .line

        case "none":
            .unmarked

        case "square":
            .square

        default:
            nil
        }
    }

    internal static func parseInstrument(_ node: Node) throws -> MXLInstrument {
        try MXLInstrument(id: node.valueOfRequiredAttribute(.id))
    }

    internal static func parseInstrumentChange(_ node: Node) throws -> MXLInstrumentChange {
        try MXLInstrumentChange(id: node.valueOfRequiredAttribute(.id))
    }

    internal static func parseInstrumentLink(_ node: Node) throws -> MXLInstrumentLink {
        try MXLInstrumentLink(id: node.valueOfRequiredAttribute(.id))
    }

    internal static func parseNameDisplay(_ node: Node) throws -> MXLNameDisplay {
        try MXLNameDisplay(items: node.optionalChildElements([.accidentalText, .displayText], parseNameDisplayItem),
                           printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseNameDisplayItem(_ node: Node) throws -> MXLNameDisplay.Item {
        switch node.element {
        case .accidentalText:
            try .accidentalText(parseAccidentalText(node))

        case .displayText:
            try .displayText(parseFormattedText(node))

        default:
            try node.unexpectedElement([.accidentalText, .displayText])
        }
    }

internal static func parsePartGroup(_ node: Node) throws -> MXLPartGroup {
        try MXLPartGroup(name: node.optionalChildElement(.groupName, parseGroupName),
                         nameDisplay: node.optionalChildElement(.groupNameDisplay, parseNameDisplay),
                         abbreviation: node.optionalChildElement(.groupAbbreviation, parseGroupName),
                         abbreviationDisplay: node.optionalChildElement(.groupAbbreviationDisplay, parseNameDisplay),
                         symbol: node.optionalChildElement(.groupSymbol, parseGroupSymbol),
                         barline: node.optionalChildElement(.groupBarline, parseGroupBarline),
                         stretchesTimeSignature: node.hasChildElement(.groupTime),
                         footnote: node.optionalChildElement(.footnote, parseFormattedText),
                         level: node.optionalChildElement(.level, parseLevel),
                         kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                         number: node.valueOfOptionalAttribute(.number))
    }

    internal static func parsePartLink(_ node: Node) throws -> MXLPartLink {
        try MXLPartLink(instrumentLink: node.optionalChildElements(.instrumentLink, parseInstrumentLink),
                        groupLink: node.optionalChildElements(.groupLink) { $0.value ?? "" },
                        xlink: parseXLink(node))
    }

    internal static func parsePartList(_ node: Node) throws -> MXLPartList {
        _ = try node.requiredChildElement(.scorePart) { _ in }

        return try MXLPartList(items: node.optionalChildElements([.partGroup, .scorePart], parsePartListItem))
    }

    internal static func parsePartListItem(_ node: Node) throws -> MXLPartList.Item {
        switch node.element {
        case .partGroup:
            try .partGroup(parsePartGroup(node))

        case .scorePart:
            try .scorePart(parseScorePart(node))

        default:
            try node.unexpectedElement([.partGroup, .scorePart])
        }
    }

    internal static func parsePartName(_ node: Node) throws -> MXLPartName {
        try MXLPartName(value: node.value ?? "",
                        text: parsePartNameText(node))
    }

    internal static func parsePartNameText(_ node: Node) throws -> MXLPartName.Text {
        try MXLPartName.Text(position: parsePosition(node),
                             font: parseFont(node),
                             color: parseColor(node),
                             printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                             justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight))
    }

    internal static func parsePartSymbol(_ node: Node) throws -> MXLPartSymbol {
        try MXLPartSymbol(value: node.requiredValue(parseGroupSymbolValue),
                          topStaff: node.valueOfOptionalAttribute(.topStaff, parseStaffNumber),
                          bottomStaff: node.valueOfOptionalAttribute(.bottomStaff, parseStaffNumber),
                          position: parsePosition(node),
                          color: parseColor(node))
    }

    internal static func parsePlayer(_ node: Node) throws -> MXLPlayer {
        try MXLPlayer(id: node.valueOfRequiredAttribute(.id),
                      name: node.valueOfRequiredChildElement(.playerName))
    }

    internal static func parseScoreInstrument(_ node: Node) throws -> MXLScoreInstrument {
        try MXLScoreInstrument(id: node.valueOfRequiredAttribute(.id),
                               name: node.valueOfRequiredChildElement(.instrumentName),
                               abbreviation: node.valueOfOptionalChildElement(.instrumentAbbreviation),
                               virtualInstrumentData: parseVirtualInstrumentData(node))
    }

    internal static func parseScorePart(_ node: Node) throws -> MXLScorePart {
        try MXLScorePart(id: node.valueOfRequiredAttribute(.id),
                         identification: node.optionalChildElement(.identification, parseIdentification),
                         link: node.optionalChildElements(.partLink, parsePartLink),
                         name: node.requiredChildElement(.partName, parsePartName),
                         nameDisplay: node.optionalChildElement(.partNameDisplay, parseNameDisplay),
                         abbreviation: node.optionalChildElement(.partAbbreviation, parsePartName),
                         abbreviationDisplay: node.optionalChildElement(.partAbbreviationDisplay, parseNameDisplay),
                         group: node.optionalChildElements(.group) { $0.value ?? "" },
                         instrument: node.optionalChildElements(.scoreInstrument, parseScoreInstrument),
                         player: node.optionalChildElements(.player, parsePlayer),
                         group2: parseScorePartGroup2s(node))
    }

    internal static func parseScorePartGroup2s(_ node: Node) throws -> [MXLScorePart.Group2] {
        let midiDevices = try node.optionalChildElements(.midiDevice, parseMidiDevice)
        let midiInstruments = try node.optionalChildElements(.midiInstrument, parseMidiInstrument)
        guard !midiDevices.isEmpty || !midiInstruments.isEmpty
        else { return [] }

        let count = max(midiDevices.count, midiInstruments.count)

        return (0..<count).map { index in
            MXLScorePart.Group2(midiDevice: index < midiDevices.count ? midiDevices[index] : nil,
                                midiInstrument: index < midiInstruments.count ? midiInstruments[index] : nil)
        }
    }
}
