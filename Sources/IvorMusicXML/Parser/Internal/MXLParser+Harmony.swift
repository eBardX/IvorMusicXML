// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiTools
internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseAccord(_ node: Node) throws -> MXLAccord {
        try MXLAccord(tuning: parseTuning(node),
                      string: node.valueOfOptionalChildElement(.string, parseStringNumber))
    }

    internal static func parseBarre(_ node: Node) throws -> MXLBarre {
        try MXLBarre(kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                     color: parseColor(node))
    }

    internal static func parseBass(_ node: Node) throws -> MXLBass {
        try MXLBass(separator: node.optionalChildElement(.bassSeparator, parseStyleText),
                    step: node.requiredChildElement(.bassStep, parseBassStep),
                    alter: node.optionalChildElement(.bassAlter, parseHarmonyAlter),
                    arrangement: node.valueOfOptionalAttribute(.arrangement, parseHarmonyArrangement))
    }

    internal static func parseBassStep(_ node: Node) throws -> MXLBass.Step {
        try MXLBass.Step(value: node.requiredValue(parseStep),
                         text: node.valueOfOptionalAttribute(.text),
                         position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node))
    }

    internal static func parseDegree(_ node: Node) throws -> MXLDegree {
        try MXLDegree(value: node.requiredChildElement(.degreeValue, parseDegreeValue),
                      alter: node.requiredChildElement(.degreeAlter, parseDegreeAlter),
                      kind: node.requiredChildElement(.degreeType, parseDegreeKind),
                      printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseDegreeAlter(_ node: Node) throws -> MXLDegree.Alter {
        try MXLDegree.Alter(value: node.value.flatMap(parseDouble) ?? 0,
                            position: parsePosition(node),
                            font: parseFont(node),
                            color: parseColor(node),
                            usesPlusMinus: node.valueOfOptionalAttribute(.plusMinus, parseYesNo))
    }

    internal static func parseDegreeKind(_ node: Node) throws -> MXLDegree.Kind {
        try MXLDegree.Kind(value: node.requiredValue(parseDegreeKindValue),
                           text: node.valueOfOptionalAttribute(.text),
                           position: parsePosition(node),
                           font: parseFont(node),
                           color: parseColor(node))
    }

    internal static func parseDegreeKindValue(_ text: String) -> MXLDegree.Kind.Value? {
        switch text {
        case "add":
            .add

        case "alter":
            .alter

        case "subtract":
            .subtract

        default:
            nil
        }
    }

    internal static func parseDegreeSymbolValue(_ text: String) -> MXLDegree.SymbolValue? {
        switch text {
        case "augmented":
            .augmented

        case "diminished":
            .diminished

        case "half-diminished":
            .halfDiminished

        case "major":
            .major

        case "minor":
            .minor

        default:
            nil
        }
    }

    internal static func parseDegreeValue(_ node: Node) throws -> MXLDegree.Value {
        try MXLDegree.Value(value: node.value.flatMap(parseInt) ?? 1,
                            symbol: node.valueOfOptionalAttribute(.symbol, parseDegreeSymbolValue),
                            text: node.valueOfOptionalAttribute(.text),
                            position: parsePosition(node),
                            font: parseFont(node),
                            color: parseColor(node))
    }

    internal static func parseFigure(_ node: Node) throws -> MXLFigure {
        try MXLFigure(prefix: node.optionalChildElement(.prefix, parseStyleText),
                      number: node.optionalChildElement(.figureNumber, parseStyleText),
                      suffix: node.optionalChildElement(.suffix, parseStyleText),
                      extend: node.optionalChildElement(.extend, parseExtend),
                      footnote: node.optionalChildElement(.footnote, parseFormattedText),
                      level: node.optionalChildElement(.level, parseLevel))
    }

    internal static func parseFiguredBass(_ node: Node) throws -> MXLFiguredBass {
        try MXLFiguredBass(id: node.valueOfOptionalAttribute(.id),
                           figure: node.requiredChildElements(.figure, parseFigure),
                           duration: node.valueOfOptionalChildElement(.duration, parsePositiveDivisions),
                           footnote: node.optionalChildElement(.footnote, parseFormattedText),
                           level: node.optionalChildElement(.level, parseLevel),
                           position: parsePosition(node),
                           font: parseFont(node),
                           color: parseColor(node),
                           halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                           valign: node.valueOfOptionalAttribute(.valign, parseValign),
                           placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                           printout: parsePrintout(node),
                           hasParentheses: node.valueOfOptionalAttribute(.parentheses, parseYesNo))
    }

    internal static func parseFirstFret(_ node: Node) throws -> MXLFirstFret {
        try MXLFirstFret(value: node.value.flatMap(parseInt) ?? 1,
                         text: node.valueOfOptionalAttribute(.text),
                         location: node.valueOfOptionalAttribute(.location, parseLeftRight))
    }

    internal static func parseFrame(_ node: Node) throws -> MXLFrame {
        try MXLFrame(id: node.valueOfOptionalAttribute(.id),
                     strings: node.valueOfRequiredChildElement(.frameStrings, parseInt),
                     frets: node.valueOfRequiredChildElement(.frameFrets, parseInt),
                     firstFret: node.optionalChildElement(.firstFret, parseFirstFret),
                     note: node.requiredChildElements(.frameNote, parseFrameNote),
                     position: parsePosition(node),
                     color: parseColor(node),
                     halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                     valign: node.valueOfOptionalAttribute(.valign, parseValignImage),
                     height: node.valueOfOptionalAttribute(.height, parseTenths),
                     width: node.valueOfOptionalAttribute(.width, parseTenths),
                     unplayed: node.valueOfOptionalAttribute(.unplayed))
    }

    internal static func parseFrameNote(_ node: Node) throws -> MXLFrame.Note {
        try MXLFrame.Note(string: node.requiredChildElement(.string, parseString),
                          fret: node.requiredChildElement(.fret, parseFret),
                          fingering: node.optionalChildElement(.fingering, parseFingering),
                          barre: node.optionalChildElement(.barre, parseBarre))
    }

    internal static func parseHarmony(_ node: Node) throws -> MXLHarmony {
        try MXLHarmony(id: node.valueOfOptionalAttribute(.id),
                       chord: parseHarmonyChords(node),
                       frame: node.optionalChildElement(.frame, parseFrame),
                       offset: node.optionalChildElement(.offset, parseOffset),
                       footnote: node.optionalChildElement(.footnote, parseFormattedText),
                       level: node.optionalChildElement(.level, parseLevel),
                       staff: node.optionalChildElement(.staff, parseStaff),
                       kind: node.valueOfOptionalAttribute(.type, parseHarmonyKind),
                       printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                       printsFrame: node.valueOfOptionalAttribute(.printFrame, parseYesNo),
                       arrangement: node.valueOfOptionalAttribute(.arrangement, parseHarmonyArrangement),
                       position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                       system: node.valueOfOptionalAttribute(.system, parseSystemRelation))
    }

    internal static func parseHarmonyAlter(_ node: Node) throws -> MXLHarmonyAlter {
        try MXLHarmonyAlter(value: node.value.flatMap(parseDouble) ?? 0,
                            printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                            position: parsePosition(node),
                            font: parseFont(node),
                            color: parseColor(node),
                            location: node.valueOfOptionalAttribute(.location, parseLeftRight))
    }

    internal static func parseHarmonyArrangement(_ text: String) -> MXLHarmonyArrangement? {
        switch text {
        case "diagonal":
            .diagonal

        case "horizontal":
            .horizontal

        case "vertical":
            .vertical

        default:
            nil
        }
    }

    internal static func parseHarmonyChordContent(_ node: Node) throws -> MXLHarmony.Chord.Content {
        if node.hasChildElement(.numeral) {
            return try .numeral(node.requiredChildElement(.numeral, parseNumeral))
        }

        if node.hasChildElement(.function) {
            return try .function(node.requiredChildElement(.function, parseStyleText))
        }

        return try .root(node.requiredChildElement(.root, parseRoot))
    }

    internal static func parseHarmonyChordKind(_ node: Node) throws -> MXLHarmony.Chord.Kind {
        try MXLHarmony.Chord.Kind(value: node.requiredValue(parseHarmonyChordKindValue),
                                  usesSymbols: node.valueOfOptionalAttribute(.useSymbols, parseYesNo),
                                  text: node.valueOfOptionalAttribute(.text),
                                  areDegreesStacked: node.valueOfOptionalAttribute(.stackDegrees, parseYesNo),
                                  areDegreesInParentheses: node.valueOfOptionalAttribute(.parenthesesDegrees, parseYesNo),
                                  areDegreesBracketed: node.valueOfOptionalAttribute(.bracketDegrees, parseYesNo),
                                  position: parsePosition(node),
                                  font: parseFont(node),
                                  color: parseColor(node),
                                  halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                                  valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parseHarmonyChordKindValue(_ text: String) -> MXLHarmony.Chord.Kind.Value? {
        switch text {
        case "augmented":
            .augmented

        case "augmented-seventh":
            .augmentedSeventh

        case "diminished":
            .diminished

        case "diminished-seventh":
            .diminishedSeventh

        case "dominant":
            .dominant

        case "dominant-11th":
            .dominant11th

        case "dominant-13th":
            .dominant13th

        case "dominant-ninth":
            .dominantNinth

        case "French":
            .french

        case "German":
            .german

        case "half-diminished":
            .halfDiminished

        case "Italian":
            .italian

        case "major":
            .major

        case "major-11th":
            .major11th

        case "major-13th":
            .major13th

        case "major-minor":
            .majorMinor

        case "major-ninth":
            .majorNinth

        case "major-seventh":
            .majorSeventh

        case "major-sixth":
            .majorSixth

        case "minor":
            .minor

        case "minor-11th":
            .minor11th

        case "minor-13th":
            .minor13th

        case "minor-ninth":
            .minorNinth

        case "minor-seventh":
            .minorSeventh

        case "minor-sixth":
            .minorSixth

        case "Neapolitan":
            .neapolitan

        case "none":
            .noChord

        case "other":
            .other

        case "pedal":
            .pedal

        case "power":
            .power

        case "suspended-fourth":
            .suspendedFourth

        case "suspended-second":
            .suspendedSecond

        case "Tristan":
            .tristan

        default:
            nil
        }
    }

    internal static func parseHarmonyChords(_ node: Node) throws -> [MXLHarmony.Chord] {
        let kindNodes = node.allChildElements(.kind)

        return try kindNodes.map { kindNode in
            try MXLHarmony.Chord(content: parseHarmonyChordContent(node),
                                 kind: parseHarmonyChordKind(kindNode),
                                 inversion: node.optionalChildElement(.inversion, parseInversion),
                                 bass: node.optionalChildElement(.bass, parseBass),
                                 degree: node.optionalChildElements(.degree, parseDegree))
        }
    }

    internal static func parseHarmonyKind(_ text: String) -> MXLHarmony.Kind? {
        switch text {
        case "alternate":
            .alternate

        case "explicit":
            .explicit

        case "implied":
            .implied

        default:
            nil
        }
    }

    internal static func parseInversion(_ node: Node) throws -> MXLInversion {
        try MXLInversion(value: node.value.flatMap(parseInt) ?? 0,
                         text: node.valueOfOptionalAttribute(.text),
                         position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node))
    }

    internal static func parseNumeral(_ node: Node) throws -> MXLNumeral {
        try MXLNumeral(root: node.requiredChildElement(.numeralRoot, parseNumeralRoot),
                       alter: node.optionalChildElement(.numeralAlter, parseHarmonyAlter),
                       key: node.optionalChildElement(.numeralKey, parseNumeralKey))
    }

    internal static func parseNumeralKey(_ node: Node) throws -> MXLNumeral.Key {
        try MXLNumeral.Key(fifths: node.valueOfRequiredChildElement(.numeralFifths, parseFifths),
                           mode: node.valueOfRequiredChildElement(.numeralMode, parseNumeralMode),
                           printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseNumeralMode(_ text: String) -> MXLNumeral.Mode? {
        switch text {
        case "harmonic minor":
            .harmonicMinor

        case "major":
            .major

        case "melodic minor":
            .melodicMinor

        case "minor":
            .minor

        case "natural minor":
            .naturalMinor

        default:
            nil
        }
    }

    internal static func parseNumeralRoot(_ node: Node) throws -> MXLNumeral.Root {
        try MXLNumeral.Root(value: node.value.flatMap(parseNumeralValue) ?? 1,
                            text: node.valueOfOptionalAttribute(.text),
                            position: parsePosition(node),
                            font: parseFont(node),
                            color: parseColor(node))
    }

    internal static func parseNumeralValue(_ text: String) -> MXLNumeral.Value? {
        UInt(text).flatMap(MXLNumeral.Value.init(uintValue:))
    }

    internal static func parseRoot(_ node: Node) throws -> MXLRoot {
        try MXLRoot(step: node.requiredChildElement(.rootStep, parseRootStep),
                    alter: node.optionalChildElement(.rootAlter, parseHarmonyAlter))
    }

    internal static func parseRootStep(_ node: Node) throws -> MXLRoot.Step {
        try MXLRoot.Step(value: node.requiredValue(parseStep),
                         text: node.valueOfOptionalAttribute(.text),
                         position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node))
    }

    internal static func parseShowFrets(_ text: String) -> MXLShowFrets? {
        switch text {
        case "letters":
            .letters

        case "numbers":
            .numbers

        default:
            nil
        }
    }

    internal static func parseStringNumber(_ text: String) -> MXLStringNumber? {
        UInt(text).flatMap(MXLStringNumber.init(uintValue:))
    }
}
