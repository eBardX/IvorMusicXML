// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeOtherPercussion(_ otherPercussion: MXLOtherText) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = otherPercussion.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.otherPercussion,
                         otherPercussion.value,
                         attributes: attributes)
    }

    internal mutating func writePercussion(_ percussion: MXLPercussion) {
        openElement(.percussion,
                    attributes: _percussionAttributes(percussion))

        writePercussionContent(percussion.content)

        closeElement()
    }

    internal mutating func writePercussionContent(_ content: MXLPercussion.Content) {
        switch content {
        case let .beater(beater):
            writeBeater(beater)

        case let .effect(effect):
            writeEffect(effect)

        case let .glass(glass):
            writeGlass(glass)

        case let .membrane(membrane):
            writeMembrane(membrane)

        case let .metal(metal):
            writeMetal(metal)

        case let .otherPercussion(otherPercussion):
            writeOtherPercussion(otherPercussion)

        case let .pitched(pitched):
            writePitched(pitched)

        case let .stick(stick):
            writeStick(stick)

        case let .stickLocation(stickLocation):
            writeTextElement(.stickLocation, _formatStickLocation(stickLocation))

        case let .timpani(timpani):
            writeTimpani(timpani)

        case let .wood(wood):
            writeWood(wood)
        }
    }

    internal mutating func writePitched(_ pitched: MXLPitched) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = pitched.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.pitched,
                         _formatPitchedValue(pitched.value),
                         attributes: attributes)
    }

    internal mutating func writeStick(_ stick: MXLStick) {
        var attributes: [(MXLAttributeName, String)] = []

        if let tip = stick.tip {
            attributes.append((.tip, formatTipDirection(tip)))
        }

        attributes.append((.parentheses, formatYesNo(stick.hasParentheses)))
        attributes.append((.dashedCircle, formatYesNo(stick.hasDashedCircle)))

        openElement(.stick,
                    attributes: attributes)

        writeTextElement(.stickType, _formatStickKind(stick.kind))
        writeTextElement(.stickMaterial, _formatStickMaterial(stick.material))

        closeElement()
    }

    internal mutating func writeTimpani(_ timpani: MXLTimpani) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = timpani.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeEmptyElement(.timpani,
                          attributes: attributes)
    }

    internal mutating func writeWood(_ wood: MXLWood) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = wood.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.wood,
                         _formatWoodValue(wood.value),
                         attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatPitchedValue(_ value: MXLPitched.Value) -> String {
        switch value {
        case .celesta:
            "celesta"

        case .chimes:
            "chimes"

        case .glockenspiel:
            "glockenspiel"

        case .lithophone:
            "lithophone"

        case .mallet:
            "mallet"

        case .marimba:
            "marimba"

        case .steelDrums:
            "steel drums"

        case .tubaphone:
            "tubaphone"

        case .tubularChimes:
            "tubular chimes"

        case .vibraphone:
            "vibraphone"

        case .xylophone:
            "xylophone"
        }
    }

    private func _formatStickKind(_ value: MXLStick.Kind) -> String {
        switch value {
        case .bassDrum:
            "bass drum"

        case .doubleBassDrum:
            "double bass drum"

        case .glockenspiel:
            "glockenspiel"

        case .gum:
            "gum"

        case .hammer:
            "hammer"

        case .superball:
            "superball"

        case .timpani:
            "timpani"

        case .wound:
            "wound"

        case .xylophone:
            "xylophone"

        case .yarn:
            "yarn"
        }
    }

    private func _formatStickLocation(_ value: MXLStickLocation) -> String {
        switch value {
        case .center:
            "center"

        case .cymbalBell:
            "cymbal bell"

        case .cymbalEdge:
            "cymbal edge"

        case .rim:
            "rim"
        }
    }

    private func _formatStickMaterial(_ value: MXLStick.Material) -> String {
        switch value {
        case .hard:
            "hard"

        case .medium:
            "medium"

        case .shaded:
            "shaded"

        case .soft:
            "soft"

        case .x:
            "x"
        }
    }

    private func _formatWoodValue(_ value: MXLWood.Value) -> String {
        switch value {
        case .bambooScraper:
            "bamboo scraper"

        case .boardClapper:
            "board clapper"

        case .cabasa:
            "cabasa"

        case .castanets:
            "castanets"

        case .castanetsWithHandle:
            "castanets with handle"

        case .claves:
            "claves"

        case .footballRattle:
            "football rattle"

        case .guiro:
            "guiro"

        case .logDrum:
            "log drum"

        case .maraca:
            "maraca"

        case .maracas:
            "maracas"

        case .quijada:
            "quijada"

        case .rainstick:
            "rainstick"

        case .ratchet:
            "ratchet"

        case .recoReco:
            "reco-reco"

        case .sandpaperBlocks:
            "sandpaper blocks"

        case .slitDrum:
            "slit drum"

        case .templeBlock:
            "temple block"

        case .vibraslap:
            "vibraslap"

        case .whip:
            "whip"

        case .woodBlock:
            "wood block"
        }
    }

    private func _percussionAttributes(_ percussion: MXLPercussion) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = percussion.id {
            attributes.append((.id, id))
        }

        attributes += positionAttributes(percussion.position)
        attributes += fontAttributes(percussion.font)
        attributes += colorAttributes(percussion.color)

        if let halign = percussion.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = percussion.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let enclosure = percussion.enclosure {
            attributes.append((.enclosure, formatEnclosureShape(enclosure)))
        }

        return attributes
    }
}
