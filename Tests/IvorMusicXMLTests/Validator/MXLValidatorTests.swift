// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLValidatorTests {
}

// MARK: -

extension MXLValidatorTests {
    @Test
    func errorMessage_isNotEmpty() {
        let allCases: [MXLValidator.Error] = [.notNormalized]

        for error in allCases {
            #expect(!error.message.isEmpty)
            #expect(error.category == Category("IvorMusicXML"))
        }
    }

    @Test(arguments: FixtureLoader.allScoreFixtures)
    func parseNormalizeValidate_leavesEveryScoreFixtureValidated(_ fixture: FixtureLoader.Fixture) throws {
        let (document, _) = try FixtureLoader.parse(fixture)

        let (normalized, _) = MXLNormalizer().normalize(document)
        let (validated, issues) = try MXLValidator().validate(normalized)

        // A handful of synthetic fixtures are built to trip a validator check;
        // every other score fixture — including all real-world files — validates
        // clean. See `MXLValidator.Issue` for why the catalogue is confined to
        // checks that never fire on a conforming score.
        guard !fixture.expectsValidationIssues
        else {
            #expect(!issues.isEmpty)
            #expect(!validated.isValidated)

            return
        }

        #expect(issues.isEmpty)
        #expect(validated.isNormalized)
        #expect(validated.isValidated)

        // The normalizer stamps every part-wise score to the most recent
        // version; time-wise scores pass through until the transform pair lands.
        if case let .scorePartwise(score) = validated.content {
            #expect(score.version == .current)
        }

        // Normalization is idempotent: re-normalizing makes no further change.
        #expect(MXLNormalizer().normalize(validated).1.isEmpty)
    }

    @Test
    func validate_acceptsTimewiseScores() throws {
        let document = try normalizedDocument("minimal-timewise.musicxml")

        #expect(try MXLValidator().validate(document).0.isValidated)
    }

    @Test
    func validate_checksNormalizationBeforeContentKind() {
        let document = MXLDocument(content: .opus(MXLOpus(title: "Sample")))

        #expect(throws: MXLValidator.Error.notNormalized) {
            try MXLValidator().validate(document)
        }
    }

    @Test
    func validate_isIdempotent() throws {
        let once = try MXLValidator().validate(normalizedDocument("minimal-partwise.musicxml")).0
        let (twice, issues) = try MXLValidator().validate(once)

        #expect(issues.isEmpty)
        #expect(twice.content == once.content)
        #expect(twice.isValidated)
    }

    @Test
    func validate_passesOpusThrough() throws {
        let document = try normalizedDocument("minimal-opus.musicxml")
        let (validated, issues) = try MXLValidator().validate(document)

        #expect(issues.isEmpty)
        #expect(validated.isValidated)
        #expect(validated.content == document.content)
    }

    @Test
    func validate_setsIsValidated() throws {
        let document = try normalizedDocument("minimal-partwise.musicxml")

        #expect(!document.isValidated)

        let (validated, issues) = try MXLValidator().validate(document)

        #expect(validated.isValidated)
        #expect(issues.isEmpty)
        #expect(validated.content == document.content)
        #expect(validated.isNormalized)
    }

    @Test
    func validate_throwsWhenNotNormalized() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "minimal-partwise.musicxml" })
        let (document, _) = try FixtureLoader.parse(fixture)

        #expect(throws: MXLValidator.Error.notNormalized) {
            try MXLValidator().validate(document)
        }
    }
}
