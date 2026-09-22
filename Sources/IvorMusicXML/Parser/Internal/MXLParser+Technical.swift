// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseArrow(_ node: Node) throws -> MXLArrow {
        try MXLArrow(content: parseArrowContent(node),
                     position: parsePosition(node),
                     font: parseFont(node),
                     color: parseColor(node),
                     placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                     smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflGlyphName))
    }

    internal static func parseArrowContent(_ node: Node) throws -> MXLArrow.Content {
        if node.hasChildElement(.circularArrow) {
            return try .circularArrow(node.valueOfRequiredChildElement(.circularArrow, parseCircularArrow))
        }

        return try .arrowDirection(node.valueOfRequiredChildElement(.arrowDirection, parseArrowDirection),
                                   style: node.valueOfOptionalChildElement(.arrowStyle, parseArrowStyle),
                                   hasArrowhead: node.hasChildElement(.arrowhead))
    }

    internal static func parseArrowDirection(_ text: String) -> MXLArrow.Direction? {
        switch text {
        case "down":
            .down

        case "left":
            .left

        case "left right":
            .leftRight

        case "northeast":
            .northeast

        case "northeast southwest":
            .northeastSouthwest

        case "northwest":
            .northwest

        case "northwest southeast":
            .northwestSoutheast

        case "other":
            .other

        case "right":
            .right

        case "southeast":
            .southeast

        case "southwest":
            .southwest

        case "up":
            .up

        case "up down":
            .upDown

        default:
            nil
        }
    }

    internal static func parseArrowStyle(_ text: String) -> MXLArrow.Style? {
        switch text {
        case "combined":
            .combined

        case "double":
            .double

        case "filled":
            .filled

        case "hollow":
            .hollow

        case "other":
            .other

        case "paired":
            .paired

        case "single":
            .single

        default:
            nil
        }
    }

    internal static func parseBend(_ node: Node) throws -> MXLBend {
        try MXLBend(alter: node.valueOfRequiredChildElement(.bendAlter, parseSemitones),
                    content: node.optionalChildElement([.preBend, .release]) {
                        $0.element == .release ? try .release(parseRelease($0)) : .preBend
                    },
                    withBar: node.optionalChildElement(.withBar, parsePlacementText),
                    shape: node.valueOfOptionalAttribute(.shape, parseBendShape),
                    position: parsePosition(node),
                    font: parseFont(node),
                    color: parseColor(node),
                    sound: parseBendSound(node))
    }

    internal static func parseBendShape(_ text: String) -> MXLBend.Shape? {
        switch text {
        case "angled":
            .angled

        case "curved":
            .curved

        default:
            nil
        }
    }

    internal static func parseBendSound(_ node: Node) throws -> MXLBendSound {
        try MXLBendSound(accelerates: node.valueOfOptionalAttribute(.accelerate, parseYesNo),
                         beats: node.valueOfOptionalAttribute(.beats, parseTrillBeats),
                         firstBeat: node.valueOfOptionalAttribute(.firstBeat, parsePercent),
                         lastBeat: node.valueOfOptionalAttribute(.lastBeat, parsePercent))
    }

    internal static func parseCircularArrow(_ text: String) -> MXLCircularArrow? {
        switch text {
        case "anticlockwise":
            .anticlockwise

        case "clockwise":
            .clockwise

        default:
            nil
        }
    }

    internal static func parseFingering(_ node: Node) throws -> MXLFingering {
        try MXLFingering(value: node.value ?? "",
                         isSubstitute: node.valueOfOptionalAttribute(.substitution, parseYesNo),
                         isAlternate: node.valueOfOptionalAttribute(.alternate, parseYesNo),
                         position: parsePosition(node),
                         font: parseFont(node),
                         color: parseColor(node),
                         placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseFret(_ node: Node) throws -> MXLFret {
        try MXLFret(value: node.value.flatMap(parseInt) ?? 0,
                    font: parseFont(node),
                    color: parseColor(node))
    }

    internal static func parseHammerOnPullOff(_ node: Node) throws -> MXLHammerOnPullOff {
        try MXLHammerOnPullOff(value: node.value ?? "",
                               kind: node.valueOfRequiredAttribute(.type, parseStartStop),
                               number: node.valueOfOptionalAttribute(.number, parseNumberLevel),
                               position: parsePosition(node),
                               font: parseFont(node),
                               color: parseColor(node),
                               placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseHandbell(_ node: Node) throws -> MXLHandbell {
        try MXLHandbell(value: node.requiredValue(parseHandbellValue),
                        position: parsePosition(node),
                        font: parseFont(node),
                        color: parseColor(node),
                        placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseHandbellValue(_ text: String) -> MXLHandbell.Value? {
        switch text {
        case "belltree":
            .belltree

        case "damp":
            .damp

        case "echo":
            .echo

        case "gyro":
            .gyro

        case "hand martellato":
            .handMartellato

        case "mallet lift":
            .malletLift

        case "mallet table":
            .malletTable

        case "martellato":
            .martellato

        case "martellato lift":
            .martellatoLift

        case "muted martellato":
            .mutedMartellato

        case "pluck lift":
            .pluckLift

        case "swing":
            .swing

        default:
            nil
        }
    }

    internal static func parseHarmonClosed(_ node: Node) throws -> MXLHarmonClosed {
        try MXLHarmonClosed(value: node.requiredValue(parseHarmonClosedValue),
                            location: node.valueOfOptionalAttribute(.location, parseHarmonClosedLocation))
    }

    internal static func parseHarmonClosedLocation(_ text: String) -> MXLHarmonClosed.Location? {
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

    internal static func parseHarmonClosedValue(_ text: String) -> MXLHarmonClosed.Value? {
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

    internal static func parseHarmonic(_ node: Node) throws -> MXLHarmonic {
        try MXLHarmonic(content: node.optionalChildElement([.artificial, .natural]) {
            switch $0.element {
            case .artificial:
                MXLHarmonic.Content.artificial

            case .natural:
                MXLHarmonic.Content.natural

            default:
                try $0.unexpectedElement([.artificial, .natural])
            }
        },
                        content2: node.optionalChildElement([.basePitch, .soundingPitch, .touchingPitch]) {
            switch $0.element {
            case .basePitch:
                MXLHarmonic.Content2.basePitch

            case .soundingPitch:
                MXLHarmonic.Content2.soundingPitch

            case .touchingPitch:
                MXLHarmonic.Content2.touchingPitch

            default:
                try $0.unexpectedElement([.basePitch, .soundingPitch, .touchingPitch])
            }
                        },
                        printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                        position: parsePosition(node),
                        font: parseFont(node),
                        color: parseColor(node),
                        placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseHarmonMute(_ node: Node) throws -> MXLHarmonMute {
        try MXLHarmonMute(harmonClosed: node.requiredChildElement(.harmonClosed, parseHarmonClosed),
                          position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseHeelToe(_ node: Node) throws -> MXLHeelToe {
        try MXLHeelToe(position: parsePosition(node),
                       font: parseFont(node),
                       color: parseColor(node),
                       placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                       isSubstitute: node.valueOfOptionalAttribute(.substitution, parseYesNo))
    }

    internal static func parseHole(_ node: Node) throws -> MXLHole {
        try MXLHole(kind: node.valueOfOptionalChildElement(.holeType),
                    closed: node.requiredChildElement(.holeClosed, parseHoleClosed),
                    shape: node.valueOfOptionalChildElement(.holeShape),
                    position: parsePosition(node),
                    font: parseFont(node),
                    color: parseColor(node),
                    placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseHoleClosed(_ node: Node) throws -> MXLHole.Closed {
        try MXLHole.Closed(value: node.requiredValue(parseHoleClosedValue),
                           location: node.valueOfOptionalAttribute(.location, parseHoleClosedLocation))
    }
}
