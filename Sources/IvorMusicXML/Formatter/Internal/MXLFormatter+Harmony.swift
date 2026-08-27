// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeBass(_ bass: MXLBass) {
        var attributes: [(MXLAttributeName, String)] = []

        if let arrangement = bass.arrangement {
            attributes.append((.arrangement, _formatHarmonyArrangement(arrangement)))
        }

        openElement(.bass,
                    attributes: attributes)

        if let separator = bass.separator {
            writeStyleText(.bassSeparator, separator)
        }

        writeBassStep(bass.step)

        if let alter = bass.alter {
            writeHarmonyAlter(.bassAlter, alter)
        }

        closeElement()
    }

    internal mutating func writeBassStep(_ step: MXLBass.Step) {
        var attributes: [(MXLAttributeName, String)] = []

        if let text = step.text {
            attributes.append((.text, text))
        }

        attributes += positionAttributes(step.position)
        attributes += fontAttributes(step.font)
        attributes += colorAttributes(step.color)

        writeTextElement(.bassStep,
                         formatStep(step.value),
                         attributes: attributes)
    }

    internal mutating func writeDegree(_ degree: MXLDegree) {
        var attributes: [(MXLAttributeName, String)] = []

        if let printsObject = degree.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        openElement(.degree,
                    attributes: attributes)

        writeDegreeValue(degree.value)
        writeDegreeAlter(degree.alter)
        writeDegreeKind(degree.kind)

        closeElement()
    }

    internal mutating func writeDegreeAlter(_ alter: MXLDegree.Alter) {
        var attributes = positionAttributes(alter.position)

        attributes += fontAttributes(alter.font)
        attributes += colorAttributes(alter.color)

        if let usesPlusMinus = alter.usesPlusMinus {
            attributes.append((.plusMinus, formatYesNo(usesPlusMinus)))
        }

        writeTextElement(.degreeAlter,
                         formatDecimal(alter.value),
                         attributes: attributes)
    }

    internal mutating func writeDegreeKind(_ kind: MXLDegree.Kind) {
        var attributes: [(MXLAttributeName, String)] = []

        if let text = kind.text {
            attributes.append((.text, text))
        }

        attributes += positionAttributes(kind.position)
        attributes += fontAttributes(kind.font)
        attributes += colorAttributes(kind.color)

        writeTextElement(.degreeType,
                         _formatDegreeKindValue(kind.value),
                         attributes: attributes)
    }

    internal mutating func writeDegreeValue(_ value: MXLDegree.Value) {
        var attributes: [(MXLAttributeName, String)] = []

        if let symbol = value.symbol {
            attributes.append((.symbol, _formatDegreeSymbolValue(symbol)))
        }

        if let text = value.text {
            attributes.append((.text, text))
        }

        attributes += positionAttributes(value.position)
        attributes += fontAttributes(value.font)
        attributes += colorAttributes(value.color)

        writeTextElement(.degreeValue,
                         String(value.value),
                         attributes: attributes)
    }

    internal mutating func writeHarmony(_ harmony: MXLHarmony) {
        openElement(.harmony,
                    attributes: _harmonyAttributes(harmony))

        writeHarmonyChords(harmony.chord)

        if let frame = harmony.frame {
            writeFrame(frame)
        }

        if let offset = harmony.offset {
            writeOffset(offset)
        }

        // The footnote and level children are written in a later phase.

        if let staff = harmony.staff {
            writeTextElement(.staff, String(staff.uintValue))
        }

        closeElement()
    }

    internal mutating func writeHarmonyAlter(_ name: MXLElementName,
                                             _ alter: MXLHarmonyAlter) {
        var attributes: [(MXLAttributeName, String)] = []

        if let printsObject = alter.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        attributes += positionAttributes(alter.position)
        attributes += fontAttributes(alter.font)
        attributes += colorAttributes(alter.color)

        if let location = alter.location {
            attributes.append((.location, formatLeftRight(location)))
        }

        writeTextElement(name,
                         formatDecimal(alter.value),
                         attributes: attributes)
    }

    internal mutating func writeHarmonyChordContent(_ content: MXLHarmony.Chord.Content) {
        switch content {
        case let .function(function):
            writeStyleText(.function, function)

        case let .numeral(numeral):
            writeNumeral(numeral)

        case let .root(root):
            writeRoot(root)
        }
    }

    internal mutating func writeHarmonyChordKind(_ kind: MXLHarmony.Chord.Kind) {
        writeTextElement(.kind,
                         _formatHarmonyChordKindValue(kind.value),
                         attributes: _harmonyChordKindAttributes(kind))
    }

    internal mutating func writeHarmonyChords(_ chords: [MXLHarmony.Chord]) {
        // The parser reads the shared chord-symbol content (root/function/numeral,
        // inversion, bass, degree) from the harmony node once and pairs it with every
        // `<kind>`, so a parser-produced harmony carries identical content across its
        // chords. The writer reconstructs that shape: the first chord's content, then
        // one `<kind>` per chord.
        guard let first = chords.first
        else { return }

        writeHarmonyChordContent(first.content)

        for chord in chords {
            writeHarmonyChordKind(chord.kind)
        }

        if let inversion = first.inversion {
            writeInversion(inversion)
        }

        if let bass = first.bass {
            writeBass(bass)
        }

        for degree in first.degree {
            writeDegree(degree)
        }
    }

    internal mutating func writeInversion(_ inversion: MXLInversion) {
        var attributes: [(MXLAttributeName, String)] = []

        if let text = inversion.text {
            attributes.append((.text, text))
        }

        attributes += positionAttributes(inversion.position)
        attributes += fontAttributes(inversion.font)
        attributes += colorAttributes(inversion.color)

        writeTextElement(.inversion,
                         String(inversion.value),
                         attributes: attributes)
    }

    internal mutating func writeOffset(_ offset: MXLOffset) {
        writeTextElement(.offset,
                         formatDecimal(offset.value),
                         attributes: [(.sound, formatYesNo(offset.affectsPlayback))])
    }

    internal mutating func writeRoot(_ root: MXLRoot) {
        openElement(.root)

        writeRootStep(root.step)

        if let alter = root.alter {
            writeHarmonyAlter(.rootAlter, alter)
        }

        closeElement()
    }

    internal mutating func writeRootStep(_ step: MXLRoot.Step) {
        var attributes: [(MXLAttributeName, String)] = []

        if let text = step.text {
            attributes.append((.text, text))
        }

        attributes += positionAttributes(step.position)
        attributes += fontAttributes(step.font)
        attributes += colorAttributes(step.color)

        writeTextElement(.rootStep,
                         formatStep(step.value),
                         attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatDegreeKindValue(_ value: MXLDegree.Kind.Value) -> String {
        switch value {
        case .add:
            "add"

        case .alter:
            "alter"

        case .subtract:
            "subtract"
        }
    }

    private func _formatDegreeSymbolValue(_ value: MXLDegree.SymbolValue) -> String {
        switch value {
        case .augmented:
            "augmented"

        case .diminished:
            "diminished"

        case .halfDiminished:
            "half-diminished"

        case .major:
            "major"

        case .minor:
            "minor"
        }
    }

    private func _formatHarmonyArrangement(_ value: MXLHarmonyArrangement) -> String {
        switch value {
        case .diagonal:
            "diagonal"

        case .horizontal:
            "horizontal"

        case .vertical:
            "vertical"
        }
    }

    private func _formatHarmonyChordKindValue(_ value: MXLHarmony.Chord.Kind.Value) -> String {
        switch value {
        case .augmented:
            "augmented"

        case .augmentedSeventh:
            "augmented-seventh"

        case .diminished:
            "diminished"

        case .diminishedSeventh:
            "diminished-seventh"

        case .dominant:
            "dominant"

        case .dominant11th:
            "dominant-11th"

        case .dominant13th:
            "dominant-13th"

        case .dominantNinth:
            "dominant-ninth"

        case .french:
            "French"

        case .german:
            "German"

        case .halfDiminished:
            "half-diminished"

        case .italian:
            "Italian"

        case .major:
            "major"

        case .major11th:
            "major-11th"

        case .major13th:
            "major-13th"

        case .majorMinor:
            "major-minor"

        case .majorNinth:
            "major-ninth"

        case .majorSeventh:
            "major-seventh"

        case .majorSixth:
            "major-sixth"

        case .minor:
            "minor"

        case .minor11th:
            "minor-11th"

        case .minor13th:
            "minor-13th"

        case .minorNinth:
            "minor-ninth"

        case .minorSeventh:
            "minor-seventh"

        case .minorSixth:
            "minor-sixth"

        case .neapolitan:
            "Neapolitan"

        case .noChord:
            "none"

        case .other:
            "other"

        case .pedal:
            "pedal"

        case .power:
            "power"

        case .suspendedFourth:
            "suspended-fourth"

        case .suspendedSecond:
            "suspended-second"

        case .tristan:
            "Tristan"
        }
    }

    private func _formatHarmonyKind(_ value: MXLHarmony.Kind) -> String {
        switch value {
        case .alternate:
            "alternate"

        case .explicit:
            "explicit"

        case .implied:
            "implied"
        }
    }

    private func _harmonyAttributes(_ harmony: MXLHarmony) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = harmony.id {
            attributes.append((.id, id))
        }

        if let kind = harmony.kind {
            attributes.append((.type, _formatHarmonyKind(kind)))
        }

        if let printsObject = harmony.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        if let printsFrame = harmony.printsFrame {
            attributes.append((.printFrame, formatYesNo(printsFrame)))
        }

        if let arrangement = harmony.arrangement {
            attributes.append((.arrangement, _formatHarmonyArrangement(arrangement)))
        }

        attributes += positionAttributes(harmony.position)
        attributes += fontAttributes(harmony.font)
        attributes += colorAttributes(harmony.color)

        if let placement = harmony.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let system = harmony.system {
            attributes.append((.system, formatSystemRelation(system)))
        }

        return attributes
    }

    private func _harmonyChordKindAttributes(_ kind: MXLHarmony.Chord.Kind) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let usesSymbols = kind.usesSymbols {
            attributes.append((.useSymbols, formatYesNo(usesSymbols)))
        }

        if let text = kind.text {
            attributes.append((.text, text))
        }

        if let areDegreesStacked = kind.areDegreesStacked {
            attributes.append((.stackDegrees, formatYesNo(areDegreesStacked)))
        }

        if let areDegreesInParentheses = kind.areDegreesInParentheses {
            attributes.append((.parenthesesDegrees, formatYesNo(areDegreesInParentheses)))
        }

        if let areDegreesBracketed = kind.areDegreesBracketed {
            attributes.append((.bracketDegrees, formatYesNo(areDegreesBracketed)))
        }

        attributes += positionAttributes(kind.position)
        attributes += fontAttributes(kind.font)
        attributes += colorAttributes(kind.color)

        if let halign = kind.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = kind.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        return attributes
    }
}
