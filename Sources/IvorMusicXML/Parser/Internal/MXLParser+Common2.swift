// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

private import Foundation

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseOnOff(_ text: String) -> Bool? {
        switch text {
        case "off":
            false

        case "on":
            true

        default:
            nil
        }
    }

    internal static func parseOtherPlacementText(_ node: Node) throws -> MXLOtherPlacementText {
        try MXLOtherPlacementText(value: node.value ?? "",
                                  printStyle: parsePrintStyle(node),
                                  placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                                  smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))
    }

    internal static func parseOtherText(_ node: Node) throws -> MXLOtherText {
        try MXLOtherText(value: node.value ?? "",
                         smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))
    }

    internal static func parseOverUnder(_ text: String) -> MXLOverUnder? {
        switch text {
        case "over":
            .over

        case "under":
            .under

        default:
            nil
        }
    }

    internal static func parsePercent(_ text: String) -> MXLPercent? {
        MXLPercent(text)
    }

    internal static func parsePlacementText(_ node: Node) throws -> MXLPlacementText {
        try MXLPlacementText(value: node.value ?? "",
                             printStyle: parsePrintStyle(node),
                             placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parsePosition(_ node: Node) throws -> MXLPosition {
        try MXLPosition(defaultX: node.valueOfOptionalAttribute(.defaultX, parseTenths),
                        defaultY: node.valueOfOptionalAttribute(.defaultY, parseTenths),
                        relativeX: node.valueOfOptionalAttribute(.relativeX, parseTenths),
                        relativeY: node.valueOfOptionalAttribute(.relativeY, parseTenths))
    }

    internal static func parsePrintStyle(_ node: Node) throws -> MXLPrintStyle {
        try MXLPrintStyle(position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node))
    }

    internal static func parsePrintStyleAlign(_ node: Node) throws -> MXLPrintStyleAlign {
        try MXLPrintStyleAlign(printStyle: parsePrintStyle(node),
                               halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                               valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parseRightLeftMiddle(_ text: String) -> MXLRightLeftMiddle? {
        switch text {
        case "left":
            .left

        case "middle":
            .middle

        case "right":
            .right

        default:
            nil
        }
    }

    internal static func parseRotationDegrees(_ text: String) -> MXLRotationDegrees? {
        MXLRotationDegrees(text)
    }

    internal static func parseSemitones(_ text: String) -> MXLSemitones? {
        MXLSemitones(text)
    }

    internal static func parseSmuflAccidentalGlyphName(_ text: String) -> MXLSmuflAccidentalGlyphName? {
        MXLSmuflAccidentalGlyphName(stringValue: text)
    }

    internal static func parseSmuflCodaGlyphName(_ text: String) -> MXLSmuflCodaGlyphName? {
        MXLSmuflCodaGlyphName(stringValue: text)
    }

    internal static func parseSmuflGlyphName(_ text: String) -> MXLSmuflGlyphName? {
        MXLSmuflGlyphName(stringValue: text)
    }

    internal static func parseSmuflLyricsGlyphName(_ text: String) -> MXLSmuflLyricsGlyphName? {
        MXLSmuflLyricsGlyphName(stringValue: text)
    }

    internal static func parseSmuflPictogramGlyphName(_ text: String) -> MXLSmuflPictogramGlyphName? {
        MXLSmuflPictogramGlyphName(stringValue: text)
    }

    internal static func parseSmuflSegnoGlyphName(_ text: String) -> MXLSmuflSegnoGlyphName? {
        MXLSmuflSegnoGlyphName(stringValue: text)
    }

    internal static func parseSmuflWavyLineGlyphName(_ text: String) -> MXLSmuflWavyLineGlyphName? {
        MXLSmuflWavyLineGlyphName(stringValue: text)
    }

    internal static func parseStartStop(_ text: String) -> MXLStartStop? {
        switch text {
        case "start":
            .start

        case "stop":
            .stop

        default:
            nil
        }
    }

    internal static func parseStartStopContinue(_ text: String) -> MXLStartStopContinue? {
        switch text {
        case "continue":
            .continue

        case "start":
            .start

        case "stop":
            .stop

        default:
            nil
        }
    }

    internal static func parseStartStopDiscontinue(_ text: String) -> MXLStartStopDiscontinue? {
        switch text {
        case "discontinue":
            .discontinue

        case "start":
            .start

        case "stop":
            .stop

        default:
            nil
        }
    }

    internal static func parseStartStopSingle(_ text: String) -> MXLStartStopSingle? {
        switch text {
        case "single":
            .single

        case "start":
            .start

        case "stop":
            .stop

        default:
            nil
        }
    }

    internal static func parseStyleText(_ node: Node) throws -> MXLStyleText {
        try MXLStyleText(value: node.value ?? "",
                         printStyle: parsePrintStyle(node))
    }

    internal static func parseSymbolSize(_ text: String) -> MXLSymbolSize? {
        switch text {
        case "cue":
            .cue

        case "full":
            .full

        case "grace-cue":
            .graceCue

        case "large":
            .large

        default:
            nil
        }
    }

    internal static func parseTenths(_ text: String) -> MXLTenths? {
        MXLTenths(text)
    }

    internal static func parseTextDirection(_ text: String) -> MXLTextDirection? {
        switch text {
        case "lro":
            .lro

        case "ltr":
            .ltr

        case "rlo":
            .rlo

        case "rtl":
            .rtl

        default:
            nil
        }
    }

    internal static func parseTextElementData(_ node: Node) throws -> MXLTextElementData {
        try MXLTextElementData(value: node.value ?? "",
                               font: parseFont(node),
                               color: parseColor(node),
                               underline: node.valueOfOptionalAttribute(.underline, parseNumberOfLines),
                               overline: node.valueOfOptionalAttribute(.overline, parseNumberOfLines),
                               lineThrough: node.valueOfOptionalAttribute(.lineThrough, parseNumberOfLines),
                               rotation: node.valueOfOptionalAttribute(.rotation, parseRotationDegrees),
                               letterSpacing: node.valueOfOptionalAttribute(.letterSpacing, parseNumberOrNormal),
                               xmlLang: node.valueOfOptionalAttribute(.xmlLang),
                               dir: node.valueOfOptionalAttribute(.dir, parseTextDirection))
    }

    internal static func parseTimeOnly(_ text: String) -> MXLTimeOnly? {
        var result: [Int] = []

        for item in text.split(separator: ",") {
            guard let value = Int(String(item).trimmingCharacters(in: .whitespaces))
            else { return nil }

            result.append(value)
        }

        return result
    }

    internal static func parseTopBottom(_ text: String) -> MXLTopBottom? {
        switch text {
        case "bottom":
            .bottom

        case "top":
            .top

        default:
            nil
        }
    }

    internal static func parseTuning(_ node: Node) throws -> MXLTuning {
        try MXLTuning(step: node.valueOfRequiredChildElement(.tuningStep, parseStep),
                      alter: node.valueOfOptionalChildElement(.tuningAlter, parseSemitones),
                      octave: node.valueOfRequiredChildElement(.tuningOctave, parseOctave))
    }

    internal static func parseTypedText(_ node: Node) throws -> MXLTypedText {
        try MXLTypedText(value: node.value ?? "",
                         kind: node.valueOfOptionalAttribute(.type))
    }

    internal static func parseUpDown(_ text: String) -> MXLUpDown? {
        switch text {
        case "down":
            .down

        case "up":
            .up

        default:
            nil
        }
    }

    internal static func parseUpDownStopContinue(_ text: String) -> MXLUpDownStopContinue? {
        switch text {
        case "continue":
            .continue

        case "down":
            .down

        case "stop":
            .stop

        case "up":
            .up

        default:
            nil
        }
    }

    internal static func parseUprightInverted(_ text: String) -> MXLUprightInverted? {
        switch text {
        case "inverted":
            .inverted

        case "upright":
            .upright

        default:
            nil
        }
    }

    internal static func parseValign(_ text: String) -> MXLValign? {
        switch text {
        case "baseline":
            .baseline

        case "bottom":
            .bottom

        case "middle":
            .middle

        case "top":
            .top

        default:
            nil
        }
    }

    internal static func parseValignImage(_ text: String) -> MXLValignImage? {
        switch text {
        case "bottom":
            .bottom

        case "middle":
            .middle

        case "top":
            .top

        default:
            nil
        }
    }

    internal static func parseWinged(_ text: String) -> MXLWinged? {
        switch text {
        case "curved":
            .curved

        case "double-curved":
            .doubleCurved

        case "double-straight":
            .doubleStraight

        case "none":
            .wingless

        case "straight":
            .straight

        default:
            nil
        }
    }

    internal static func parseXmlSpace(_ text: String) -> MXLXmlSpace? {
        switch text {
        case "default":
                .default

        case "preserve":
                .preserve

        default:
            nil
        }
    }

    internal static func parseXPosition(_ node: Node) throws -> MXLXPosition {
        try MXLXPosition(defaultX: node.valueOfOptionalAttribute(.defaultX, parseTenths),
                         defaultY: node.valueOfOptionalAttribute(.defaultY, parseTenths),
                         relativeX: node.valueOfOptionalAttribute(.relativeX, parseTenths),
                         relativeY: node.valueOfOptionalAttribute(.relativeY, parseTenths))
    }

    internal static func parseYesNo(_ text: String) -> Bool? {
        switch text {
        case "no":
            false

        case "yes":
            true

        default:
            nil
        }
    }

    internal static func parseYesNoNumber(_ text: String) -> MXLYesNoNumber? {
        switch text {
        case "no":
            .no

        case "yes":
            .yes

        default:
            Double(text).map { .number($0) }
        }
    }

    internal static func parseYPosition(_ node: Node) throws -> MXLYPosition {
        try MXLYPosition(defaultX: node.valueOfOptionalAttribute(.defaultX, parseTenths),
                         defaultY: node.valueOfOptionalAttribute(.defaultY, parseTenths),
                         relativeX: node.valueOfOptionalAttribute(.relativeX, parseTenths),
                         relativeY: node.valueOfOptionalAttribute(.relativeY, parseTenths))
    }
}
