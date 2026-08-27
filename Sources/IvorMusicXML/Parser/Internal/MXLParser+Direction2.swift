// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseDynamicsItem(_ node: Node) throws -> MXLDynamics.Item {
        switch node.element {
        case .f:
            .f

        case .ff:
            .ff

        case .fff:
            .fff

        case .ffff:
            .ffff

        case .fffff:
            .fffff

        case .ffffff:
            .ffffff

        case .fp:
            .fp

        case .fz:
            .fz

        case .mf:
            .mf

        case .mp:
            .mp

        case .n:
            .n

        case .otherDynamics:
            try .otherDynamics(parseOtherText(node))

        case .p:
            .p

        case .pf:
            .pf

        case .pp:
            .pp

        case .ppp:
            .ppp

        case .pppp:
            .pppp

        case .ppppp:
            .ppppp

        case .pppppp:
            .pppppp

        case .rf:
            .rf

        case .rfz:
            .rfz

        case .sf:
            .sf

        case .sffz:
            .sffz

        case .sfp:
            .sfp

        case .sfpp:
            .sfpp

        case .sfz:
            .sfz

        case .sfzp:
            .sfzp

        default:
            try node.unexpectedElement([.f,
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
                                        .sfzp])
        }
    }

    internal static func parseHarpPedals(_ node: Node) throws -> MXLHarpPedals {
        try MXLHarpPedals(id: node.valueOfOptionalAttribute(.id),
                          pedalTuning: node.requiredChildElements(.pedalTuning, parsePedalTuning),
                          position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                          valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parseOctaveShift(_ node: Node) throws -> MXLOctaveShift {
        try MXLOctaveShift(id: node.valueOfOptionalAttribute(.id),
                           kind: node.valueOfRequiredAttribute(.type, parseUpDownStopContinue),
                           number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                           size: node.valueOfOptionalAttribute(.size, parseInt),
                           dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                           spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                           position: parsePosition(node),
                           font: parseFont(node),
                           color: parseColor(node))
    }

    internal static func parseOtherDirection(_ node: Node) throws -> MXLOtherDirection {
        try MXLOtherDirection(id: node.valueOfOptionalAttribute(.id),
                              value: node.value ?? "",
                              printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                              position: parsePosition(node),
                              font: parseFont(node),
                              color: parseColor(node),
                              halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                              valign: node.valueOfOptionalAttribute(.valign, parseValign),
                              smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))
    }

    internal static func parsePedal(_ node: Node) throws -> MXLPedal {
        try MXLPedal(id: node.valueOfOptionalAttribute(.id),
                     kind: node.valueOfRequiredAttribute(.type, parsePedalKind),
                     number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                     usesLines: node.valueOfOptionalAttribute(.line, parseYesNo),
                     usesSigns: node.valueOfOptionalAttribute(.sign, parseYesNo),
                     isAbbreviated: node.valueOfOptionalAttribute(.abbreviated, parseYesNo),
                     position: parsePosition(node),
                     font: parseFont(node),
                     color: parseColor(node),
                     halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                     valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parsePedalKind(_ text: String) -> MXLPedal.Kind? {
        switch text {
        case "change":
            .change

        case "continue":
            .continue

        case "discontinue":
            .discontinue

        case "resume":
            .resume

        case "sostenuto":
            .sostenuto

        case "start":
            .start

        case "stop":
            .stop

        default:
            nil
        }
    }

    internal static func parsePedalTuning(_ node: Node) throws -> MXLPedalTuning {
        try MXLPedalTuning(pedalStep: node.valueOfRequiredChildElement(.pedalStep, parseStep),
                           pedalAlter: node.valueOfRequiredChildElement(.pedalAlter, parseSemitones))
    }

    internal static func parsePrincipalVoice(_ node: Node) throws -> MXLPrincipalVoice {
        try MXLPrincipalVoice(id: node.valueOfOptionalAttribute(.id),
                              value: node.value ?? "",
                              kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                              symbol: node.valueOfRequiredAttribute(.symbol, parsePrincipalVoiceSymbol),
                              position: parsePosition(node),
                              font: parseFont(node),
                              color: parseColor(node),
                              halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                              valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parsePrincipalVoiceSymbol(_ text: String) -> MXLPrincipalVoice.Symbol? {
        switch text {
        case "Hauptstimme":
            .hauptstimme

        case "Nebenstimme":
            .nebenstimme

        case "none":
            .invisible

        case "plain":
            .plain

        default:
            nil
        }
    }

    internal static func parseScordatura(_ node: Node) throws -> MXLScordatura {
        try MXLScordatura(id: node.valueOfOptionalAttribute(.id),
                          accord: node.requiredChildElements(.accord, parseAccord))
    }

    internal static func parseSegno(_ node: Node) throws -> MXLSegno {
        try MXLSegno(id: node.valueOfOptionalAttribute(.id),
                     position: parsePosition(node),
                     font: parseFont(node),
                     color: parseColor(node),
                     halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                     valign: node.valueOfOptionalAttribute(.valign, parseValign),
                     smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflSegnoGlyphName))
    }

    internal static func parseSystemRelation(_ text: String) -> MXLSystemRelation? {
        switch text {
        case "also-top":
            .alsoTop

        case "none":
            .onlyPart

        case "only-top":
            .onlyTop

        default:
            nil
        }
    }

    internal static func parseSystemRelationNumber(_ text: String) -> MXLSystemRelationNumber? {
        switch text {
        case "also-bottom":
            .alsoBottom

        case "also-top":
            .alsoTop

        case "none":
            .onlyPart

        case "only-bottom":
            .onlyBottom

        case "only-top":
            .onlyTop

        default:
            nil
        }
    }

    internal static func parseWedge(_ node: Node) throws -> MXLWedge {
        try MXLWedge(id: node.valueOfOptionalAttribute(.id),
                     kind: node.valueOfRequiredAttribute(.type, parseWedgeKind),
                     number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                     spread: node.valueOfOptionalAttribute(.spread, parseTenths),
                     isNiente: node.valueOfOptionalAttribute(.niente, parseYesNo),
                     lineKind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                     dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                     spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                     position: parsePosition(node),
                     color: parseColor(node))
    }

    internal static func parseWedgeKind(_ text: String) -> MXLWedge.Kind? {
        switch text {
        case "continue":
            .continue

        case "crescendo":
            .crescendo

        case "diminuendo":
            .diminuendo

        case "stop":
            .stop

        default:
            nil
        }
    }
}
