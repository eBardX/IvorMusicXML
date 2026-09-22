// © 2026 John Gary Pusey (see LICENSE.md)

import Foundation
@testable import IvorMusicXML
import Testing

// The corpus lives in `Tests/IvorMusicXMLTests/Fixtures/` and is copied into
// the test bundle wholesale by `Package.swift`, so subdirectory structure is
// preserved and every fixture is addressed by its group and file name.
internal enum FixtureLoader {

    // MARK: Internal Type Properties

    // Every fixture in the corpus, real-world and synthetic alike.
    internal static let allFixtures = allRealWorldFixtures + allSyntheticFixtures

    // This is the set the pipeline stages downstream of the parser operate
    // on; container, opus, and sounds documents are excluded, as are the
    // fixtures that are expected to fail to parse.
    internal static let allScoreFixtures = allFixtures.filter(\.expectation.isScore)
}

// MARK: -

extension FixtureLoader {

    // MARK: Internal Type Properties

    // The twenty-two real-world fixtures. All are part-wise, and all but
    // `BeetAnGeSample.mxl` declare version 4.0.
    internal static let allRealWorldFixtures: [Fixture] = [.init(name: "ActorPreludeSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 22,
                                                                                             firstMeasureItemCount: 4)),
                                                           .init(name: "BeetAnGeSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v3_1,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 7)),
                                                           .init(name: "Binchois.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 9)),
                                                           .init(name: "BrahWiMeSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 7)),
                                                           .init(name: "BrookeWestSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 4)),
                                                           .init(name: "Chant.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 33)),
                                                           .init(name: "chopin.musicxml",
                                                                 group: .realWorld,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 35)),
                                                           .init(name: "cowell-theme.musicxml",
                                                                 group: .realWorld,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 10)),
                                                           .init(name: "cowell-theme.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 10)),
                                                           .init(name: "DebuMandSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 5)),
                                                           .init(name: "Dichterliebe01.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 4)),
                                                           .init(name: "Echigo-Jishi.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 8)),
                                                           .init(name: "FaurReveSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 4)),
                                                           .init(name: "MahlFaGe4Sample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 7)),
                                                           .init(name: "MozaChloSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "MozartPianoSonata.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 17)),
                                                           .init(name: "MozartTrio.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 5,
                                                                                             firstMeasureItemCount: 7)),
                                                           .init(name: "MozaVeilSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "reve.musicxml",
                                                                 group: .realWorld,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 4)),
                                                           .init(name: "Saltarello.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 10)),
                                                           .init(name: "SchbAvMaSample.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "Telemann.mxl",
                                                                 group: .realWorld,
                                                                 isCompressed: true,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 4))]
}

// MARK: -

extension FixtureLoader {

    // MARK: Internal Type Properties

    // The hand-authored fixtures. These cover everything the real-world
    // corpus misses: the pre-4.0 versions the normalizer migrates, the
    // non-part-wise root kinds, and the small targeted scores the validator
    // and resolver phases assert against.
    internal static let allSyntheticFixtures: [Fixture] = [.init(name: "attributes-directive.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v1_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 2)),
                                                           .init(name: "backup-multi-voice.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 6)),
                                                           .init(name: "beam-repeater.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v2_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "bezier-offset.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v3_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "clef-sign-none.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v3_1,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 2)),
                                                           .init(name: "container.xml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .parseFailure),
                                                           .init(name: "dangling-part-id.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 2),
                                                                 expectsValidationIssues: true),
                                                           .init(name: "divisions-change.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "frame-valign-baseline.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .parseFailure),
                                                           .init(name: "group-name-formatting.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v1_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 2)),
                                                           .init(name: "harmony-function.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v3_1,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 5)),
                                                           .init(name: "measure-duration-mismatch.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "minimal-opus.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .opus),
                                                           .init(name: "minimal-partwise.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 2)),
                                                           .init(name: "minimal-timewise.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scoreTimewise(version: .v4_0,
                                                                                             partCount: 2,
                                                                                             firstMeasureItemCount: 2)),
                                                           .init(name: "multiple-rest.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 2)),
                                                           .init(name: "nested-opus-v1.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .opus),
                                                           .init(name: "part-name-formatting.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v1_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 2)),
                                                           .init(name: "print-staff-spacing.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v1_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "repeat-endings.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "sound-pan-elevation.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v1_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "sound-pan-no-instrument.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v1_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "staff-tuning-no-line.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .parseFailure),
                                                           .init(name: "titleless-opus.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .opus),
                                                           .init(name: "transpose.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "unmatched-slur.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v4_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 3)),
                                                           .init(name: "version-malformed.musicxml",
                                                                 group: .synthetic,
                                                                 isCompressed: false,
                                                                 expectation: .scorePartwise(version: .v1_0,
                                                                                             partCount: 1,
                                                                                             firstMeasureItemCount: 2))]
}

// MARK: -

extension FixtureLoader {

    // MARK: Internal Type Methods

    internal static func load(_ fixture: Fixture) throws -> Data {
        let url = try #require(Bundle.module.url(forResource: "Fixtures/\(fixture.group.directoryName)/\(fixture.name)",
                                                 withExtension: nil))

        return try Data(contentsOf: url)
    }

    // This backstops `allFixtures`: a file added to `Fixtures/` but not to
    // the list above shows up as a mismatch rather than going untested.
    internal static func namesOnDisk(in group: Fixture.Group) throws -> Set<String> {
        let url = try #require(Bundle.module.url(forResource: "Fixtures/\(group.directoryName)",
                                                 withExtension: nil))

        return try Set(FileManager.default.contentsOfDirectory(atPath: url.path))
    }

    // Honors the fixture’s compression flag when deciding how to parse it.
    internal static func parse(_ fixture: Fixture) throws -> (MXLDocument, [MXLParser.Diagnostic]) {
        try MXLParser().parse(load(fixture),
                              compressed: fixture.isCompressed)
    }
}
