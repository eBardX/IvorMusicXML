// © 2026 John Gary Pusey (see LICENSE.md)

import Testing

extension FixtureLoader {

    // MARK: Internal Nested Types

    // One file in the fixture corpus, together with everything a
    // parameterized test needs to know about it up front.
    internal struct Fixture {

        // MARK: Internal Initializers

        internal init(name: String,
                      group: Group,
                      isCompressed: Bool,
                      expectation: Expectation,
                      expectsValidationIssues: Bool = false) {
            self.expectation = expectation
            self.expectsValidationIssues = expectsValidationIssues
            self.group = group
            self.isCompressed = isCompressed
            self.name = name
        }

        // MARK: Internal Instance Properties

        internal let expectation: Expectation

        // A fixture is deliberately built to trip a validator check; every
        // other score fixture — including all real-world files — is expected
        // to validate clean.
        internal let expectsValidationIssues: Bool

        // The subdirectory of `Fixtures/` holding this fixture.
        internal let group: Group

        // This cannot be inferred from the bundle, and `parse(_:compressed:)`
        // requires it, so it is recorded here.
        internal let isCompressed: Bool

        internal let name: String
    }
}

// MARK: - CustomTestStringConvertible

extension FixtureLoader.Fixture: CustomTestStringConvertible {
    internal var testDescription: String {
        "\(group.directoryName)/\(name)"
    }
}

// MARK: - Sendable

extension FixtureLoader.Fixture: Sendable {
}
