// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeBeater(_ beater: MXLBeater) {
        var attributes: [(MXLAttributeName, String)] = []

        if let tip = beater.tip {
            attributes.append((.tip, formatTipDirection(tip)))
        }

        writeTextElement(.beater,
                         _formatBeaterValue(beater.value),
                         attributes: attributes)
    }

    internal mutating func writeEffect(_ effect: MXLEffect) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = effect.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.effect,
                         _formatEffectValue(effect.value),
                         attributes: attributes)
    }

    internal mutating func writeGlass(_ glass: MXLGlass) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = glass.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.glass,
                         _formatGlassValue(glass.value),
                         attributes: attributes)
    }

    internal mutating func writeMembrane(_ membrane: MXLMembrane) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = membrane.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.membrane,
                         _formatMembraneValue(membrane.value),
                         attributes: attributes)
    }

    internal mutating func writeMetal(_ metal: MXLMetal) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = metal.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.metal,
                         _formatMetalValue(metal.value),
                         attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatBeaterValue(_ value: MXLBeater.Value) -> String {
        switch value {
        case .bow:
            "bow"

        case .chimeHammer:
            "chime hammer"

        case .coin:
            "coin"

        case .drumStick:
            "drum stick"

        case .finger:
            "finger"

        case .fingernail:
            "fingernail"

        case .fist:
            "fist"

        case .guiroScraper:
            "guiro scraper"

        case .hammer:
            "hammer"

        case .hand:
            "hand"

        case .jazzStick:
            "jazz stick"

        case .knittingNeedle:
            "knitting needle"

        case .metalHammer:
            "metal hammer"

        case .slideBrushOnGong:
            "slide brush on gong"

        case .snareStick:
            "snare stick"

        case .spoonMallet:
            "spoon mallet"

        case .superball:
            "superball"

        case .triangleBeater:
            "triangle beater"

        case .triangleBeaterPlain:
            "triangle beater plain"

        case .wireBrush:
            "wire brush"
        }
    }

    private func _formatEffectValue(_ value: MXLEffect.Value) -> String {
        switch value {
        case .anvil:
            "anvil"

        case .autoHorn:
            "auto horn"

        case .birdWhistle:
            "bird whistle"

        case .cannon:
            "cannon"

        case .duckCall:
            "duck call"

        case .gunShot:
            "gun shot"

        case .klaxonHorn:
            "klaxon horn"

        case .lionsRoar:
            "lions roar"

        case .lotusFlute:
            "lotus flute"

        case .megaphone:
            "megaphone"

        case .policeWhistle:
            "police whistle"

        case .siren:
            "siren"

        case .slideWhistle:
            "slide whistle"

        case .thunderSheet:
            "thunder sheet"

        case .windMachine:
            "wind machine"

        case .windWhistle:
            "wind whistle"
        }
    }

    private func _formatGlassValue(_ value: MXLGlass.Value) -> String {
        switch value {
        case .glassHarmonica:
            "glass harmonica"

        case .glassHarp:
            "glass harp"

        case .windChimes:
            "wind chimes"
        }
    }

    private func _formatMembraneValue(_ value: MXLMembrane.Value) -> String {
        switch value {
        case .bassDrum:
            "bass drum"

        case .bassDrumOnSide:
            "bass drum on side"

        case .bongos:
            "bongos"

        case .chineseTomtom:
            "Chinese tomtom"

        case .congaDrum:
            "conga drum"

        case .cuica:
            "cuica"

        case .gobletDrum:
            "goblet drum"

        case .indoAmericanTomtom:
            "Indo-American tomtom"

        case .japaneseTomtom:
            "Japanese tomtom"

        case .militaryDrum:
            "military drum"

        case .snareDrum:
            "snare drum"

        case .snareDrumSnaresOff:
            "snare drum snares off"

        case .tabla:
            "tabla"

        case .tambourine:
            "tambourine"

        case .tenorDrum:
            "tenor drum"

        case .timbales:
            "timbales"

        case .tomtom:
            "tomtom"
        }
    }

    private func _formatMetalValue(_ value: MXLMetal.Value) -> String {
        switch value {
        case .agogo:
            "agogo"

        case .almglocken:
            "almglocken"

        case .bell:
            "bell"

        case .bellPlate:
            "bell plate"

        case .bellTree:
            "bell tree"

        case .brakeDrum:
            "brake drum"

        case .cencerro:
            "cencerro"

        case .chainRattle:
            "chain rattle"

        case .chineseCymbal:
            "Chinese cymbal"

        case .cowbell:
            "cowbell"

        case .crashCymbals:
            "crash cymbals"

        case .crotale:
            "crotale"

        case .cymbalTongs:
            "cymbal tongs"

        case .domedGong:
            "domed gong"

        case .fingerCymbals:
            "finger cymbals"

        case .flexatone:
            "flexatone"

        case .gong:
            "gong"

        case .handbell:
            "handbell"

        case .hiHat:
            "hi-hat"

        case .highHatCymbals:
            "high-hat cymbals"

        case .jawHarp:
            "jaw harp"

        case .jingleBells:
            "jingle bells"

        case .musicalSaw:
            "musical saw"

        case .shellBells:
            "shell bells"

        case .sistrum:
            "sistrum"

        case .sizzleCymbal:
            "sizzle cymbal"

        case .sleighBells:
            "sleigh bells"

        case .suspendedCymbal:
            "suspended cymbal"

        case .tamTam:
            "tam tam"

        case .tamTamWithBeater:
            "tam tam with beater"

        case .triangle:
            "triangle"

        case .vietnameseHat:
            "Vietnamese hat"
        }
    }
}
