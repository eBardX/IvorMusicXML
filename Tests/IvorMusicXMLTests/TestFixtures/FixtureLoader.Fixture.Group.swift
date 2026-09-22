// © 2026 John Gary Pusey (see LICENSE.md)

extension FixtureLoader.Fixture {

    // MARK: Internal Nested Types

    // The subdirectory of `Fixtures/` a fixture belongs to.
    internal enum Group {

        // A file collected from the wild, committed verbatim.
        case realWorld

        // A file hand-authored for this package, minimal enough to read in
        // one screen.
        case synthetic
    }
}

// MARK: -

extension FixtureLoader.Fixture.Group {

    // MARK: Internal Instance Properties

    // The directory name this group maps to inside the test bundle.
    internal var directoryName: String {
        switch self {
        case .realWorld:
            "RealWorld"

        case .synthetic:
            "Synthetic"
        }
    }
}

// MARK: - CaseIterable

extension FixtureLoader.Fixture.Group: CaseIterable {
}

// MARK: - Equatable

extension FixtureLoader.Fixture.Group: Equatable {
}

// MARK: - Hashable

extension FixtureLoader.Fixture.Group: Hashable {
}

// MARK: - Sendable

extension FixtureLoader.Fixture.Group: Sendable {
}
