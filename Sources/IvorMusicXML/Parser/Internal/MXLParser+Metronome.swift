// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseBeatUnit(_ node: Node) throws -> MXLBeatUnit {
        try MXLBeatUnit(beatUnit: node.valueOfRequiredChildElement(.beatUnit, parseNoteKindValue),
                        dot: node.allChildElements(.beatUnitDot).count)
    }

    internal static func parseMetronome(_ node: Node) throws -> MXLMetronome {
        try MXLMetronome(id: node.valueOfOptionalAttribute(.id),
                         content: parseMetronomeContent(node),
                         position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node),
                         halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                         valign: node.valueOfOptionalAttribute(.valign, parseValign),
                         printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                         justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight),
                         hasParentheses: node.valueOfOptionalAttribute(.parentheses, parseYesNo))
    }

    internal static func parseMetronomeBeatUnitTied(_ node: Node) throws -> MXLMetronome.BeatUnitTied {
        try MXLMetronome.BeatUnitTied(beatUnit: node.valueOfRequiredChildElement(.beatUnit, parseNoteKindValue),
                                      beatUnitDot: node.allChildElements(.beatUnitDot).count)
    }

    internal static func parseMetronomeContent(_ node: Node) throws -> MXLMetronome.Content {
        if node.hasChildElement([.metronomeArrows, .metronomeNote]) {
            let hasRelation = node.hasChildElement(.metronomeRelation)

            return try .metronomeArrows(hasMetronomeArrows: node.hasChildElement(.metronomeArrows),
                                        note: node.requiredChildElements(.metronomeNote, parseMetronomeNote),
                                        relation: hasRelation ?
                                            (node.valueOfOptionalChildElement(.metronomeRelation) ?? "equals") : nil,
                                        secondNote: hasRelation ?
                                            node.optionalChildElements(.metronomeNote, parseMetronomeNote) : [])
        }

        return try .beatUnit(parseBeatUnit(node),
                             tied: node.optionalChildElements(.beatUnitTied, parseMetronomeBeatUnitTied),
                             content: parseMetronomeContentBeatUnitContent(node))
    }

    internal static func parseMetronomeContentBeatUnitContent(_ node: Node) throws -> MXLMetronome.Content.BeatUnitContent {
        if node.hasChildElement(.perMinute) {
            return try .perMinute(node.requiredChildElement(.perMinute, parsePerMinute))
        }

        let secondBeatUnits = node.allChildElements(.beatUnit)
        let secondBeatUnitTieds = node.allChildElements(.beatUnitTied)

        return try .beatUnit(MXLBeatUnit(beatUnit: secondBeatUnits.count > 1
                                         ? secondBeatUnits[1].requiredValue(parseNoteKindValue)
                                         : .quarter,
                                         dot: 0),
                             tied: secondBeatUnitTieds.count > 1 ? [parseMetronomeBeatUnitTied(secondBeatUnitTieds[1])] : [])
    }

internal static func parseMetronomeNote(_ node: Node) throws -> MXLMetronome.Note {
        try MXLMetronome.Note(kind: node.valueOfRequiredChildElement(.metronomeType, parseNoteKindValue),
                              dot: node.allChildElements(.metronomeDot).count,
                              beam: node.optionalChildElements(.metronomeBeam, parseMetronomeNoteBeam),
                              tied: node.optionalChildElement(.metronomeTied, parseMetronomeNoteTied),
                              tuplet: node.optionalChildElement(.metronomeTuplet, parseMetronomeNoteTuplet))
    }

    internal static func parseMetronomeNoteBeam(_ node: Node) throws -> MXLMetronome.Note.Beam {
        try MXLMetronome.Note.Beam(value: node.requiredValue(parseBeamValue),
                                   number: node.valueOfOptionalAttribute(.number, parseBeamLevel))
    }

    internal static func parseMetronomeNoteTied(_ node: Node) throws -> MXLMetronome.Note.Tied {
        try MXLMetronome.Note.Tied(kind: node.valueOfRequiredAttribute(.type, parseStartStop))
    }

    internal static func parseMetronomeNoteTuplet(_ node: Node) throws -> MXLMetronome.Note.Tuplet {
        try MXLMetronome.Note.Tuplet(timeModification: parseTimeModification(node),
                                     kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                                     hasBracket: node.valueOfOptionalAttribute(.bracket, parseYesNo),
                                     showNumber: node.valueOfOptionalAttribute(.showNumber, parseShowTuplet))
    }

    internal static func parsePerMinute(_ node: Node) throws -> MXLPerMinute {
        try MXLPerMinute(value: node.value ?? "",
                         font: parseFont(node))
    }
}
