// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiTools
internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseAccidentalMark(_ node: Node) throws -> MXLAccidentalMark {
        try MXLAccidentalMark(id: node.valueOfOptionalAttribute(.id),
                              value: node.requiredValue(parseAccidentalValue),
                              levelDisplay: parseLevelDisplay(node),
                              position: parsePosition(node),
                              font: parseFont(node),
                              color: parseColor(node),
                              placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                              smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflAccidentalGlyphName))
    }

    internal static func parseArpeggiate(_ node: Node) throws -> MXLArpeggiate {
        try MXLArpeggiate(id: node.valueOfOptionalAttribute(.id),
                          number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                          direction: node.valueOfOptionalAttribute(.direction, parseUpDown),
                          isUnbroken: node.valueOfOptionalAttribute(.unbroken, parseYesNo),
                          position: parsePosition(node),
                          placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                          color: parseColor(node))
    }

    internal static func parseArticulations(_ node: Node) throws -> MXLArticulations {
        try MXLArticulations(id: node.valueOfOptionalAttribute(.id),
                             items: node.optionalChildElements([.accent,
                                                                .breathMark,
                                                                .caesura,
                                                                .detachedLegato,
                                                                .doit,
                                                                .falloff,
                                                                .otherArticulation,
                                                                .plop,
                                                                .scoop,
                                                                .softAccent,
                                                                .spiccato,
                                                                .staccatissimo,
                                                                .staccato,
                                                                .stress,
                                                                .strongAccent,
                                                                .tenuto,
                                                                .unstress], parseArticulationsItem))
    }

    internal static func parseArticulationsItem(_ node: Node) throws -> MXLArticulations.Item {
        switch node.element {
        case .accent:
            try .accent(position: parsePosition(node),
                        font: parseFont(node),
                        color: parseColor(node),
                        placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .breathMark:
            try .breathMark(parseBreathMark(node))

        case .caesura:
            try .caesura(parseCaesura(node))

        case .detachedLegato:
            try .detachedLegato(position: parsePosition(node),
                                font: parseFont(node),
                                color: parseColor(node),
                                placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .doit:
            try .doit(parseEmptyLine(node))

        case .falloff:
            try .falloff(parseEmptyLine(node))

        case .otherArticulation:
            try .otherArticulation(parseOtherPlacementText(node))

        case .plop:
            try .plop(parseEmptyLine(node))

        case .scoop:
            try .scoop(parseEmptyLine(node))

        case .softAccent:
            try .softAccent(position: parsePosition(node),
                            font: parseFont(node),
                            color: parseColor(node),
                            placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .spiccato:
            try .spiccato(position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .staccatissimo:
            try .staccatissimo(position: parsePosition(node),
                               font: parseFont(node),
                               color: parseColor(node),
                               placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .staccato:
            try .staccato(position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .stress:
            try .stress(position: parsePosition(node),
                        font: parseFont(node),
                        color: parseColor(node),
                        placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .strongAccent:
            try .strongAccent(parseStrongAccent(node))

        case .tenuto:
            try .tenuto(position: parsePosition(node),
                        font: parseFont(node),
                        color: parseColor(node),
                        placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .unstress:
            try .unstress(position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        default:
            try node.unexpectedElement([.accent,
                                        .breathMark,
                                        .caesura,
                                        .detachedLegato,
                                        .doit,
                                        .falloff,
                                        .otherArticulation,
                                        .plop,
                                        .scoop,
                                        .softAccent,
                                        .spiccato,
                                        .staccatissimo,
                                        .staccato,
                                        .stress,
                                        .strongAccent,
                                        .tenuto,
                                        .unstress])
        }
    }

    internal static func parseBreathMark(_ node: Node) throws -> MXLBreathMark {
        try MXLBreathMark(value: node.optionalValue(parseBreathMarkValue) ?? .empty,
                          position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseBreathMarkValue(_ text: String) -> MXLBreathMark.Value? {
        switch text {
        case "":
            .empty

        case "comma":
            .comma

        case "salzedo":
            .salzedo

        case "tick":
            .tick

        case "upbow":
            .upbow

        default:
            nil
        }
    }

    internal static func parseCaesura(_ node: Node) throws -> MXLCaesura {
        try MXLCaesura(value: node.optionalValue(parseCaesuraValue) ?? .empty,
                       position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseCaesuraValue(_ text: String) -> MXLCaesura.Value? {
        switch text {
        case "":
            .empty

        case "curved":
            .curved

        case "normal":
            .normal

        case "short":
            .short

        case "single":
            .single

        case "thick":
            .thick

        default:
            nil
        }
    }

    internal static func parseFermata(_ node: Node) throws -> MXLFermata {
        try MXLFermata(id: node.valueOfOptionalAttribute(.id),
                       value: node.optionalValue(parseFermataShape) ?? .empty,
                       kind: node.valueOfOptionalAttribute(.type, parseUprightInverted),
                       position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node))
    }

    internal static func parseFermataShape(_ text: String) -> MXLFermata.Shape? {
        switch text {
        case "":
            .empty

        case "angled":
            .angled

        case "curlew":
            .curlew

        case "double-angled":
            .doubleAngled

        case "double-dot":
            .doubleDot

        case "double-square":
            .doubleSquare

        case "half-curve":
            .halfCurve

        case "normal":
            .normal

        case "square":
            .square

        default:
            nil
        }
    }

    internal static func parseGlissando(_ node: Node) throws -> MXLGlissando {
        try MXLGlissando(id: node.valueOfOptionalAttribute(.id),
                         value: node.value ?? "",
                         kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                         number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                         lineKind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                         dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                         spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                         position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node))
    }

    internal static func parseNonArpeggiate(_ node: Node) throws -> MXLNonArpeggiate {
        try MXLNonArpeggiate(id: node.valueOfOptionalAttribute(.id),
                             kind: node.valueOfRequiredAttribute(.type, parseTopBottom),
                             number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                             position: parsePosition(node),
                             placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                             color: parseColor(node))
    }

    internal static func parseNotations(_ node: Node) throws -> MXLNotations {
        try MXLNotations(id: node.valueOfOptionalAttribute(.id),
                         footnote: node.optionalChildElement(.footnote, parseFormattedText),
                         level: node.optionalChildElement(.level, parseLevel),
                         items: node.optionalChildElements([.accidentalMark,
                                                            .arpeggiate,
                                                            .articulations,
                                                            .dynamics,
                                                            .fermata,
                                                            .glissando,
                                                            .nonArpeggiate,
                                                            .ornaments,
                                                            .otherNotation,
                                                            .slide,
                                                            .slur,
                                                            .technical,
                                                            .tied,
                                                            .tuplet], parseNotationsItem),
                         printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseNotationsItem(_ node: Node) throws -> MXLNotations.Item {
        switch node.element {
        case .accidentalMark:
            try .accidentalMark(parseAccidentalMark(node))

        case .arpeggiate:
            try .arpeggiate(parseArpeggiate(node))

        case .articulations:
            try .articulations(parseArticulations(node))

        case .dynamics:
            try .dynamics(parseDynamics(node))

        case .fermata:
            try .fermata(parseFermata(node))

        case .glissando:
            try .glissando(parseGlissando(node))

        case .nonArpeggiate:
            try .nonArpeggiate(parseNonArpeggiate(node))

        case .ornaments:
            try .ornaments(parseOrnaments(node))

        case .otherNotation:
            try .otherNotation(parseOtherNotation(node))

        case .slide:
            try .slide(parseSlide(node))

        case .slur:
            try .slur(parseSlur(node))

        case .technical:
            try .technical(parseTechnical(node))

        case .tied:
            try .tied(parseTied(node))

        case .tuplet:
            try .tuplet(parseTuplet(node))

        default:
            try node.unexpectedElement([.accidentalMark,
                                        .arpeggiate,
                                        .articulations,
                                        .dynamics,
                                        .fermata,
                                        .glissando,
                                        .nonArpeggiate,
                                        .ornaments,
                                        .otherNotation,
                                        .slide,
                                        .slur,
                                        .technical,
                                        .tied,
                                        .tuplet])
        }
    }

    internal static func parseOtherNotation(_ node: Node) throws -> MXLOtherNotation {
        try MXLOtherNotation(id: node.valueOfOptionalAttribute(.id),
                             value: node.value ?? "",
                             kind: node.valueOfRequiredAttribute(.type, parseStartStopSingle),
                             number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                             printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                             position: parsePosition(node),
                             font: parseFont(node),
                             color: parseColor(node),
                             placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                             smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))
    }

    internal static func parseSlide(_ node: Node) throws -> MXLSlide {
        try MXLSlide(id: node.valueOfOptionalAttribute(.id),
                     value: node.value ?? "",
                     kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                     number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                     lineKind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                     dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                     spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                     position: parsePosition(node),
                     font: parseFont(node),
                     color: parseColor(node),
                     bendSound: parseBendSound(node))
    }

    internal static func parseSlur(_ node: Node) throws -> MXLSlur {
        try MXLSlur(id: node.valueOfOptionalAttribute(.id),
                    kind: node.valueOfRequiredAttribute(.type, parseStartStopContinue),
                    number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                    lineKind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                    dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                    spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                    position: parsePosition(node),
                    placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                    orientation: node.valueOfOptionalAttribute(.orientation, parseOverUnder),
                    bezierX: node.valueOfOptionalAttribute(.bezierX, parseTenths),
                    bezierY: node.valueOfOptionalAttribute(.bezierY, parseTenths),
                    bezierX2: node.valueOfOptionalAttribute(.bezierX2, parseTenths),
                    bezierY2: node.valueOfOptionalAttribute(.bezierY2, parseTenths),
                    bezierOffset: node.valueOfOptionalAttribute(.bezierOffset, parseDivisions),
                    bezierOffset2: node.valueOfOptionalAttribute(.bezierOffset2, parseDivisions),
                    color: parseColor(node))
    }

    internal static func parseStartNote(_ text: String) -> MXLStartNote? {
        switch text {
        case "below":
            .below

        case "main":
            .main

        case "upper":
            .upper

        default:
            nil
        }
    }

    internal static func parseStrongAccent(_ node: Node) throws -> MXLStrongAccent {
        try MXLStrongAccent(position: parsePosition(node),
                            font: parseFont(node),
                            color: parseColor(node),
                            placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                            kind: node.valueOfOptionalAttribute(.type, parseUpDown))
    }

    internal static func parseTied(_ node: Node) throws -> MXLTied {
        try MXLTied(id: node.valueOfOptionalAttribute(.id),
                    kind: node.valueOfRequiredAttribute(.type, parseTiedKind),
                    number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                    lineKind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                    dashLength: node.valueOfOptionalAttribute(.dashLength, parseTenths),
                    spaceLength: node.valueOfOptionalAttribute(.spaceLength, parseTenths),
                    position: parsePosition(node),
                    placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                    orientation: node.valueOfOptionalAttribute(.orientation, parseOverUnder),
                    bezierX: node.valueOfOptionalAttribute(.bezierX, parseTenths),
                    bezierY: node.valueOfOptionalAttribute(.bezierY, parseTenths),
                    bezierX2: node.valueOfOptionalAttribute(.bezierX2, parseTenths),
                    bezierY2: node.valueOfOptionalAttribute(.bezierY2, parseTenths),
                    bezierOffset: node.valueOfOptionalAttribute(.bezierOffset, parseDivisions),
                    bezierOffset2: node.valueOfOptionalAttribute(.bezierOffset2, parseDivisions),
                    color: parseColor(node))
    }

    internal static func parseTiedKind(_ text: String) -> MXLTied.Kind? {
        switch text {
        case "continue":
            .continue

        case "let-ring":
            .letRing

        case "start":
            .start

        case "stop":
            .stop

        default:
            nil
        }
    }

    internal static func parseTuplet(_ node: Node) throws -> MXLTuplet {
        try MXLTuplet(id: node.valueOfOptionalAttribute(.id),
                      actual: node.optionalChildElement(.tupletActual, parseTupletPortion),
                      normal: node.optionalChildElement(.tupletNormal, parseTupletPortion),
                      kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                      number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                      hasBracket: node.valueOfOptionalAttribute(.bracket, parseYesNo),
                      showNumber: node.valueOfOptionalAttribute(.showNumber, parseShowTuplet),
                      showType: node.valueOfOptionalAttribute(.showType, parseShowTuplet),
                      lineShape: node.valueOfOptionalAttribute(.lineShape, parseLineShape),
                      position: parsePosition(node),
                      placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseTupletPortion(_ node: Node) throws -> MXLTuplet.Portion {
        try MXLTuplet.Portion(number: node.optionalChildElement(.tupletNumber, parseTupletPortionNumber),
                              kind: node.optionalChildElement(.tupletType, parseTupletPortionKind),
                              dot: node.optionalChildElements(.tupletDot, parseTupletPortionDot))
    }

    internal static func parseTupletPortionDot(_ node: Node) throws -> MXLTuplet.Portion.Dot {
        try MXLTuplet.Portion.Dot(font: parseFont(node),
                                  color: parseColor(node))
    }

    internal static func parseTupletPortionKind(_ node: Node) throws -> MXLTuplet.Portion.Kind {
        try MXLTuplet.Portion.Kind(value: node.requiredValue(parseNoteKindValue),
                                   font: parseFont(node),
                                   color: parseColor(node))
    }

    internal static func parseTupletPortionNumber(_ node: Node) throws -> MXLTuplet.Portion.Number {
        try MXLTuplet.Portion.Number(value: node.value.flatMap(parseInt) ?? 0,
                                     font: parseFont(node),
                                     color: parseColor(node))
    }
}
