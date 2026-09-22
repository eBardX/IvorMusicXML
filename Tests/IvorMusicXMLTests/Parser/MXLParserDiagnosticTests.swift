// © 2026 John Gary Pusey (see LICENSE.md)

import Foundation
@testable import IvorMusicXML
import Testing

struct MXLParserDiagnosticTests {
}

// MARK: -

extension MXLParserDiagnosticTests {
    @Test
    func message_isNotEmpty() {
        let allCases: [MXLParser.Diagnostic] = [.defaultedVersion,
                                                .deprecatedAttribute("staff-spacing"),
                                                .deprecatedElement("directive"),
                                                .ignoredAttribute("bogus"),
                                                .ignoredElement("bogus"),
                                                .malformedVersion("4")]

        for diagnostic in allCases {
            #expect(!diagnostic.message.isEmpty)
        }
    }

    @Test
    func message_quotesTheAssociatedValue() {
        #expect(MXLParser.Diagnostic.malformedVersion("4").message.contains("‘4’"))
        #expect(MXLParser.Diagnostic.deprecatedElement("directive").message.contains("‘directive’"))
    }

    @Test
    func parse_cleanFixtureYieldsNoDiagnostics() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "minimal-partwise.musicxml" })
        let (_, diagnostics) = try FixtureLoader.parse(fixture)

        #expect(diagnostics.isEmpty)
    }

    @Test(arguments: FixtureLoader.allFixtures.filter { $0.expectation != .parseFailure })
    func parse_fixtureDiagnosticsAreOnlyAboutTheVersion(_ fixture: FixtureLoader.Fixture) throws {
        let (_, diagnostics) = try FixtureLoader.parse(fixture)

        for diagnostic in diagnostics {
            #expect(diagnostic == .defaultedVersion
                    || diagnostic == .malformedVersion("4"),
                    "\(fixture.testDescription) produced \(diagnostic.message)")
        }
    }

    @Test
    func parse_malformedVersionDefaultsTheScoreVersion() throws {
        let (document, _) = try MXLParser().parse(Data(scoreXML(#"version="4""#).utf8),
                                                  compressed: false)

        guard case let .scorePartwise(score) = document.content
        else {
            Issue.record("Expected a part-wise score")

            return
        }

        #expect(score.version == .v1_0)
    }

    @Test
    func parse_malformedVersionFixtureParsesAndReports() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "version-malformed.musicxml" })
        let (_, diagnostics) = try FixtureLoader.parse(fixture)

        #expect(diagnostics == [.malformedVersion("4")])
    }

    @Test
    func parse_malformedVersionYieldsMalformedVersion() throws {
        #expect(try diagnostics(for: scoreXML(#"version="4""#)) == [.malformedVersion("4")])
    }

    @Test
    func parse_missingVersionYieldsDefaultedVersion() throws {
        #expect(try diagnostics(for: scoreXML("")) == [.defaultedVersion])
    }

    @Test
    func parse_opusReportsItsOwnAndItsNestedVersions() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <opus>
          <title>Collected Works</title>
          <opus>
            <title>Nested Opus</title>
          </opus>
        </opus>
        """

        #expect(try diagnostics(for: xml) == [.defaultedVersion, .defaultedVersion])
    }

    @Test
    func parse_versionlessFixtureYieldsDefaultedVersion() throws {
        let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == "attributes-directive.musicxml" })
        let (_, diagnostics) = try FixtureLoader.parse(fixture)

        #expect(diagnostics == [.defaultedVersion])
    }

    @Test
    func parse_wellFormedVersionYieldsNoDiagnostics() throws {
        #expect(try diagnostics(for: scoreXML(#"version="4.0""#)).isEmpty)
    }
}
