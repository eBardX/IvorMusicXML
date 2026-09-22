// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parsePercussion(_ node: Node) throws -> MXLPercussion {
        try MXLPercussion(id: node.valueOfOptionalAttribute(.id),
                          content: parsePercussionContent(node),
                          position: parsePosition(node),
                          font: parseFont(node),
                          color: parseColor(node),
                          halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                          valign: node.valueOfOptionalAttribute(.valign, parseValign),
                          enclosure: node.valueOfOptionalAttribute(.enclosure, parseEnclosureShape))
    }

    internal static func parsePercussionContent(_ node: Node) throws -> MXLPercussion.Content {
        switch node.firstChildElement([.beater,
                                       .effect,
                                       .glass,
                                       .membrane,
                                       .metal,
                                       .otherPercussion,
                                       .pitched,
                                       .stick,
                                       .stickLocation,
                                       .timpani,
                                       .wood])?.element {
        case .beater:
            try .beater(node.requiredChildElement(.beater, parseBeater))

        case .effect:
            try .effect(node.requiredChildElement(.effect, parseEffect))

        case .glass:
            try .glass(node.requiredChildElement(.glass, parseGlass))

        case .membrane:
            try .membrane(node.requiredChildElement(.membrane, parseMembrane))

        case .metal:
            try .metal(node.requiredChildElement(.metal, parseMetal))

        case .otherPercussion:
            try .otherPercussion(node.requiredChildElement(.otherPercussion, parseOtherText))

        case .pitched:
            try .pitched(node.requiredChildElement(.pitched, parsePitched))

        case .stick:
            try .stick(node.requiredChildElement(.stick, parseStick))

        case .stickLocation:
            try .stickLocation(node.valueOfRequiredChildElement(.stickLocation, parseStickLocation))

        case .timpani:
            try .timpani(node.requiredChildElement(.timpani, parseTimpani))

        case .wood:
            try .wood(node.requiredChildElement(.wood, parseWood))

        default:
            try node.unexpectedElement([.beater,
                                        .effect,
                                        .glass,
                                        .membrane,
                                        .metal,
                                        .otherPercussion,
                                        .pitched,
                                        .stick,
                                        .stickLocation,
                                        .timpani,
                                        .wood])
        }
    }

    internal static func parsePitched(_ node: Node) throws -> MXLPitched {
        try MXLPitched(value: node.requiredValue(parsePitchedValue),
                       smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflPictogramGlyphName))
    }

    internal static func parsePitchedValue(_ text: String) -> MXLPitched.Value? {
        switch text {
        case "celesta":
            .celesta

        case "chimes":
            .chimes

        case "glockenspiel":
            .glockenspiel

        case "lithophone":
            .lithophone

        case "mallet":
            .mallet

        case "marimba":
            .marimba

        case "steel drums":
            .steelDrums

        case "tubaphone":
            .tubaphone

        case "tubular chimes":
            .tubularChimes

        case "vibraphone":
            .vibraphone

        case "xylophone":
            .xylophone

        default:
            nil
        }
    }

    internal static func parseStick(_ node: Node) throws -> MXLStick {
        try MXLStick(kind: node.valueOfRequiredChildElement(.stickType, parseStickKind),
                     material: node.valueOfRequiredChildElement(.stickMaterial, parseStickMaterial),
                     tip: node.valueOfOptionalAttribute(.tip, parseTipDirection),
                     hasParentheses: node.valueOfOptionalAttribute(.parentheses, parseYesNo),
                     hasDashedCircle: node.valueOfOptionalAttribute(.dashedCircle, parseYesNo))
    }

    internal static func parseStickKind(_ text: String) -> MXLStick.Kind? {
        switch text {
        case "bass drum":
            .bassDrum

        case "double bass drum":
            .doubleBassDrum

        case "glockenspiel":
            .glockenspiel

        case "gum":
            .gum

        case "hammer":
            .hammer

        case "superball":
            .superball

        case "timpani":
            .timpani

        case "wound":
            .wound

        case "xylophone":
            .xylophone

        case "yarn":
            .yarn

        default:
            nil
        }
    }

    internal static func parseStickLocation(_ text: String) -> MXLStickLocation? {
        switch text {
        case "center":
            .center

        case "cymbal bell":
            .cymbalBell

        case "cymbal edge":
            .cymbalEdge

        case "rim":
            .rim

        default:
            nil
        }
    }

    internal static func parseStickMaterial(_ text: String) -> MXLStick.Material? {
        switch text {
        case "hard":
            .hard

        case "medium":
            .medium

        case "shaded":
            .shaded

        case "soft":
            .soft

        case "x":
            .x

        default:
            nil
        }
    }

    internal static func parseTimpani(_ node: Node) throws -> MXLTimpani {
        try MXLTimpani(smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflPictogramGlyphName))
    }

    internal static func parseWood(_ node: Node) throws -> MXLWood {
        try MXLWood(value: node.requiredValue(parseWoodValue),
                    smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflPictogramGlyphName))
    }

    internal static func parseWoodValue(_ text: String) -> MXLWood.Value? {
        switch text {
        case "bamboo scraper":
            .bambooScraper

        case "board clapper":
            .boardClapper

        case "cabasa":
            .cabasa

        case "castanets":
            .castanets

        case "castanets with handle":
            .castanetsWithHandle

        case "claves":
            .claves

        case "football rattle":
            .footballRattle

        case "guiro":
            .guiro

        case "log drum":
            .logDrum

        case "maraca":
            .maraca

        case "maracas":
            .maracas

        case "quijada":
            .quijada

        case "rainstick":
            .rainstick

        case "ratchet":
            .ratchet

        case "reco-reco":
            .recoReco

        case "sandpaper blocks":
            .sandpaperBlocks

        case "slit drum":
            .slitDrum

        case "temple block":
            .templeBlock

        case "vibraslap":
            .vibraslap

        case "whip":
            .whip

        case "wood block":
            .woodBlock

        default:
            nil
        }
    }
}
