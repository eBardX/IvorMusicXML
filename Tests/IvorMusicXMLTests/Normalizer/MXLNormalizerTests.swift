// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNormalizerTests {
}

// MARK: -

extension MXLNormalizerTests {
    @Test
    func changeMessage_isNotEmpty() {
        let allCases: [MXLNormalizer.Change] = [.convertedToPartwise,
                                                .renamedElement("old", "new"),
                                                .replacedConstruct("old", "new"),
                                                .suppliedDefault("divisions", "1"),
                                                .upgradedVersion(.v1_0, .v4_0)]

        for change in allCases {
            #expect(!change.message.isEmpty)
        }
    }

    @Test
    func changeMessage_quotesTheAssociatedValues() {
        #expect(MXLNormalizer.Change.renamedElement("directive", "other").message.contains("‘directive’"))
        #expect(MXLNormalizer.Change.suppliedDefault("divisions", "1").message.contains("‘1’"))
    }

    @Test
    func changeMessage_spellsVersionsInDottedForm() {
        let message = MXLNormalizer.Change.upgradedVersion(.v1_0, .v4_0).message

        #expect(message.contains("1.0"))
        #expect(message.contains("4.0"))
    }

    @Test
    func m1_movesStaffSpacingToStaffLayout() throws {
        let (score, changes) = try normalize("print-staff-spacing.musicxml")

        let print = try #require(firstMusicItem(score) { item -> MXLPrint? in
            guard case let .print(print) = item
            else { return nil }

            return print
        })

        #expect(print.attributes.staffSpacing == nil)
        #expect(print.layout.staffLayout.first?.staffDistance == 24)
        #expect(changes.contains(.replacedConstruct("print/@staff-spacing", "staff-layout/staff-distance")))
    }

    @Test
    func m3_movesPartNameFormattingToDisplay() throws {
        let (score, changes) = try normalize("part-name-formatting.musicxml")

        let scorePart = try #require(firstScorePart(score))

        #expect(!hasFormatting(scorePart.name.text))
        #expect(displayValue(scorePart.nameDisplay) == "Flute")
        #expect(displayValue(scorePart.abbreviationDisplay) == "Fl.")
        #expect(changes.contains(.replacedConstruct("part-name/@font-size", "part-name-display/display-text")))
        #expect(changes.contains(.replacedConstruct("part-abbreviation/@font-size",
                                                    "part-abbreviation-display/display-text")))
    }

    @Test
    func m4_movesGroupNameFormattingToDisplay() throws {
        let (score, changes) = try normalize("group-name-formatting.musicxml")

        let partGroup = try #require(score.partList.items.lazy.compactMap { item -> MXLPartGroup? in
            guard case let .partGroup(partGroup) = item,
                  partGroup.nameDisplay != nil
            else { return nil }

            return partGroup
        }.first)

        #expect(displayValue(partGroup.nameDisplay) == "Woodwinds")
        #expect(displayValue(partGroup.abbreviationDisplay) == "Ww.")
        #expect(changes.contains(.replacedConstruct("group-name/@font-size", "group-name-display/display-text")))
    }

    @Test
    func m5_leavesPanInPlaceWithNoMidiInstrument() throws {
        let (score, changes) = try normalize("sound-pan-no-instrument.musicxml")

        let sound = try #require(firstSound(score))

        #expect(sound.pan != nil)
        #expect(sound.elevation != nil)
        #expect(!changes.contains(.replacedConstruct("sound/@pan", "midi-instrument/pan")))
    }

    @Test
    func m5_movesPanAndElevationOntoMidiInstrument() throws {
        let (score, changes) = try normalize("sound-pan-elevation.musicxml")

        let sound = try #require(firstSound(score))

        #expect(sound.pan == nil)
        #expect(sound.elevation == nil)
        #expect(sound.group.first?.midiInstrument?.pan != nil)
        #expect(sound.group.first?.midiInstrument?.elevation != nil)
        #expect(changes.contains(.replacedConstruct("sound/@pan", "midi-instrument/pan")))
        #expect(changes.contains(.replacedConstruct("sound/@elevation", "midi-instrument/elevation")))
    }

    @Test
    func m8_convertsRomanNumeralFunctionToNumeral() throws {
        let (score, changes) = try normalize("harmony-function.musicxml")

        let harmonies = musicItems(score).compactMap { item -> MXLHarmony? in
            guard case let .harmony(harmony) = item
            else { return nil }

            return harmony
        }

        guard case let .numeral(numeral) = harmonies.first?.chord.first?.content
        else {
            Issue.record("first harmony was not converted to a numeral")

            return
        }

        #expect(numeral.root.value.uintValue == 5)

        guard case .function = harmonies.last?.chord.first?.content
        else {
            Issue.record("second harmony should remain a function")

            return
        }

        #expect(changes.filter { $0 == .replacedConstruct("harmony/function", "harmony/numeral") }.count == 1)
    }

    @Test
    func m9_replacesNoneSignWithHiddenTrebleClef() throws {
        let (score, changes) = try normalize("clef-sign-none.musicxml")

        let attributes = try #require(firstMusicItem(score) { item -> MXLAttributes? in
            guard case let .attributes(attributes) = item
            else { return nil }

            return attributes
        })

        let clef = try #require(attributes.clef.first)

        #expect(clef.content.sign == .g)
        #expect(clef.printsObject == false)
        #expect(changes.contains(.replacedConstruct("clef/sign[none]", "clef/@print-object")))
    }

    @Test
    func migration_clearsIsValidatedWhenContentChanges() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "clef-sign-none.musicxml" })
        let (parsed, _) = try FixtureLoader.parse(fixture)
        let document = MXLDocument(content: parsed.content,
                                   isNormalized: false,
                                   isValidated: true)

        let (normalized, changes) = MXLNormalizer().normalize(document)

        #expect(!changes.isEmpty)
        #expect(!normalized.isValidated)
    }

    @Test
    func migration_isIdempotent() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "clef-sign-none.musicxml" })
        let (document, _) = try FixtureLoader.parse(fixture)

        let (once, _) = MXLNormalizer().normalize(document)
        let (twice, changes) = MXLNormalizer().normalize(once)

        #expect(changes.isEmpty)
        #expect(twice.content == once.content)
    }

    @Test
    func migration_stampsCurrentVersion() throws {
        let (score, changes) = try normalize("clef-sign-none.musicxml")

        #expect(score.version == .current)
        #expect(changes.contains(.upgradedVersion(.v3_1, .current)))
    }

    @Test
    func normalize_acceptsEveryContentKind() throws {
        for fixture in FixtureLoader.allFixtures where fixture.expectation != .parseFailure {
            let (document, _) = try FixtureLoader.parse(fixture)

            #expect(MXLNormalizer().normalize(document).0.isNormalized,
                    "\(fixture.testDescription) failed to normalize")
        }
    }

    @Test
    func normalize_isIdempotent() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "minimal-partwise.musicxml" })
        let (document, _) = try FixtureLoader.parse(fixture)

        let (once, _) = MXLNormalizer().normalize(document)
        let (twice, changes) = MXLNormalizer().normalize(once)

        #expect(changes.isEmpty)
        #expect(twice.content == once.content)
        #expect(twice.isNormalized)
    }

    @Test
    func normalize_leavesACurrentOpusUnchanged() {
        let opus = MXLOpus(version: .current,
                           title: "Collected Works",
                           items: [.opus(MXLOpus(version: .current,
                                                 title: "Volume One"))])
        let document = MXLDocument(content: .opus(opus))

        let (normalized, changes) = MXLNormalizer().normalize(document)

        #expect(changes.isEmpty)
        #expect(normalized.content == .opus(opus))
        #expect(normalized.isNormalized)
    }

    @Test
    func normalize_leavesContentUnchanged() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "minimal-partwise.musicxml" })
        let (document, _) = try FixtureLoader.parse(fixture)

        let (normalized, _) = MXLNormalizer().normalize(document)

        #expect(normalized.content == document.content)
    }

    @Test
    func normalize_preservesIsValidated() {
        // Already at the current version, so the stamp makes no change and the
        // flag survives.
        let document = MXLDocument(content: .opus(MXLOpus(version: .current,
                                                          title: "Sample")),
                                   isNormalized: false,
                                   isValidated: true)

        let (normalized, _) = MXLNormalizer().normalize(document)

        #expect(normalized.isNormalized)
        #expect(normalized.isValidated)
    }

    @Test
    func normalize_setsIsNormalized() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "minimal-partwise.musicxml" })
        let (document, _) = try FixtureLoader.parse(fixture)

        #expect(!document.isNormalized)

        let (normalized, changes) = MXLNormalizer().normalize(document)

        #expect(normalized.isNormalized)
        #expect(changes.isEmpty)
    }

    @Test
    func normalize_stampsEveryNestedOpusVersion() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "nested-opus-v1.musicxml" })
        let (document, _) = try FixtureLoader.parse(fixture)

        guard case let .opus(parsed) = document.content,
              case let .opus(parsedNested) = parsed.items[0]
        else {
            Issue.record("Expected a nested opus")

            return
        }

        #expect(parsed.version == .v1_0)
        #expect(parsedNested.version == .v1_0)

        let (normalized, changes) = MXLNormalizer().normalize(document)

        guard case let .opus(stamped) = normalized.content,
              case let .opus(stampedNested) = stamped.items[0]
        else {
            Issue.record("Expected a nested opus")

            return
        }

        #expect(stamped.version == .current)
        #expect(stampedNested.version == .current)
        #expect(changes == [.upgradedVersion(.v1_0, .current)])
    }
}
