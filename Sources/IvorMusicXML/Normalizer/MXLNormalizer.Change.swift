// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNormalizer {

    /// A change applied when normalizing an ``MXLDocument`` to the most recent
    /// supported MusicXML version.
    ///
    /// The cases are declared here in full; the normalizer does not emit any of
    /// them yet.
    public enum Change {

        /// A time-wise score was converted to its part-wise encoding.
        case convertedToPartwise

        /// An element was renamed by a later schema. The first associated value
        /// is the original element name; the second is the replacement.
        ///
        /// No element was ever renamed or removed across the five version steps
        /// covered by `Design/MigrationTable.md`, so this case has no caller from the
        /// schema record alone. It is declared for a future schema that does
        /// rename one.
        case renamedElement(String, String)

        /// A deprecated construct was replaced with its modern equivalent. The
        /// first associated value is the original construct; the second is the
        /// replacement.
        case replacedConstruct(String, String)

        /// A value the schema leaves implicit was written out explicitly. The
        /// first associated value is the element or attribute name; the second
        /// is the value supplied.
        case suppliedDefault(String, String)

        /// The document version was raised. The first associated value is the
        /// original version; the second is the version normalized to.
        case upgradedVersion(MXLDocument.Version, MXLDocument.Version)
    }
}

// MARK: -

extension MXLNormalizer.Change {

    // MARK: Public Instance Properties

    /// A human-readable description of this change.
    public var message: String {
        switch self {
        case .convertedToPartwise:
            "Time-wise score converted to part-wise"

        case let .renamedElement(oldName, newName):
            "Element ‘\(oldName)’ renamed to ‘\(newName)’"

        case let .replacedConstruct(oldConstruct, newConstruct):
            "Deprecated construct ‘\(oldConstruct)’ replaced with ‘\(newConstruct)’"

        case let .suppliedDefault(name, value):
            "Default value ‘\(value)’ supplied for ‘\(name)’"

        case let .upgradedVersion(oldVersion, newVersion):
            "Document version upgraded from \(_label(oldVersion)) to \(_label(newVersion))"
        }
    }
}

// MARK: - Equatable

extension MXLNormalizer.Change: Equatable {
}

// MARK: - Sendable

extension MXLNormalizer.Change: Sendable {
}

// MARK: - Private Functions

private func _label(_ version: MXLDocument.Version) -> String {
    "\(version.major).\(version.minor)"
}
