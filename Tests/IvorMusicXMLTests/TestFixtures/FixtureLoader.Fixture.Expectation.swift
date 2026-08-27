// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML

extension FixtureLoader.Fixture {

    // MARK: Internal Nested Types

    // The score cases carry the golden spot values the fixture parse suite
    // asserts. They are deliberately shallow — enough to catch a regression
    // in the parser, not a transcription of the file.
    internal enum Expectation {

        // An `<opus>` root.
        case opus

        // Both remaining fixtures are conforming MusicXML the parser cannot
        // represent (see `Design/MigrationTable.md` §5). The malformed
        // `version` attribute that once belonged here now yields
        // `MXLParser.Diagnostic.malformedVersion(_:)` instead of an error.
        case parseFailure

        // A `<score-partwise>` root.
        case scorePartwise(version: MXLDocument.Version,
                           partCount: Int,
                           firstMeasureItemCount: Int)

        // A `<score-timewise>` root.
        case scoreTimewise(version: MXLDocument.Version,
                           partCount: Int,
                           firstMeasureItemCount: Int)
    }
}

// MARK: -

extension FixtureLoader.Fixture.Expectation {

    // MARK: Internal Instance Properties

    // Whether this fixture parses to a score, part-wise or time-wise.
    internal var isScore: Bool {
        switch self {
        case .opus,
             .parseFailure:
            false

        case .scorePartwise,
             .scoreTimewise:
            true
        }
    }
}

// MARK: - Equatable

extension FixtureLoader.Fixture.Expectation: Equatable {
}

// MARK: - Hashable

extension FixtureLoader.Fixture.Expectation: Hashable {
}

// MARK: - Sendable

extension FixtureLoader.Fixture.Expectation: Sendable {
}
