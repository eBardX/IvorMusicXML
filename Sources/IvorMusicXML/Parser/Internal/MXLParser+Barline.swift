// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

private import Foundation

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseBarline(_ node: Node) throws -> MXLBarline {
        try MXLBarline(id: node.valueOfOptionalAttribute(.id),
                       barStyle: node.optionalChildElement(.barStyle, parseBarlineStyleColor),
                       footnote: node.optionalChildElement(.footnote, parseFormattedText),
                       level: node.optionalChildElement(.level, parseLevel),
                       wavyLine: node.optionalChildElement(.wavyLine, parseWavyLine),
                       segno: node.optionalChildElement(.segno, parseSegno),
                       coda: node.optionalChildElement(.coda, parseCoda),
                       fermata: node.optionalChildElements(.fermata, parseFermata),
                       ending: node.optionalChildElement(.ending, parseEnding),
                       repeat: node.optionalChildElement(.repeat, parseRepeat),
                       location: node.valueOfOptionalAttribute(.location, parseRightLeftMiddle),
                       segnoAttribute: node.valueOfOptionalAttribute(.segno),
                       codaAttribute: node.valueOfOptionalAttribute(.coda),
                       divisions: node.valueOfOptionalAttribute(.divisions, parseDivisions))
    }

    internal static func parseBarlineStyleColor(_ node: Node) throws -> MXLBarline.StyleColor {
        try MXLBarline.StyleColor(value: node.requiredValue(parseBarlineStyleColorStyle),
                                  color: parseColor(node))
    }

    internal static func parseBarlineStyleColorStyle(_ text: String) -> MXLBarline.StyleColor.Style? {
        switch text {
        case "dashed":
            .dashed

        case "dotted":
            .dotted

        case "heavy":
            .heavy

        case "heavy-heavy":
            .heavyHeavy

        case "heavy-light":
            .heavyLight

        case "light-heavy":
            .lightHeavy

        case "light-light":
            .lightLight

        case "none":
            .invisible

        case "regular":
            .regular

        case "short":
            .short

        case "tick":
            .tick

        default:
            nil
        }
    }

    internal static func parseEnding(_ node: Node) throws -> MXLEnding {
        try MXLEnding(value: node.value ?? "",
                      number: node.valueOfRequiredAttribute(.number, parseEndingNumber),
                      kind: node.valueOfRequiredAttribute(.type, parseStartStopDiscontinue),
                      printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                      position: parsePosition(node),
                      font: parseFont(node),
                      color: parseColor(node),
                      system: node.valueOfOptionalAttribute(.system, parseSystemRelation),
                      endLength: node.valueOfOptionalAttribute(.endLength, parseTenths),
                      textX: node.valueOfOptionalAttribute(.textX, parseTenths),
                      textY: node.valueOfOptionalAttribute(.textY, parseTenths))
    }

    internal static func parseEndingNumber(_ text: String) -> MXLEnding.Number? {
        let trimmed = text.trimmingCharacters(in: .whitespaces)

        if trimmed.isEmpty {
            return []
        }

        var result: [Int] = []

        for item in trimmed.split(separator: ",") {
            guard let value = Int(String(item).trimmingCharacters(in: .whitespaces))
            else { return nil }

            result.append(value)
        }

        return result
    }

    internal static func parseRepeat(_ node: Node) throws -> MXLRepeat {
        try MXLRepeat(direction: node.valueOfRequiredAttribute(.direction, parseRepeatDirection),
                      times: node.valueOfOptionalAttribute(.times, parseInt),
                      isAfterJump: node.valueOfOptionalAttribute(.afterJump, parseYesNo),
                      winged: node.valueOfOptionalAttribute(.winged, parseWinged))
    }

    internal static func parseRepeatDirection(_ text: String) -> MXLRepeat.Direction? {
        switch text {
        case "backward":
            .backward

        case "forward":
            .forward

        default:
            nil
        }
    }
}
