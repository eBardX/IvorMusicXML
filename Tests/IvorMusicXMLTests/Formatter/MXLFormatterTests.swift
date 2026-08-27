// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterTests {
}

// MARK: -

extension MXLFormatterTests {
    @Test
    func errorMessage_isNotEmpty() {
        let allCases: [MXLFormatter.Error] = [.notValidated,
                                              .unsupportedTimewise,
                                              .writeFailure(nil)]

        for error in allCases {
            #expect(!error.message.isEmpty)
            #expect(error.category == Category("IvorMusicXML"))
        }
    }

    @Test
    func format_roundTripsMinimalPartwiseScore() throws {
        let document = partwiseDocument(note: note())

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }

    @Test
    func format_roundTripsOpus() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Sample",
                           items: [.score(MXLOpus.Score(xlink: MXLXLink(href: "movement1.musicxml")))])
        let document = MXLDocument(content: .opus(opus),
                                   isNormalized: true,
                                   isValidated: true)

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }

    @Test
    func format_roundTripsScoreWithFormattingAttributes() throws {
        let customNote = note(color: "#800080",
                              xPosition: MXLXPosition(defaultX: 10))
        let partNameText = MXLPartName.Text(position: MXLPosition(defaultX: 5),
                                            color: "#FF0000")
        let document = partwiseDocument(note: customNote,
                                        partNameText: partNameText)

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }

    @Test
    func format_throwsForTimewiseScore() {
        let score = MXLScoreTimewise(partList: MXLPartList(items: []))
        let document = MXLDocument(content: .scoreTimewise(score),
                                   isNormalized: true,
                                   isValidated: true)

        #expect {
            try MXLFormatter().format(document,
                                      compressed: false)
        } throws: { error in
            guard case MXLFormatter.Error.unsupportedTimewise = error
            else { return false }

            return true
        }
    }

    @Test
    func format_throwsWhenNotValidated() {
        let document = partwiseDocument(note: note())
        let unvalidated = MXLDocument(content: document.content,
                                      isNormalized: true,
                                      isValidated: false)

        #expect {
            try MXLFormatter().format(unvalidated,
                                      compressed: false)
        } throws: { error in
            guard case MXLFormatter.Error.notValidated = error
            else { return false }

            return true
        }
    }

    // The round-trip corpus test — the single highest-value assertion in the plan.
    //
    // Every fixture is driven through the full pipeline
    // `parse → normalize → validate → format → parse` and checked against an
    // explicit, per-kind expectation, so no fixture is ever silently excluded:
    //
    // - part-wise scores round-trip to an equal `MXLDocument` content, both
    //   uncompressed and compressed;
    // - an opus round-trips the same way: the normalizer stamps its version, the
    //   validator passes it through, and the formatter writes an `<opus>` root;
    // - a time-wise score is converted to part-wise by the normalizer and
    //   round-trips to an equal part-wise document, the same as a part-wise
    //   fixture;
    // - the two conforming-but-unrepresentable fixtures never reach the formatter,
    //   so the pipeline cannot even start.
    @Test(arguments: FixtureLoader.allFixtures)
    func roundTrip_matchesExpectation(_ fixture: FixtureLoader.Fixture) throws {
        switch fixture.expectation {
        case .opus:
            // The compressed pass also proves the read path accepts an opus root
            // file: `MXLParser.parse(_:compressed:)` resolves the archive through
            // `META-INF/container.xml`, and `parseContent` handles `.opus`.
            try expectRoundTrip(fixture,
                                compressed: false)
            try expectRoundTrip(fixture,
                                compressed: true)

        case .parseFailure:
            #expect(throws: (any Error).self) {
                try FixtureLoader.parse(fixture)
            }

        case .scorePartwise,
             .scoreTimewise:
            // A fixture built to trip a validator check never becomes validated,
            // so the formatter gate rejects it — it is exercised by the validator
            // suite, not here.
            guard !fixture.expectsValidationIssues
            else {
                try expectValidationIssues(fixture)

                return
            }

            // The normalizer converts time-wise to part-wise, so the formatter
            // never sees a time-wise score through the pipeline: a time-wise
            // fixture round-trips to an equal part-wise document, the same as a
            // part-wise fixture, both uncompressed and compressed.
            try expectRoundTrip(fixture,
                                compressed: false)
            try expectRoundTrip(fixture,
                                compressed: true)
        }
    }
}
