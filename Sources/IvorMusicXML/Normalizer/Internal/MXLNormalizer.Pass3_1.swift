// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNormalizer {

    // The MusicXML 3.1 to 4.0 migration pass.
    //
    // Implements migration rows M8 and M9 of `Design/MigrationTable.md`:
    //
    // - M8 — a `<harmony>` `<function>` whose text is a plain Roman numeral
    //   is replaced by a `<numeral>`. This migration is conditional: text
    //   that does not match the Roman-numeral grammar exactly (an optional
    //   leading accidental followed by `I`–`VII`) is left as a `<function>`.
    // - M9 — a `<clef>` whose sign is the deprecated `none` value is
    //   replaced by a treble (`G`) sign with `print-object` set to `no`.
    internal struct Pass3_1 {   // swiftlint:disable:this type_name

        // MARK: Internal Initializers

        internal init() {
        }
    }
}

// MARK: -

extension MXLNormalizer.Pass3_1 {

    // MARK: Internal Instance Methods

    internal func apply(to score: MXLScorePartwise) -> (MXLScorePartwise, [MXLNormalizer.Change]) {
        var changes: [MXLNormalizer.Change] = []

        let edited = score.mappingMusicItems { item in
            switch item {
            case let .attributes(attributes):
                .attributes(Self._migrate(attributes, &changes))

            case let .harmony(harmony):
                .harmony(Self._migrate(harmony, &changes))

            default:
                item
            }
        }

        return (edited, changes)
    }
}

// MARK: -

extension MXLNormalizer.Pass3_1 {

    // MARK: Private Type Methods

    private static func _accidentalStep(_ character: Character) -> Double? {
        switch character {
        case "\u{266D}",
             "b":
            -1

        case "\u{266F}",
             "#":
            1

        default:
            nil
        }
    }

    private static func _migrate(_ harmony: MXLHarmony,
                                 _ changes: inout [MXLNormalizer.Change]) -> MXLHarmony {
        let chords = harmony.chord.map { chord -> MXLHarmony.Chord in
            guard case let .function(function) = chord.content,
                  let numeral = _numeral(from: function)
            else { return chord }

            changes.append(.replacedConstruct("harmony/function", "harmony/numeral"))

            return MXLHarmony.Chord(content: .numeral(numeral),
                                    kind: chord.kind,
                                    inversion: chord.inversion,
                                    bass: chord.bass,
                                    degree: chord.degree)
        }

        return MXLHarmony(id: harmony.id,
                          chord: chords,
                          frame: harmony.frame,
                          offset: harmony.offset,
                          footnote: harmony.footnote,
                          level: harmony.level,
                          staff: harmony.staff,
                          kind: harmony.kind,
                          printsObject: harmony.printsObject,
                          printsFrame: harmony.printsFrame,
                          arrangement: harmony.arrangement,
                          position: harmony.position,
                          font: harmony.font,
                          color: harmony.color,
                          placement: harmony.placement,
                          system: harmony.system)
    }

    private static func _numeral(from function: MXLStyleText) -> MXLNumeral? {
        var body = Substring(function.value)
        var alter: Double?

        if let first = body.first,
           let step = _accidentalStep(first) {
            alter = step
            body = body.dropFirst()
        }

        guard let value = _rootValue(String(body))
        else { return nil }

        let root = MXLNumeral.Root(value: value,
                                   text: String(body),
                                   position: function.printStyle.position,
                                   font: function.printStyle.font,
                                   color: function.printStyle.color)

        return MXLNumeral(root: root,
                          alter: alter.map { MXLHarmonyAlter(value: $0) })
    }

    private static func _rootValue(_ text: String) -> MXLNumeral.Value? {
        let numerals = ["I": 1, "II": 2, "III": 3, "IV": 4, "V": 5, "VI": 6, "VII": 7]

        guard let value = numerals[text.uppercased()]
        else { return nil }

        return MXLNumeral.Value(uintValue: UInt(value))
    }
}

// MARK: -

extension MXLNormalizer.Pass3_1 {

    // MARK: Private Type Methods

    private static func _migrate(_ attributes: MXLAttributes,
                                 _ changes: inout [MXLNormalizer.Change]) -> MXLAttributes {
        let clefs = attributes.clef.map { clef -> MXLClef in
            guard case .invisible = clef.content.sign
            else { return clef }

            changes.append(.replacedConstruct("clef/sign[none]", "clef/@print-object"))

            return MXLClef(id: clef.id,
                           content: MXLClef.Content(sign: .g,
                                                    line: clef.content.line,
                                                    octaveChange: clef.content.octaveChange),
                           number: clef.number,
                           isAdditional: clef.isAdditional,
                           size: clef.size,
                           isAfterBarline: clef.isAfterBarline,
                           position: clef.position,
                           font: clef.font,
                           color: clef.color,
                           printsObject: false)
        }

        return MXLAttributes(footnote: attributes.footnote,
                             level: attributes.level,
                             divisions: attributes.divisions,
                             key: attributes.key,
                             time: attributes.time,
                             staves: attributes.staves,
                             partSymbol: attributes.partSymbol,
                             instruments: attributes.instruments,
                             clef: clefs,
                             staffDetails: attributes.staffDetails,
                             content: attributes.content,
                             directive: attributes.directive,
                             measureStyle: attributes.measureStyle)
    }
}
