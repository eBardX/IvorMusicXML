// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseNoteKind(_ node: Node) throws -> MXLNote.Kind {
        try MXLNote.Kind(value: node.requiredValue(parseNoteKindValue),
                         size: node.valueOfOptionalAttribute(.size, parseSymbolSize))
    }

    internal static func parseNoteKindValue(_ text: String) -> MXLNoteKindValue? {
        switch text {
        case "1024th":
            .n1024th

        case "128th":
            .n128th

        case "16th":
            .n16th

        case "256th":
            .n256th

        case "32nd":
            .n32nd

        case "512th":
            .n512th

        case "64th":
            .n64th

        case "breve":
            .breve

        case "eighth":
            .eighth

        case "half":
            .half

        case "long":
            .long

        case "maxima":
            .maxima

        case "quarter":
            .quarter

        case "whole":
            .whole

        default:
            nil
        }
    }

    internal static func parseNoteNotehead(_ node: Node) throws -> MXLNote.Notehead {
        try MXLNote.Notehead(value: node.requiredValue(parseNoteNoteheadValue),
                             isFilled: node.valueOfOptionalAttribute(.filled, parseYesNo),
                             hasParentheses: node.valueOfOptionalAttribute(.parentheses, parseYesNo),
                             font: parseFont(node),
                             color: parseColor(node),
                             smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))
    }

    internal static func parseNoteNoteheadText(_ node: Node) throws -> MXLNote.NoteheadText {
        try MXLNote.NoteheadText(items: node.optionalChildElements([.accidentalText, .displayText], parseNoteNoteheadTextItem))
    }

    internal static func parseNoteNoteheadTextItem(_ node: Node) throws -> MXLNote.NoteheadText.Item {
        switch node.element {
        case .accidentalText:
            try .accidentalText(parseAccidentalText(node))

        case .displayText:
            try .displayText(parseFormattedText(node))

        default:
            try node.unexpectedElement([.accidentalText, .displayText])
        }
    }

    internal static func parseNoteNoteheadValue(_ text: String) -> MXLNote.Notehead.Value? {
        switch text {
        case "arrow down":
            .arrowDown

        case "arrow up":
            .arrowUp

        case "back slashed":
            .backSlashed

        case "circle dot":
            .circleDot

        case "circle-x":
            .circleX

        case "circled":
            .circled

        case "cluster":
            .cluster

        case "cross":
            .cross

        case "diamond":
            .diamond

        case "do":
            .do

        case "fa":
            .fa

        case "fa up":
            .faUp

        case "inverted triangle":
            .invertedTriangle

        case "la":
            .la

        case "left triangle":
            .leftTriangle

        case "mi":
            .mi

        case "none":
            .hidden

        case "normal":
            .normal

        case "other":
            .other

        case "re":
            .re

        case "rectangle":
            .rectangle

        case "slash":
            .slash

        case "slashed":
            .slashed

        case "so":
            .so

        case "square":
            .square

        case "ti":
            .ti

        case "triangle":
            .triangle

        case "x":
            .x

        default:
            nil
        }
    }

    internal static func parseNoteSize(_ node: Node) throws -> MXLNoteSize {
        try MXLNoteSize(value: node.value.flatMap(parseDouble) ?? 100,
                        kind: node.valueOfRequiredAttribute(.type, parseNoteSizeKind))
    }

    internal static func parseNoteSizeKind(_ text: String) -> MXLNoteSize.Kind? {
        switch text {
        case "cue":
            .cue

        case "grace":
            .grace

        case "grace-cue":
            .graceCue

        case "large":
            .large

        default:
            nil
        }
    }

    internal static func parseOctave(_ text: String) -> MXLOctave? {
        UInt(text).flatMap(MXLOctave.init(uintValue:))
    }

    internal static func parsePitch(_ node: Node) throws -> MXLPitch {
        try MXLPitch(step: node.valueOfRequiredChildElement(.step, parseStep),
                     alter: node.valueOfOptionalChildElement(.alter, parseSemitones),
                     octave: node.valueOfRequiredChildElement(.octave, parseOctave))
    }

    internal static func parseRest(_ node: Node) throws -> MXLRest {
        try MXLRest(displayStepOctave: node.hasChildElement(.displayStep) ? parseDisplayStepOctave(node) : nil,
                    measure: node.valueOfOptionalAttribute(.measure, parseYesNo))
    }

    internal static func parseStem(_ node: Node) throws -> MXLStem {
        try MXLStem(value: node.requiredValue(parseStemValue),
                    yPosition: parseYPosition(node),
                    color: parseColor(node))
    }

    internal static func parseStemValue(_ text: String) -> MXLStem.Value? {
        switch text {
        case "double":
            .double

        case "down":
            .down

        case "none":
            .absent

        case "up":
            .up

        default:
            nil
        }
    }

    internal static func parseStep(_ text: String) -> MXLStep? {
        switch text {
        case "A":
            .a

        case "B":
            .b

        case "C":
            .c

        case "D":
            .d

        case "E":
            .e

        case "F":
            .f

        case "G":
            .g

        default:
            nil
        }
    }

    internal static func parseTie(_ node: Node) throws -> MXLTie {
        try MXLTie(kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                   timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly))
    }

    internal static func parseTimeModification(_ node: Node) throws -> MXLTimeModification {
        try MXLTimeModification(actualNotes: node.valueOfRequiredChildElement(.actualNotes, parseInt),
                                normalNotes: node.valueOfRequiredChildElement(.normalNotes, parseInt),
                                group: node.hasChildElement(.normalType) ? parseTimeModificationGroup(node) : nil)
    }

    internal static func parseTimeModificationGroup(_ node: Node) throws -> MXLTimeModification.Group {
        try MXLTimeModification.Group(normalKind: node.valueOfRequiredChildElement(.normalType, parseNoteKindValue),
                                      normalDot: node.allChildElements(.normalDot).count)
    }

    internal static func parseUnpitched(_ node: Node) throws -> MXLUnpitched {
        try MXLUnpitched(displayStepOctave: node.hasChildElement(.displayStep) ? parseDisplayStepOctave(node) : nil)
    }
}
