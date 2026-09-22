// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseCredit(_ node: Node) throws -> MXLCredit {
        try MXLCredit(id: node.valueOfOptionalAttribute(.id),
                      kind: node.optionalChildElements(.creditType) { $0.value ?? "" },
                      link: node.optionalChildElements(.link, parseLink),
                      bookmark: node.optionalChildElements(.bookmark, parseBookmark),
                      content: parseCreditContent(node),
                      page: node.valueOfOptionalAttribute(.page, parseInt))
    }

    internal static func parseCreditContent(_ node: Node) throws -> MXLCredit.Content {
        if node.hasChildElement(.creditImage) {
            return try .creditImage(node.requiredChildElement(.creditImage, parseImage))
        }

        let words = node.allChildElements([.creditSymbol, .creditWords])
        let first = try words.first.map(parseCreditContentAlternativeContent) ??
            .creditWords(MXLFormattedTextID(id: nil,
                                            value: "",
                                            justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight),
                                            position: parsePosition(node),
                                            font: parseFont(node),
                                            color: parseColor(node),
                                            halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                                            valign: node.valueOfOptionalAttribute(.valign, parseValign),
                                            underline: node.valueOfOptionalAttribute(.underline, parseNumberOfLines),
                                            overline: node.valueOfOptionalAttribute(.overline, parseNumberOfLines),
                                            lineThrough: node.valueOfOptionalAttribute(.lineThrough, parseNumberOfLines),
                                            rotation: node.valueOfOptionalAttribute(.rotation, parseRotationDegrees),
                                            letterSpacing: node.valueOfOptionalAttribute(.letterSpacing, parseNumberOrNormal),
                                            lineHeight: node.valueOfOptionalAttribute(.lineHeight, parseNumberOrNormal),
                                            xmlLang: node.valueOfOptionalAttribute(.xmlLang),
                                            xmlSpace: node.valueOfOptionalAttribute(.xmlSpace, parseXmlSpace),
                                            dir: node.valueOfOptionalAttribute(.dir, parseTextDirection),
                                            enclosure: node.valueOfOptionalAttribute(.enclosure, parseEnclosureShape)))
        let rest = try words.dropFirst().map { wordNode in
            try MXLCredit.Content.AlternativeGroup(link: [],
                                                   bookmark: [],
                                                   content: parseCreditContentAlternativeGroupContent(wordNode))
        }

        return .alternative(content: first, group: rest)
    }

    internal static func parseCreditContentAlternativeContent(_ node: Node) throws -> MXLCredit.Content.AlternativeContent {
        switch node.element {
        case .creditSymbol:
            try .creditSymbol(parseFormattedSymbolID(node))

        case .creditWords:
            try .creditWords(parseFormattedTextID(node))

        default:
            try node.unexpectedElement([.creditSymbol, .creditWords])
        }
    }

    internal static func parseCreditContentAlternativeGroupContent(_ node: Node) throws -> MXLCredit.Content.AlternativeGroup.Content {
        switch node.element {
        case .creditSymbol:
            try .creditSymbol(parseFormattedSymbolID(node))

        case .creditWords:
            try .creditWords(parseFormattedTextID(node))

        default:
            try node.unexpectedElement([.creditSymbol, .creditWords])
        }
    }

    internal static func parseDefaults(_ node: Node) throws -> MXLDefaults {
        try MXLDefaults(scaling: node.optionalChildElement(.scaling, parseScaling),
                        isConcertScore: node.hasChildElement(.concertScore),
                        layout: parseLayout(node),
                        appearance: node.optionalChildElement(.appearance, parseAppearance),
                        musicFont: node.optionalChildElement(.musicFont, parseFont),
                        wordFont: node.optionalChildElement(.wordFont, parseFont),
                        lyricFont: node.optionalChildElements(.lyricFont, parseLyricFont),
                        lyricLanguage: node.optionalChildElements(.lyricLanguage, parseLyricLanguage))
    }

    internal static func parseEncoding(_ node: Node) throws -> MXLEncoding {
        try MXLEncoding(items: node.optionalChildElements([.encoder,
                                                           .encodingDate,
                                                           .encodingDescription,
                                                           .software,
                                                           .supports], parseEncodingItem))
    }

    internal static func parseEncodingItem(_ node: Node) throws -> MXLEncoding.Item {
        switch node.element {
        case .encoder:
            try .encoder(parseTypedText(node))

        case .encodingDate:
            .encodingDate(node.value ?? "")

        case .encodingDescription:
            .encodingDescription(node.value ?? "")

        case .software:
            .software(node.value ?? "")

        case .supports:
            try .supports(parseSupports(node))

        default:
            try node.unexpectedElement([.encoder, .encodingDate, .encodingDescription, .software, .supports])
        }
    }

    internal static func parseIdentification(_ node: Node) throws -> MXLIdentification {
        try MXLIdentification(creator: node.optionalChildElements(.creator, parseTypedText),
                              rights: node.optionalChildElements(.rights, parseTypedText),
                              encoding: node.optionalChildElement(.encoding, parseEncoding),
                              source: node.valueOfOptionalChildElement(.source),
                              relation: node.optionalChildElements(.relation, parseTypedText),
                              miscellaneous: node.optionalChildElement(.miscellaneous, parseMiscellaneous))
    }

    internal static func parseMiscellaneous(_ node: Node) throws -> MXLMiscellaneous {
        try MXLMiscellaneous(field: node.optionalChildElements(.miscellaneousField, parseMiscellaneousField))
    }

    internal static func parseMiscellaneousField(_ node: Node) throws -> MXLMiscellaneous.Field {
        try MXLMiscellaneous.Field(value: node.value ?? "",
                                   name: node.valueOfRequiredAttribute(.name))
    }

    internal static func parseSupports(_ node: Node) throws -> MXLSupports {
        try MXLSupports(isSupported: node.valueOfRequiredAttribute(.type, parseYesNo),
                        element: node.valueOfRequiredAttribute(.element),
                        attribute: node.valueOfOptionalAttribute(.attribute),
                        value: node.valueOfOptionalAttribute(.value))
    }

    internal static func parseWork(_ node: Node) throws -> MXLWork {
        try MXLWork(number: node.valueOfOptionalChildElement(.workNumber),
                    title: node.valueOfOptionalChildElement(.workTitle),
                    opus: node.optionalChildElement(.opus, parseXLink))
    }
}
