// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiTools
internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseEmptyTrillSound(_ node: Node) throws -> MXLEmptyTrillSound {
        try MXLEmptyTrillSound(position: parsePosition(node),
                               font: parseFont(node),
                               color: parseColor(node),
                               placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                               trillSound: parseTrillSound(node))
    }

    internal static func parseHorizontalTurn(_ node: Node) throws -> MXLHorizontalTurn {
        try MXLHorizontalTurn(position: parsePosition(node),
                              font: parseFont(node),
                              color: parseColor(node),
                              placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                              trillSound: parseTrillSound(node),
                              isSlashed: node.valueOfOptionalAttribute(.slash, parseYesNo))
    }

    internal static func parseMordent(_ node: Node) throws -> MXLMordent {
        try MXLMordent(position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                       trillSound: parseTrillSound(node),
                       isLong: node.valueOfOptionalAttribute(.long, parseYesNo),
                       approach: node.valueOfOptionalAttribute(.approach, parseAboveBelow),
                       departure: node.valueOfOptionalAttribute(.departure, parseAboveBelow))
    }

    internal static func parseOrnaments(_ node: Node) throws -> MXLOrnaments {
        try MXLOrnaments(id: node.valueOfOptionalAttribute(.id),
                         content: node.requiredChildElement([.delayedInvertedTurn,
                                                             .delayedTurn,
                                                             .haydn,
                                                             .invertedMordent,
                                                             .invertedTurn,
                                                             .invertedVerticalTurn,
                                                             .mordent,
                                                             .otherOrnament,
                                                             .schleifer,
                                                             .shake,
                                                             .tremolo,
                                                             .trillMark,
                                                             .turn,
                                                             .verticalTurn,
                                                             .wavyLine], parseOrnamentsContent),
                         accidentalMark: node.optionalChildElements(.accidentalMark, parseAccidentalMark))
    }

    internal static func parseOrnamentsContent(_ node: Node) throws -> MXLOrnaments.Content {
        switch node.element {
        case .delayedInvertedTurn:
            try .delayedInvertedTurn(parseHorizontalTurn(node))

        case .delayedTurn:
            try .delayedTurn(parseHorizontalTurn(node))

        case .haydn:
            try .haydn(parseEmptyTrillSound(node))

        case .invertedMordent:
            try .invertedMordent(parseMordent(node))

        case .invertedTurn:
            try .invertedTurn(parseHorizontalTurn(node))

        case .invertedVerticalTurn:
            try .invertedVerticalTurn(parseEmptyTrillSound(node))

        case .mordent:
            try .mordent(parseMordent(node))

        case .otherOrnament:
            try .otherOrnament(parseOtherPlacementText(node))

        case .schleifer:
            try .schleifer(position: parsePosition(node),
                           font: parseFont(node),
                           color: parseColor(node),
                           placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .shake:
            try .shake(parseEmptyTrillSound(node))

        case .tremolo:
            try .tremolo(parseTremolo(node))

        case .trillMark:
            try .trillMark(parseEmptyTrillSound(node))

        case .turn:
            try .turn(parseHorizontalTurn(node))

        case .verticalTurn:
            try .verticalTurn(parseEmptyTrillSound(node))

        case .wavyLine:
            try .wavyLine(parseWavyLine(node))

        default:
            try node.unexpectedElement([.delayedInvertedTurn,
                                        .delayedTurn,
                                        .haydn,
                                        .invertedMordent,
                                        .invertedTurn,
                                        .invertedVerticalTurn,
                                        .mordent,
                                        .otherOrnament,
                                        .schleifer,
                                        .shake,
                                        .tremolo,
                                        .trillMark,
                                        .turn,
                                        .verticalTurn,
                                        .wavyLine])
        }
    }

    internal static func parseTremolo(_ node: Node) throws -> MXLTremolo {
        try MXLTremolo(value: node.value.flatMap(parseTremoloMarks) ?? 3,
                       kind: node.valueOfOptionalAttribute(.type, parseTremoloKind),
                       position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                       smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))
    }

    internal static func parseTremoloKind(_ text: String) -> MXLTremolo.Kind? {
        switch text {
        case "single":
            .single

        case "start":
            .start

        case "stop":
            .stop

        case "unmeasured":
            .unmeasured

        default:
            nil
        }
    }

    internal static func parseTremoloMarks(_ text: String) -> MXLTremoloMarks? {
        UInt(text).flatMap(MXLTremoloMarks.init(uintValue:))
    }

    internal static func parseTrillBeats(_ text: String) -> MXLTrillBeats? {
        MXLTrillBeats(text)
    }

    internal static func parseTrillSound(_ node: Node) throws -> MXLTrillSound {
        try MXLTrillSound(startNote: node.valueOfOptionalAttribute(.startNote, parseStartNote),
                          trillStep: node.valueOfOptionalAttribute(.trillStep, parseTrillStep),
                          twoNoteTurn: node.valueOfOptionalAttribute(.twoNoteTurn, parseTwoNoteTurn),
                          accelerates: node.valueOfOptionalAttribute(.accelerate, parseYesNo),
                          beats: node.valueOfOptionalAttribute(.beats, parseTrillBeats),
                          secondBeat: node.valueOfOptionalAttribute(.secondBeat, parsePercent),
                          lastBeat: node.valueOfOptionalAttribute(.lastBeat, parsePercent))
    }

    internal static func parseTrillStep(_ text: String) -> MXLTrillStep? {
        switch text {
        case "half":
            .half

        case "unison":
            .unison

        case "whole":
            .whole

        default:
            nil
        }
    }

    internal static func parseTwoNoteTurn(_ text: String) -> MXLTwoNoteTurn? {
        switch text {
        case "half":
            .half

        case "none":
            .omitted

        case "whole":
            .whole

        default:
            nil
        }
    }

    internal static func parseWavyLine(_ node: Node) throws -> MXLWavyLine {
        try MXLWavyLine(kind: node.valueOfRequiredAttribute(.type, parseStartStopContinue),
                        number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                        smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflWavyLineGlyphName),
                        position: parsePosition(node),
                        placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                        color: parseColor(node),
                        trillSound: parseTrillSound(node))
    }
}
