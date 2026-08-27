// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiTools
internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseBackup(_ node: Node) throws -> MXLBackup {
        try MXLBackup(duration: parseDuration(node),
                      footnote: node.optionalChildElement(.footnote, parseFormattedText),
                      level: node.optionalChildElement(.level, parseLevel))
    }

    internal static func parseFeature(_ node: Node) throws -> MXLFeature {
        try MXLFeature(value: node.value ?? "",
                       kind: node.valueOfOptionalAttribute(.type))
    }

    internal static func parseForward(_ node: Node) throws -> MXLForward {
        try MXLForward(duration: parseDuration(node),
                       footnote: node.optionalChildElement(.footnote, parseFormattedText),
                       level: node.optionalChildElement(.level, parseLevel),
                       voice: node.optionalChildElement(.voice, parseVoice),
                       staff: node.optionalChildElement(.staff, parseStaff))
    }

    internal static func parseGrouping(_ node: Node) throws -> MXLGrouping {
        try MXLGrouping(id: node.valueOfOptionalAttribute(.id),
                        feature: node.optionalChildElements(.feature, parseFeature),
                        kind: node.valueOfRequiredAttribute(.type, parseStartStopSingle),
                        number: node.valueOfOptionalAttribute(.number),
                        memberOf: node.valueOfOptionalAttribute(.memberOf))
    }

    internal static func parseLevel(_ node: Node) throws -> MXLLevel {
        try MXLLevel(value: node.value ?? "",
                     isReferenceOnly: node.valueOfOptionalAttribute(.reference, parseYesNo),
                     kind: node.valueOfOptionalAttribute(.type, parseStartStopSingle),
                     display: parseLevelDisplay(node))
    }

    internal static func parseLevelDisplay(_ node: Node) throws -> MXLLevel.Display {
        try MXLLevel.Display(hasParentheses: node.valueOfOptionalAttribute(.parentheses, parseYesNo),
                             hasBracket: node.valueOfOptionalAttribute(.bracket, parseYesNo),
                             size: node.valueOfOptionalAttribute(.size, parseSymbolSize))
    }

    internal static func parseMusicItem(_ node: Node) throws -> MXLMusicItem {
        switch node.element {
        case .attributes:
            try .attributes(parseAttributes(node))

        case .backup:
            try .backup(parseBackup(node))

        case .barline:
            try .barline(parseBarline(node))

        case .bookmark:
            try .bookmark(parseBookmark(node))

        case .direction:
            try .direction(parseDirection(node))

        case .figuredBass:
            try .figuredBass(parseFiguredBass(node))

        case .forward:
            try .forward(parseForward(node))

        case .grouping:
            try .grouping(parseGrouping(node))

        case .harmony:
            try .harmony(parseHarmony(node))

        case .link:
            try .link(parseLink(node))

        case .listening:
            try .listening(parseListening(node))

        case .note:
            try .note(parseNote(node))

        case .print:
            try .print(parsePrint(node))

        case .sound:
            try .sound(parseSound(node))

        default:
            try node.unexpectedElement([.attributes,
                                        .backup,
                                        .barline,
                                        .bookmark,
                                        .direction,
                                        .figuredBass,
                                        .forward,
                                        .grouping,
                                        .harmony,
                                        .link,
                                        .listening,
                                        .note,
                                        .print,
                                        .sound])
        }
    }

    internal static func parseMusicItems(_ node: Node) throws -> [MXLMusicItem] {
        try node.optionalChildElements([.attributes,
                                        .backup,
                                        .barline,
                                        .bookmark,
                                        .direction,
                                        .figuredBass,
                                        .forward,
                                        .grouping,
                                        .harmony,
                                        .link,
                                        .listening,
                                        .note,
                                        .print,
                                        .sound], parseMusicItem)
    }

    internal static func parseStaff(_ node: Node) throws -> MXLStaff {
        MXLStaff(node.value.flatMap { UInt($0) } ?? 1)
    }

    internal static func parseStaffNumber(_ text: String) -> MXLStaffNumber? {
        UInt(text).flatMap(MXLStaffNumber.init(uintValue:))
    }

    internal static func parseVoice(_ node: Node) throws -> MXLVoice {
        MXLVoice(voice: node.value ?? "")
    }
}
