// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

// These assertions are the corpus’s reason for existing: every fixture parses
// to the root kind, version, and shape recorded in `FixtureLoader`, and the
// three that cannot be represented fail loudly rather than quietly. Later
// phases reshape the pipeline around them, and they are expected to survive
// that unchanged.
struct FixtureLoaderTests {
}

// MARK: -

extension FixtureLoaderTests {
    @Test(arguments: FixtureLoader.Fixture.Group.allCases)
    func allFixtures_matchesTheBundleContents(_ group: FixtureLoader.Fixture.Group) throws {
        let listed = Set(FixtureLoader.allFixtures.filter { $0.group == group }.map(\.name))

        #expect(try listed == (FixtureLoader.namesOnDisk(in: group)))
    }

    @Test
    func allScoreFixtures_excludesNonScoreRoots() {
        let names = Set(FixtureLoader.allScoreFixtures.map(\.name))

        #expect(!names.contains("container.xml"))
        #expect(!names.contains("minimal-opus.musicxml"))
        #expect(names.contains("minimal-partwise.musicxml"))
        #expect(names.contains("minimal-timewise.musicxml"))
    }
}
