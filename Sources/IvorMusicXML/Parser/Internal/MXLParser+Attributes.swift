// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseAttributes(_ node: Node) throws -> MXLAttributes {
        try MXLAttributes(footnote: node.optionalChildElement(.footnote, parseFormattedText),
                          level: node.optionalChildElement(.level, parseLevel),
                          divisions: node.valueOfOptionalChildElement(.divisions, parsePositiveDivisions),
                          key: node.optionalChildElements(.key, parseKey),
                          time: node.optionalChildElements(.time, parseTime),
                          staves: node.valueOfOptionalChildElement(.staves, parseInt),
                          partSymbol: node.optionalChildElement(.partSymbol, parsePartSymbol),
                          instruments: node.valueOfOptionalChildElement(.instruments, parseInt),
                          clef: node.optionalChildElements(.clef, parseClef),
                          staffDetails: node.optionalChildElements(.staffDetails, parseStaffDetails),
                          content: parseAttributesContent(node),
                          directive: node.optionalChildElements(.directive, parseAttributesDirective),
                          measureStyle: node.optionalChildElements(.measureStyle, parseMeasureStyle))
    }

    internal static func parseAttributesContent(_ node: Node) throws -> MXLAttributes.Content {
        if node.hasChildElement(.forPart) {
            return try .forPart(node.optionalChildElements(.forPart, parseForPart))
        }

        return try .transpose(node.optionalChildElements(.transpose, parseTranspose))
    }

    internal static func parseAttributesDirective(_ node: Node) throws -> MXLAttributes.Directive {
        try MXLAttributes.Directive(value: node.value ?? "",
                                    position: parsePosition(node),
                                    font: parseFont(node),
                                    color: parseColor(node),
                                    xmlLang: node.valueOfOptionalAttribute(.xmlLang))
    }

    internal static func parseBeatRepeat(_ node: Node) throws -> MXLBeatRepeat {
        try MXLBeatRepeat(slashContent: node.hasChildElement([.exceptVoice, .slashType]) ? parseSlashContent(node) : nil,
                          kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                          slashes: node.valueOfOptionalAttribute(.slashes, parseInt),
                          usesDots: node.valueOfOptionalAttribute(.useDots, parseYesNo))
    }

    internal static func parseCancel(_ node: Node) throws -> MXLCancel {
        try MXLCancel(value: node.value.flatMap(parseInt) ?? 0,
                      location: node.valueOfOptionalAttribute(.location, parseCancelLocation))
    }

    internal static func parseCancelLocation(_ text: String) -> MXLCancel.Location? {
        switch text {
        case "before-barline":
            .beforeBarline

        case "left":
            .left

        case "right":
            .right

        default:
            nil
        }
    }

    internal static func parseClef(_ node: Node) throws -> MXLClef {
        try MXLClef(id: node.valueOfOptionalAttribute(.id),
                    content: parseClefContent(node),
                    number: node.valueOfOptionalAttribute(.number, parseStaffNumber),
                    isAdditional: node.valueOfOptionalAttribute(.additional, parseYesNo),
                    size: node.valueOfOptionalAttribute(.size, parseSymbolSize),
                    isAfterBarline: node.valueOfOptionalAttribute(.afterBarline, parseYesNo),
                    position: parsePosition(node),
                    font: parseFont(node),
                    color: parseColor(node),
                    printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseClefContent(_ node: Node) throws -> MXLClef.Content {
        try MXLClef.Content(sign: node.valueOfRequiredChildElement(.sign, parseClefSign),
                            line: node.valueOfOptionalChildElement(.line, parseStaffLinePosition),
                            octaveChange: node.valueOfOptionalChildElement(.clefOctaveChange, parseOctaveChange))
    }

    internal static func parseClefSign(_ text: String) -> MXLClef.Sign? {
        switch text {
        case "C":
            .c

        case "F":
            .f

        case "G":
            .g

        case "jianpu":
            .jianpu

        case "none":
            .invisible

        case "percussion":
            .percussion

        case "TAB":
            .tAB

        default:
            nil
        }
    }

    internal static func parseDiatonicSteps(_ text: String) -> MXLDiatonicSteps? {
        Int(text).flatMap(MXLDiatonicSteps.init(intValue:))
    }

    internal static func parseDivisions(_ text: String) -> MXLDivisions? {
        Int(text).flatMap(MXLDivisions.init(intValue:))
    }

    internal static func parseFifths(_ text: String) -> MXLFifths? {
        Int(text).flatMap(MXLFifths.init(intValue:))
    }

    internal static func parseForPart(_ node: Node) throws -> MXLForPart {
        try MXLForPart(id: node.valueOfOptionalAttribute(.id),
                       clef: node.optionalChildElement(.partClef, parseClefContent),
                       transpose: node.requiredChildElement(.partTranspose, parseTransposeContent),
                       number: node.valueOfOptionalAttribute(.number, parseStaffNumber))
    }

    internal static func parseInterchangeable(_ node: Node) throws -> MXLInterchangeable {
        try MXLInterchangeable(timeRelation: node.valueOfOptionalChildElement(.timeRelation, parseTimeRelation),
                               timeSignature: parseTimeSignatures(node),
                               symbol: node.valueOfOptionalAttribute(.symbol, parseTimeSymbol),
                               separator: node.valueOfOptionalAttribute(.separator, parseTimeSeparator))
    }

    internal static func parseKey(_ node: Node) throws -> MXLKey {
        try MXLKey(id: node.valueOfOptionalAttribute(.id),
                   content: parseKeyContent(node),
                   octave: node.optionalChildElements(.keyOctave, parseKeyOctave),
                   number: node.valueOfOptionalAttribute(.number, parseStaffNumber),
                   position: parsePosition(node),
                   font: parseFont(node),
                   color: parseColor(node),
                   printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseKeyAccidental(_ node: Node) throws -> MXLKeyAccidental {
        try MXLKeyAccidental(value: node.requiredValue(parseAccidentalValue),
                             smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflAccidentalGlyphName))
    }

    internal static func parseKeyContent(_ node: Node) throws -> MXLKey.Content {
        if node.hasChildElement(.keyStep) {
            return try .nonTraditionalKey(parseNonTraditionalKey(node))
        }

        return try .traditionalKey(parseTraditionalKey(node))
    }

    internal static func parseKeyOctave(_ node: Node) throws -> MXLKey.Octave {
        try MXLKey.Octave(value: node.value.flatMap(parseInt) ?? 4,
                          number: node.valueOfRequiredAttribute(.number, parseInt),
                          isCancelling: node.valueOfOptionalAttribute(.cancel, parseYesNo))
    }

    internal static func parseMeasureRepeat(_ node: Node) throws -> MXLMeasureRepeat {
        try MXLMeasureRepeat(value: node.value.flatMap(parseInt),
                             kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                             slashes: node.valueOfOptionalAttribute(.slashes, parseInt))
    }

    internal static func parseMeasureStyle(_ node: Node) throws -> MXLMeasureStyle {
        try MXLMeasureStyle(id: node.valueOfOptionalAttribute(.id),
                            content: node.requiredChildElement([.beatRepeat, .measureRepeat, .multipleRest, .slash], parseMeasureStyleContent),
                            number: node.valueOfOptionalAttribute(.number, parseStaffNumber),
                            font: parseFont(node),
                            color: parseColor(node))
    }

    internal static func parseMeasureStyleContent(_ node: Node) throws -> MXLMeasureStyle.Content {
        switch node.element {
        case .beatRepeat:
            try .beatRepeat(parseBeatRepeat(node))

        case .measureRepeat:
            try .measureRepeat(parseMeasureRepeat(node))

        case .multipleRest:
            try .multipleRest(parseMultipleRest(node))

        case .slash:
            try .slash(parseSlash(node))

        default:
            try node.unexpectedElement([.beatRepeat, .measureRepeat, .multipleRest, .slash])
        }
    }

    internal static func parseMultipleRest(_ node: Node) throws -> MXLMultipleRest {
        try MXLMultipleRest(value: node.value.flatMap(parseInt) ?? 1,
                            usesSymbols: node.valueOfOptionalAttribute(.useSymbols, parseYesNo))
    }

    internal static func parseNonTraditionalKey(_ node: Node) throws -> MXLNonTraditionalKey {
        try MXLNonTraditionalKey(step: node.valueOfRequiredChildElement(.keyStep, parseStep),
                                 alter: node.valueOfRequiredChildElement(.keyAlter, parseSemitones),
                                 accidental: node.optionalChildElement(.keyAccidental, parseKeyAccidental))
    }

    internal static func parseOctaveChange(_ text: String) -> MXLOctaveChange? {
        Int(text).flatMap(MXLOctaveChange.init(intValue:))
    }

    internal static func parsePositiveDivisions(_ text: String) -> MXLPositiveDivisions? {
        Int(text).flatMap(MXLPositiveDivisions.init(intValue:))
    }

internal static func parseShowTuplet(_ text: String) -> MXLShowTuplet? {
        switch text {
        case "actual":
            .actual

        case "both":
            .both

        case "none":
            .neither

        default:
            nil
        }
    }

    internal static func parseSlash(_ node: Node) throws -> MXLSlash {
        try MXLSlash(content: node.hasChildElement([.exceptVoice, .slashType]) ? parseSlashContent(node) : nil,
                     kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                     usesDots: node.valueOfOptionalAttribute(.useDots, parseYesNo),
                     usesStems: node.valueOfOptionalAttribute(.useStems, parseYesNo))
    }

    internal static func parseSlashContent(_ node: Node) throws -> MXLSlashContent {
        try MXLSlashContent(group: node.hasChildElement(.slashType) ? parseSlashContentGroup(node) : nil,
                            exceptVoice: node.optionalChildElements(.exceptVoice) { $0.value ?? "" })
    }

    internal static func parseSlashContentGroup(_ node: Node) throws -> MXLSlashContent.Group {
        try MXLSlashContent.Group(slashKind: node.valueOfRequiredChildElement(.slashType, parseNoteKindValue),
                                  slashDot: node.allChildElements(.slashDot).count)
    }

    internal static func parseStaffDetails(_ node: Node) throws -> MXLStaffDetails {
        try MXLStaffDetails(staffKind: node.valueOfOptionalChildElement(.staffType, parseStaffDetailsKind),
                            group: node.hasChildElement(.staffLines) ? parseStaffDetailsGroup(node) : nil,
                            staffTuning: node.optionalChildElements(.staffTuning, parseStaffTuning),
                            capo: node.valueOfOptionalChildElement(.capo, parseInt),
                            staffSize: node.optionalChildElement(.staffSize, parseStaffSize),
                            number: node.valueOfOptionalAttribute(.number, parseStaffNumber),
                            showFrets: node.valueOfOptionalAttribute(.showFrets, parseShowFrets),
                            printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                            printsSpacing: node.valueOfOptionalAttribute(.printSpacing, parseYesNo))
    }

    internal static func parseStaffDetailsGroup(_ node: Node) throws -> MXLStaffDetails.Group {
        try MXLStaffDetails.Group(staffLines: node.valueOfRequiredChildElement(.staffLines, parseInt),
                                  lineDetail: node.optionalChildElements(.lineDetail, parseLineDetail))
    }

    internal static func parseStaffDetailsKind(_ text: String) -> MXLStaffDetails.Kind? {
        switch text {
        case "alternate":
            .alternate

        case "cue":
            .cue

        case "editorial":
            .editorial

        case "ossia":
            .ossia

        case "regular":
            .regular

        default:
            nil
        }
    }

    internal static func parseStaffDivide(_ node: Node) throws -> MXLStaffDivide {
        try MXLStaffDivide(id: node.valueOfOptionalAttribute(.id),
                           kind: node.valueOfRequiredAttribute(.type, parseStaffDivideSymbol),
                           position: parsePosition(node),
                           font: parseFont(node),
                           color: parseColor(node),
                           halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                           valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parseStaffDivideSymbol(_ text: String) -> MXLStaffDivide.Symbol? {
        switch text {
        case "down":
            .down

        case "up":
            .up

        case "up-down":
            .upDown

        default:
            nil
        }
    }

    internal static func parseStaffLine(_ text: String) -> MXLStaffLine? {
        UInt(text).flatMap(MXLStaffLine.init(uintValue:))
    }

    internal static func parseStaffLinePosition(_ text: String) -> MXLStaffLinePosition? {
        Int(text).flatMap(MXLStaffLinePosition.init(intValue:))
    }

    internal static func parseStaffSize(_ node: Node) throws -> MXLStaffSize {
        try MXLStaffSize(value: node.value.flatMap(parseDouble) ?? 100,
                         scaling: node.valueOfOptionalAttribute(.scaling, parseNonNegativeDecimal))
    }

    internal static func parseStaffTuning(_ node: Node) throws -> MXLStaffTuning {
        try MXLStaffTuning(tuning: parseTuning(node),
                           line: node.valueOfRequiredAttribute(.line, parseStaffLine))
    }

    internal static func parseTime(_ node: Node) throws -> MXLTime {
        try MXLTime(id: node.valueOfOptionalAttribute(.id),
                    content: parseTimeContent(node),
                    number: node.valueOfOptionalAttribute(.number, parseStaffNumber),
                    symbol: node.valueOfOptionalAttribute(.symbol, parseTimeSymbol),
                    separator: node.valueOfOptionalAttribute(.separator, parseTimeSeparator),
                    position: parsePosition(node),
                    font: parseFont(node),
                    color: parseColor(node),
                    halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                    valign: node.valueOfOptionalAttribute(.valign, parseValign),
                    printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseTimeContent(_ node: Node) throws -> MXLTime.Content {
        if node.hasChildElement(.senzaMisura) {
            return try .senzaMisura(node.valueOfRequiredChildElement(.senzaMisura))
        }

        return try .timeSignature(parseTimeSignatures(node),
                                  interchangeable: node.optionalChildElement(.interchangeable, parseInterchangeable))
    }

    internal static func parseTimeRelation(_ text: String) -> MXLTimeRelation? {
        switch text {
        case "bracket":
            .bracket

        case "equals":
            .equals

        case "hyphen":
            .hyphen

        case "parentheses":
            .parentheses

        case "slash":
            .slash

        case "space":
            .space

        default:
            nil
        }
    }

    internal static func parseTimeSeparator(_ text: String) -> MXLTimeSeparator? {
        switch text {
        case "adjacent":
            .adjacent

        case "diagonal":
            .diagonal

        case "horizontal":
            .horizontal

        case "none":
            .stacked

        case "vertical":
            .vertical

        default:
            nil
        }
    }

    internal static func parseTimeSignatures(_ node: Node) -> [MXLTimeSignature] {
        let pairs = node.allChildElements([.beats, .beatType])
        var result: [MXLTimeSignature] = []
        var index = 0

        while index + 1 < pairs.count {
            result.append(MXLTimeSignature(beats: pairs[index].value ?? "",
                                           beatType: pairs[index + 1].value ?? ""))
            index += 2
        }

        return result
    }

    internal static func parseTimeSymbol(_ text: String) -> MXLTimeSymbol? {
        switch text {
        case "common":
            .common

        case "cut":
            .cut

        case "dotted-note":
            .dottedNote

        case "normal":
            .normal

        case "note":
            .note

        case "single-number":
            .singleNumber

        default:
            nil
        }
    }

    internal static func parseTraditionalKey(_ node: Node) throws -> MXLTraditionalKey {
        try MXLTraditionalKey(cancel: node.optionalChildElement(.cancel, parseCancel),
                              fifths: node.valueOfRequiredChildElement(.fifths, parseFifths),
                              mode: node.valueOfOptionalChildElement(.mode))
    }

    internal static func parseTranspose(_ node: Node) throws -> MXLTranspose {
        try MXLTranspose(id: node.valueOfOptionalAttribute(.id),
                         content: parseTransposeContent(node),
                         number: node.valueOfOptionalAttribute(.number, parseStaffNumber))
    }

    internal static func parseTransposeContent(_ node: Node) throws -> MXLTranspose.Content {
        try MXLTranspose.Content(diatonic: node.valueOfOptionalChildElement(.diatonic, parseDiatonicSteps),
                                 chromatic: node.valueOfRequiredChildElement(.chromatic, parseSemitones),
                                 octaveChange: node.valueOfOptionalChildElement(.octaveChange, parseOctaveChange),
                                 double: node.optionalChildElement(.double, parseDouble))
    }
}
