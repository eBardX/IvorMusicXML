// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseAccidental(_ node: Node) throws -> MXLAccidental {
        try MXLAccidental(value: node.requiredValue(parseAccidentalValue),
                          isCautionary: node.valueOfOptionalAttribute(.cautionary, parseYesNo),
                          isEditorial: node.valueOfOptionalAttribute(.editorial, parseYesNo),
                          levelDisplay: parseLevelDisplay(node),
                          position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflAccidentalGlyphName))
    }

    internal static func parseAccidentalText(_ node: Node) throws -> MXLAccidentalText {
        try MXLAccidentalText(value: node.requiredValue(parseAccidentalValue),
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
                              enclosure: node.valueOfOptionalAttribute(.enclosure, parseEnclosureShape),
                              smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflAccidentalGlyphName))
    }

    internal static func parseAccidentalValue(_ text: String) -> MXLAccidentalValue? {
        switch text {
        case "arrow-down":
            .arrowDown

        case "arrow-up":
            .arrowUp

        case "double-sharp":
            .doubleSharp

        case "double-sharp-down":
            .doubleSharpDown

        case "double-sharp-up":
            .doubleSharpUp

        case "double-slash-flat":
            .doubleSlashFlat

        case "flat":
            .flat

        case "flat-1":
            .flat1

        case "flat-2":
            .flat2

        case "flat-3":
            .flat3

        case "flat-4":
            .flat4

        case "flat-down":
            .flatDown

        case "flat-flat":
            .flatFlat

        case "flat-flat-down":
            .flatFlatDown

        case "flat-flat-up":
            .flatFlatUp

        case "flat-up":
            .flatUp

        case "koron":
            .koron

        case "natural":
            .natural

        case "natural-down":
            .naturalDown

        case "natural-flat":
            .naturalFlat

        case "natural-sharp":
            .naturalSharp

        case "natural-up":
            .naturalUp

        case "other":
            .other

        case "quarter-flat":
            .quarterFlat

        case "quarter-sharp":
            .quarterSharp

        case "sharp":
            .sharp

        case "sharp-1":
            .sharp1

        case "sharp-2":
            .sharp2

        case "sharp-3":
            .sharp3

        case "sharp-5":
            .sharp5

        case "sharp-down":
            .sharpDown

        case "sharp-sharp":
            .sharpSharp

        case "sharp-up":
            .sharpUp

        case "slash-flat":
            .slashFlat

        case "slash-quarter-sharp":
            .slashQuarterSharp

        case "slash-sharp":
            .slashSharp

        case "sori":
            .sori

        case "three-quarters-flat":
            .threeQuartersFlat

        case "three-quarters-sharp":
            .threeQuartersSharp

        case "triple-flat":
            .tripleFlat

        case "triple-sharp":
            .tripleSharp

        default:
            nil
        }
    }

    internal static func parseBeam(_ node: Node) throws -> MXLBeam {
        try MXLBeam(id: node.valueOfOptionalAttribute(.id),
                    value: node.requiredValue(parseBeamValue),
                    number: node.valueOfOptionalAttribute(.number, parseBeamLevel),
                    repeater: node.valueOfOptionalAttribute(.repeater, parseYesNo),
                    fan: node.valueOfOptionalAttribute(.fan, parseFan),
                    color: parseColor(node))
    }

    internal static func parseBeamLevel(_ text: String) -> MXLBeamLevel? {
        UInt(text).flatMap(MXLBeamLevel.init(uintValue:))
    }

    internal static func parseBeamValue(_ text: String) -> MXLBeamValue? {
        switch text {
        case "backward hook":
            .backwardHook

        case "begin":
            .begin

        case "continue":
            .continue

        case "end":
            .end

        case "forward hook":
            .forwardHook

        default:
            nil
        }
    }

    internal static func parseDisplayStepOctave(_ node: Node) throws -> MXLDisplayStepOctave {
        try MXLDisplayStepOctave(displayStep: node.valueOfRequiredChildElement(.displayStep, parseStep),
                                 displayOctave: node.valueOfRequiredChildElement(.displayOctave, parseOctave))
    }

    internal static func parseDuration(_ node: Node) throws -> MXLPositiveDivisions {
        try node.valueOfRequiredChildElement(.duration, parsePositiveDivisions)
    }

    internal static func parseFan(_ text: String) -> MXLFan? {
        switch text {
        case "accel":
            .accel

        case "none":
            .steady

        case "rit":
            .rit

        default:
            nil
        }
    }

    internal static func parseFullNote(_ node: Node) throws -> MXLFullNote {
        try MXLFullNote(isChord: node.hasChildElement(.chord),
                        content: node.requiredChildElement([.pitch, .rest, .unpitched], parseFullNoteContent))
    }

    internal static func parseFullNoteContent(_ node: Node) throws -> MXLFullNote.Content {
        switch node.element {
        case .pitch:
            try .pitch(parsePitch(node))

        case .rest:
            try .rest(parseRest(node))

        case .unpitched:
            try .unpitched(parseUnpitched(node))

        default:
            throw MXLParser.Error.parseFailure(nil)
        }
    }

    internal static func parseGrace(_ node: Node) throws -> MXLGrace {
        try MXLGrace(stealTimePrevious: node.valueOfOptionalAttribute(.stealTimePrevious, parsePercent),
                     stealTimeFollowing: node.valueOfOptionalAttribute(.stealTimeFollowing, parsePercent),
                     makeTime: node.valueOfOptionalAttribute(.makeTime, parseDivisions),
                     isSlashed: node.valueOfOptionalAttribute(.slash, parseYesNo))
    }

    internal static func parseNote(_ node: Node) throws -> MXLNote {
        try MXLNote(id: node.valueOfOptionalAttribute(.id),
                    content: parseNoteContent(node),
                    instrument: node.optionalChildElements(.instrument, parseInstrument),
                    footnote: node.optionalChildElement(.footnote, parseFormattedText),
                    level: node.optionalChildElement(.level, parseLevel),
                    voice: node.optionalChildElement(.voice, parseVoice),
                    kind: node.optionalChildElement(.type, parseNoteKind),
                    dot: node.optionalChildElements(.dot, parseEmptyPlacement),
                    accidental: node.optionalChildElement(.accidental, parseAccidental),
                    timeModification: node.optionalChildElement(.timeModification, parseTimeModification),
                    stem: node.optionalChildElement(.stem, parseStem),
                    notehead: node.optionalChildElement(.notehead, parseNoteNotehead),
                    noteheadText: node.optionalChildElement(.noteheadText, parseNoteNoteheadText),
                    staff: node.optionalChildElement(.staff, parseStaff),
                    beam: node.optionalChildElements(.beam, parseBeam),
                    notations: node.optionalChildElements(.notations, parseNotations),
                    lyric: node.optionalChildElements(.lyric, parseLyric),
                    play: node.optionalChildElement(.play, parsePlay),
                    listen: node.optionalChildElement(.listen, parseListen),
                    xPosition: parseXPosition(node),
                    font: parseFont(node),
                    color: parseColor(node),
                    printout: parsePrintout(node),
                    printsLeger: node.valueOfOptionalAttribute(.printLeger, parseYesNo),
                    dynamics: node.valueOfOptionalAttribute(.dynamics, parseNonNegativeDecimal),
                    endDynamics: node.valueOfOptionalAttribute(.endDynamics, parseNonNegativeDecimal),
                    attack: node.valueOfOptionalAttribute(.attack, parseDivisions),
                    release: node.valueOfOptionalAttribute(.release, parseDivisions),
                    timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly),
                    isPizzicato: node.valueOfOptionalAttribute(.pizzicato, parseYesNo))
    }

    internal static func parseNoteContent(_ node: Node) throws -> MXLNote.Content {
        if node.hasChildElement(.grace) {
            let grace = try node.requiredChildElement(.grace, parseGrace)
            let fullNote = try parseFullNote(node)

            if node.hasChildElement(.cue) {
                return .graceNoteCue(fullNote: fullNote,
                                     grace: grace)
            }

            return try .graceNote(fullNote: fullNote,
                                  grace: grace,
                                  tie: node.optionalChildElements(.tie, parseTie))
        }

        if node.hasChildElement(.cue) {
            return try .regularNoteCue(fullNote: parseFullNote(node),
                                       duration: parseDuration(node))
        }

        return try .regularNote(fullNote: parseFullNote(node),
                                duration: parseDuration(node),
                                tie: node.optionalChildElements(.tie, parseTie))
    }
}
