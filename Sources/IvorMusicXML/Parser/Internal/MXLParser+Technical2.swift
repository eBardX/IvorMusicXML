// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseHoleClosedLocation(_ text: String) -> MXLHole.Closed.Location? {
        switch text {
        case "bottom":
            .bottom

        case "left":
            .left

        case "right":
            .right

        case "top":
            .top

        default:
            nil
        }
    }

    internal static func parseHoleClosedValue(_ text: String) -> MXLHole.Closed.Value? {
        switch text {
        case "half":
            .half

        case "no":
            .no

        case "yes":
            .yes

        default:
            nil
        }
    }

    internal static func parseRelease(_ node: Node) throws -> MXLRelease {
        try MXLRelease(offset: node.valueOfOptionalAttribute(.offset, parseDivisions))
    }

    internal static func parseString(_ node: Node) throws -> MXLString {
        try MXLString(value: node.value.flatMap(parseInt) ?? 1,
                      position: parsePosition(node),
                      font: parseFont(node),
                      color: parseColor(node),
                      placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseStringMute(_ node: Node) throws -> MXLStringMute {
        try MXLStringMute(id: node.valueOfOptionalAttribute(.id),
                          isOn: node.valueOfRequiredAttribute(.type, parseOnOff),
                          position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                          valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parseTap(_ node: Node) throws -> MXLTap {
        try MXLTap(value: node.value ?? "",
                   hand: node.valueOfOptionalAttribute(.hand, parseTapHand),
                   position: parsePosition(node),
                   font: parseFont(node),
                   color: parseColor(node),
                   placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseTapHand(_ text: String) -> MXLTap.Hand? {
        switch text {
        case "left":
            .left

        case "right":
            .right

        default:
            nil
        }
    }

    internal static func parseTechnical(_ node: Node) throws -> MXLTechnical {
        try MXLTechnical(id: node.valueOfOptionalAttribute(.id),
                         items: node.optionalChildElements([.arrow,
                                                            .bend,
                                                            .brassBend,
                                                            .doubleTongue,
                                                            .downBow,
                                                            .fingering,
                                                            .fingernails,
                                                            .flip,
                                                            .fret,
                                                            .golpe,
                                                            .halfMuted,
                                                            .hammerOn,
                                                            .handbell,
                                                            .harmonic,
                                                            .harmonMute,
                                                            .heel,
                                                            .hole,
                                                            .open,
                                                            .openString,
                                                            .otherTechnical,
                                                            .pluck,
                                                            .pullOff,
                                                            .smear,
                                                            .snapPizzicato,
                                                            .stopped,
                                                            .string,
                                                            .tap,
                                                            .thumbPosition,
                                                            .toe,
                                                            .tripleTongue,
                                                            .upBow], parseTechnicalItem))
    }

    internal static func parseTechnicalItem(_ node: Node) throws -> MXLTechnical.Item {
        switch node.element {
        case .arrow:
            try .arrow(parseArrow(node))

        case .bend:
            try .bend(parseBend(node))

        case .brassBend:
            try .brassBend(position: parsePosition(node),
                           font: parseFont(node),
                           color: parseColor(node),
                           placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .doubleTongue:
            try .doubleTongue(position: parsePosition(node),
                              font: parseFont(node),
                              color: parseColor(node),
                              placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .downBow:
            try .downBow(position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node),
                         placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .fingering:
            try .fingering(parseFingering(node))

        case .fingernails:
            try .fingernails(position: parsePosition(node),
                             font: parseFont(node),
                             color: parseColor(node),
                             placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .flip:
            try .flip(position: parsePosition(node),
                      font: parseFont(node),
                      color: parseColor(node),
                      placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .fret:
            try .fret(parseFret(node))

        case .golpe:
            try .golpe(position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .halfMuted:
            try .halfMuted(position: parsePosition(node),
                           font: parseFont(node),
                           color: parseColor(node),
                           placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                           smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))

        case .hammerOn:
            try .hammerOn(parseHammerOnPullOff(node))

        case .handbell:
            try .handbell(parseHandbell(node))

        case .harmonic:
            try .harmonic(parseHarmonic(node))

        case .harmonMute:
            try .harmonMute(parseHarmonMute(node))

        default:
            try parseTechnicalItemTail(node)
        }
    }

    internal static func parseTechnicalItemTail(_ node: Node) throws -> MXLTechnical.Item {
        switch node.element {
        case .heel:
            try .heel(parseHeelToe(node))

        case .hole:
            try .hole(parseHole(node))

        case .open:
            try .open(position: parsePosition(node),
                      font: parseFont(node),
                      color: parseColor(node),
                      placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                      smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))

        case .openString:
            try .openString(position: parsePosition(node),
                            font: parseFont(node),
                            color: parseColor(node),
                            placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .otherTechnical:
            try .otherTechnical(parseOtherPlacementText(node))

        case .pluck:
            try .pluck(parsePlacementText(node))

        case .pullOff:
            try .pullOff(parseHammerOnPullOff(node))

        case .smear:
            try .smear(position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .snapPizzicato:
            try .snapPizzicato(position: parsePosition(node),
                               font: parseFont(node),
                               color: parseColor(node),
                               placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .stopped:
            try .stopped(position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node),
                         placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                         smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))

        case .string:
            try .string(parseString(node))

        case .tap:
            try .tap(parseTap(node))

        case .thumbPosition:
            try .thumbPosition(position: parsePosition(node),
                               font: parseFont(node),
                               color: parseColor(node),
                               placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .toe:
            try .toe(parseHeelToe(node))

        case .tripleTongue:
            try .tripleTongue(position: parsePosition(node),
                              font: parseFont(node),
                              color: parseColor(node),
                              placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        case .upBow:
            try .upBow(position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))

        default:
            try node.unexpectedElement([.arrow,
                                        .bend,
                                        .brassBend,
                                        .doubleTongue,
                                        .downBow,
                                        .fingering,
                                        .fingernails,
                                        .flip,
                                        .fret,
                                        .golpe,
                                        .halfMuted,
                                        .hammerOn,
                                        .handbell,
                                        .harmonic,
                                        .harmonMute,
                                        .heel,
                                        .hole,
                                        .open,
                                        .openString,
                                        .otherTechnical,
                                        .pluck,
                                        .pullOff,
                                        .smear,
                                        .snapPizzicato,
                                        .stopped,
                                        .string,
                                        .tap,
                                        .thumbPosition,
                                        .toe,
                                        .tripleTongue,
                                        .upBow])
        }
    }

    internal static func parseTipDirection(_ text: String) -> MXLTipDirection? {
        switch text {
        case "down":
            .down

        case "left":
            .left

        case "northeast":
            .northeast

        case "northwest":
            .northwest

        case "right":
            .right

        case "southeast":
            .southeast

        case "southwest":
            .southwest

        case "up":
            .up

        default:
            nil
        }
    }
}
