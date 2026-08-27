// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseBeater(_ node: Node) throws -> MXLBeater {
        try MXLBeater(value: node.requiredValue(parseBeaterValue),
                      tip: node.valueOfOptionalAttribute(.tip, parseTipDirection))
    }

    internal static func parseBeaterValue(_ text: String) -> MXLBeater.Value? {
        switch text {
        case "bow":
            .bow

        case "chime hammer":
            .chimeHammer

        case "coin":
            .coin

        case "drum stick":
            .drumStick

        case "finger":
            .finger

        case "fingernail":
            .fingernail

        case "fist":
            .fist

        case "guiro scraper":
            .guiroScraper

        case "hammer":
            .hammer

        case "hand":
            .hand

        case "jazz stick":
            .jazzStick

        case "knitting needle":
            .knittingNeedle

        case "metal hammer":
            .metalHammer

        case "slide brush on gong":
            .slideBrushOnGong

        case "snare stick":
            .snareStick

        case "spoon mallet":
            .spoonMallet

        case "superball":
            .superball

        case "triangle beater":
            .triangleBeater

        case "triangle beater plain":
            .triangleBeaterPlain

        case "wire brush":
            .wireBrush

        default:
            nil
        }
    }

    internal static func parseEffect(_ node: Node) throws -> MXLEffect {
        try MXLEffect(value: node.requiredValue(parseEffectValue),
                      smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflPictogramGlyphName))
    }

    internal static func parseEffectValue(_ text: String) -> MXLEffect.Value? {
        switch text {
        case "anvil":
            .anvil

        case "auto horn":
            .autoHorn

        case "bird whistle":
            .birdWhistle

        case "cannon":
            .cannon

        case "duck call":
            .duckCall

        case "gun shot":
            .gunShot

        case "klaxon horn":
            .klaxonHorn

        case "lions roar":
            .lionsRoar

        case "lotus flute":
            .lotusFlute

        case "megaphone":
            .megaphone

        case "police whistle":
            .policeWhistle

        case "siren":
            .siren

        case "slide whistle":
            .slideWhistle

        case "thunder sheet":
            .thunderSheet

        case "wind machine":
            .windMachine

        case "wind whistle":
            .windWhistle

        default:
            nil
        }
    }

    internal static func parseGlass(_ node: Node) throws -> MXLGlass {
        try MXLGlass(value: node.requiredValue(parseGlassValue),
                     smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflPictogramGlyphName))
    }

    internal static func parseGlassValue(_ text: String) -> MXLGlass.Value? {
        switch text {
        case "glass harmonica":
            .glassHarmonica

        case "glass harp":
            .glassHarp

        case "wind chimes":
            .windChimes

        default:
            nil
        }
    }

    internal static func parseMembrane(_ node: Node) throws -> MXLMembrane {
        try MXLMembrane(value: node.requiredValue(parseMembraneValue),
                        smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflPictogramGlyphName))
    }

    internal static func parseMembraneValue(_ text: String) -> MXLMembrane.Value? {
        switch text {
        case "bass drum":
            .bassDrum

        case "bass drum on side":
            .bassDrumOnSide

        case "bongos":
            .bongos

        case "Chinese tomtom":
            .chineseTomtom

        case "conga drum":
            .congaDrum

        case "cuica":
            .cuica

        case "goblet drum":
            .gobletDrum

        case "Indo-American tomtom":
            .indoAmericanTomtom

        case "Japanese tomtom":
            .japaneseTomtom

        case "military drum":
            .militaryDrum

        case "snare drum":
            .snareDrum

        case "snare drum snares off":
            .snareDrumSnaresOff

        case "tabla":
            .tabla

        case "tambourine":
            .tambourine

        case "tenor drum":
            .tenorDrum

        case "timbales":
            .timbales

        case "tomtom":
            .tomtom

        default:
            nil
        }
    }

    internal static func parseMetal(_ node: Node) throws -> MXLMetal {
        try MXLMetal(value: node.requiredValue(parseMetalValue),
                     smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflPictogramGlyphName))
    }

    internal static func parseMetalValue(_ text: String) -> MXLMetal.Value? {
        switch text {
        case "agogo":
            .agogo

        case "almglocken":
            .almglocken

        case "bell":
            .bell

        case "bell plate":
            .bellPlate

        case "bell tree":
            .bellTree

        case "brake drum":
            .brakeDrum

        case "cencerro":
            .cencerro

        case "chain rattle":
            .chainRattle

        case "Chinese cymbal":
            .chineseCymbal

        case "cowbell":
            .cowbell

        case "crash cymbals":
            .crashCymbals

        case "crotale":
            .crotale

        case "cymbal tongs":
            .cymbalTongs

        case "domed gong":
            .domedGong

        case "finger cymbals":
            .fingerCymbals

        case "flexatone":
            .flexatone

        case "gong":
            .gong

        case "handbell":
            .handbell

        case "hi-hat":
            .hiHat

        case "high-hat cymbals":
            .highHatCymbals

        case "jaw harp":
            .jawHarp

        case "jingle bells":
            .jingleBells

        case "musical saw":
            .musicalSaw

        case "shell bells":
            .shellBells

        case "sistrum":
            .sistrum

        case "sizzle cymbal":
            .sizzleCymbal

        case "sleigh bells":
            .sleighBells

        case "suspended cymbal":
            .suspendedCymbal

        case "tam tam":
            .tamTam

        case "tam tam with beater":
            .tamTamWithBeater

        case "triangle":
            .triangle

        case "Vietnamese hat":
            .vietnameseHat

        default:
            nil
        }
    }
}
