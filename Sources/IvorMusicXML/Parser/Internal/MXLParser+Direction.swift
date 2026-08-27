// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseAccordionMiddle(_ text: String) -> MXLAccordionMiddle? {
        UInt(text).flatMap(MXLAccordionMiddle.init(uintValue:))
    }

    internal static func parseAccordionRegistration(_ node: Node) throws -> MXLAccordionRegistration {
        try MXLAccordionRegistration(id: node.valueOfOptionalAttribute(.id),
                                     hasHighDot: node.hasChildElement(.accordionHigh),
                                     accordionMiddle: node.valueOfOptionalChildElement(.accordionMiddle, parseAccordionMiddle),
                                     hasLowDot: node.hasChildElement(.accordionLow),
                                     position: parsePosition(node),
                                     font: parseFont(node),
                                     color: parseColor(node),
                                     halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                                     valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parseBracket(_ node: Node) throws -> MXLBracket {
        try MXLBracket(id: node.valueOfOptionalAttribute(.id),
                       kind: node.valueOfRequiredAttribute(.type, parseStartStopContinue),
                       number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                       lineEnd: node.valueOfRequiredAttribute(.lineEnd, parseLineEnd),
                       endLength: node.valueOfOptionalAttribute(.endLength, parseTenths),
                       lineKind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                       dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                       spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                       position: parsePosition(node),
                       color: parseColor(node))
    }

    internal static func parseCoda(_ node: Node) throws -> MXLCoda {
        try MXLCoda(id: node.valueOfOptionalAttribute(.id),
                    position: parsePosition(node),
                    font: parseFont(node),
                    color: parseColor(node),
                    halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                    valign: node.valueOfOptionalAttribute(.valign, parseValign),
                    smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflCodaGlyphName))
    }

    internal static func parseDashedFormatting(_ node: Node) throws -> MXLDashedFormatting {
        try MXLDashedFormatting(dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                                spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths))
    }

    internal static func parseDashes(_ node: Node) throws -> MXLDashes {
        try MXLDashes(id: node.valueOfOptionalAttribute(.id),
                      kind: node.valueOfRequiredAttribute(.type, parseStartStopContinue),
                      number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                      dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                      spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                      position: parsePosition(node),
                      color: parseColor(node))
    }

    internal static func parseDirection(_ node: Node) throws -> MXLDirection {
        try MXLDirection(id: node.valueOfOptionalAttribute(.id),
                         kind: node.requiredChildElements(.directionType, parseDirectionKind),
                         offset: node.optionalChildElement(.offset, parseOffset),
                         footnote: node.optionalChildElement(.footnote, parseFormattedText),
                         level: node.optionalChildElement(.level, parseLevel),
                         voice: node.optionalChildElement(.voice, parseVoice),
                         staff: node.optionalChildElement(.staff, parseStaff),
                         sound: node.optionalChildElement(.sound, parseSound),
                         listening: node.optionalChildElement(.listening, parseListening),
                         placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                         isDirective: node.valueOfOptionalAttribute(.directive, parseYesNo),
                         system: node.valueOfOptionalAttribute(.system, parseSystemRelation))
    }

    internal static func parseDirectionKind(_ node: Node) throws -> MXLDirection.Kind {
        try MXLDirection.Kind(id: node.valueOfOptionalAttribute(.id),
                              content: parseDirectionKindContent(node))
    }

    internal static func parseDirectionKindContent(_ node: Node) throws -> MXLDirection.Kind.Content {
        switch node.firstChildElement([.accordionRegistration,
                                       .bracket,
                                       .coda,
                                       .damp,
                                       .dampAll,
                                       .dashes,
                                       .dynamics,
                                       .eyeglasses,
                                       .harpPedals,
                                       .image,
                                       .metronome,
                                       .octaveShift,
                                       .otherDirection,
                                       .pedal,
                                       .percussion,
                                       .principalVoice,
                                       .rehearsal,
                                       .scordatura,
                                       .segno,
                                       .staffDivide,
                                       .stringMute,
                                       .symbol,
                                       .wedge,
                                       .words])?.element {
        case .accordionRegistration:
            try .accordionRegistration(node.requiredChildElement(.accordionRegistration, parseAccordionRegistration))

        case .bracket:
            try .bracket(node.requiredChildElement(.bracket, parseBracket))

        case .coda:
            try .coda(node.requiredChildElements(.coda, parseCoda))

        case .damp:
            try .damp(node.requiredChildElement(.damp, parseEmptyPrintStyleAlignID))

        case .dampAll:
            try .dampAll(node.requiredChildElement(.dampAll, parseEmptyPrintStyleAlignID))

        case .dashes:
            try .dashes(node.requiredChildElement(.dashes, parseDashes))

        case .dynamics:
            try .dynamics(node.requiredChildElements(.dynamics, parseDynamics))

        case .eyeglasses:
            try .eyeglasses(node.requiredChildElement(.eyeglasses, parseEmptyPrintStyleAlignID))

        case .harpPedals:
            try .harpPedals(node.requiredChildElement(.harpPedals, parseHarpPedals))

        case .image:
            try .image(node.requiredChildElement(.image, parseImage))

        case .metronome:
            try .metronome(node.requiredChildElement(.metronome, parseMetronome))

        case .octaveShift:
            try .octaveShift(node.requiredChildElement(.octaveShift, parseOctaveShift))

        case .otherDirection:
            try .otherDirection(node.requiredChildElement(.otherDirection, parseOtherDirection))

        case .pedal:
            try .pedal(node.requiredChildElement(.pedal, parsePedal))

        case .percussion:
            try .percussion(node.requiredChildElements(.percussion, parsePercussion))

        case .principalVoice:
            try .principalVoice(node.requiredChildElement(.principalVoice, parsePrincipalVoice))

        case .rehearsal:
            try .rehearsal(node.requiredChildElements(.rehearsal, parseFormattedTextID))

        case .scordatura:
            try .scordatura(node.requiredChildElement(.scordatura, parseScordatura))

        case .segno:
            try .segno(node.requiredChildElements(.segno, parseSegno))

        case .staffDivide:
            try .staffDivide(node.requiredChildElement(.staffDivide, parseStaffDivide))

        case .stringMute:
            try .stringMute(node.requiredChildElement(.stringMute, parseStringMute))

        case .symbol:
            try .symbol(node.requiredChildElement(.symbol, parseFormattedSymbolID))

        case .wedge:
            try .wedge(node.requiredChildElement(.wedge, parseWedge))

        case .words:
            try .words(node.requiredChildElement(.words, parseFormattedTextID))

        default:
            try node.unexpectedElement([.accordionRegistration,
                                        .bracket,
                                        .coda,
                                        .damp,
                                        .dampAll,
                                        .dashes,
                                        .dynamics,
                                        .eyeglasses,
                                        .harpPedals,
                                        .image,
                                        .metronome,
                                        .octaveShift,
                                        .otherDirection,
                                        .pedal,
                                        .percussion,
                                        .principalVoice,
                                        .rehearsal,
                                        .scordatura,
                                        .segno,
                                        .staffDivide,
                                        .stringMute,
                                        .symbol,
                                        .wedge,
                                        .words])
        }
    }

    internal static func parseDynamics(_ node: Node) throws -> MXLDynamics {
        try MXLDynamics(id: node.valueOfOptionalAttribute(.id),
                        items: node.optionalChildElements([.f,
                                                           .ff,
                                                           .fff,
                                                           .ffff,
                                                           .fffff,
                                                           .ffffff,
                                                           .fp,
                                                           .fz,
                                                           .mf,
                                                           .mp,
                                                           .n,
                                                           .otherDynamics,
                                                           .p,
                                                           .pf,
                                                           .pp,
                                                           .ppp,
                                                           .pppp,
                                                           .ppppp,
                                                           .pppppp,
                                                           .rf,
                                                           .rfz,
                                                           .sf,
                                                           .sffz,
                                                           .sfp,
                                                           .sfpp,
                                                           .sfz,
                                                           .sfzp], parseDynamicsItem),
                        position: parsePosition(node),
                        font: parseFont(node),
                        color: parseColor(node),
                        halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                        valign: node.valueOfOptionalAttribute(.valign, parseValign),
                        placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                        underline: node.valueOfOptionalAttribute(.underline, parseNumberOfLines),
                        overline: node.valueOfOptionalAttribute(.overline, parseNumberOfLines),
                        lineThrough: node.valueOfOptionalAttribute(.lineThrough, parseNumberOfLines),
                        enclosure: node.valueOfOptionalAttribute(.enclosure, parseEnclosureShape))
    }
}
