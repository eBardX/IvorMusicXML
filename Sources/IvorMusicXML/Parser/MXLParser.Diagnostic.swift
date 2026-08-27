// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLParser {

    /// A note about something the parser accepted but considered worth
    /// reporting.
    ///
    /// A diagnostic never means the parser recovered from an error. Malformed
    /// input throws ``MXLParser/Error``; a diagnostic accompanies a document
    /// that parsed successfully and describes a form that is accepted, but that
    /// a caller may want to know about — a deprecated spelling passed through,
    /// a construct the AST does not model, or a defaulted document version.
    public enum Diagnostic {

        /// The document carried no `version` attribute, so version `1.0` was
        /// assumed.
        ///
        /// This is routine rather than anomalous for older documents: the
        /// `version` attribute does not exist before MusicXML 2.0, so every
        /// conforming 1.0 and 1.1 document produces this diagnostic, and `1.0`
        /// is the schema’s own default.
        case defaultedVersion

        /// An attribute superseded by a later schema was accepted and passed
        /// through unchanged. The associated value is the attribute name as it
        /// appeared in the source.
        ///
        /// The deprecated attribute spellings are `bezier-offset`,
        /// `bezier-offset2`, `color`, `elevation`, `font-family`, `font-size`,
        /// `font-style`, `font-weight`, `justify`, `pan`, `repeater`, and
        /// `staff-spacing` — see `Design/MigrationTable.md` §4 for the elements each
        /// applies to.
        case deprecatedAttribute(String)

        /// An element superseded by a later schema was accepted and passed
        /// through unchanged. The associated value is the element name as it
        /// appeared in the source.
        ///
        /// The deprecated element spellings are `directive` and `function` —
        /// see `Design/MigrationTable.md` §4.
        case deprecatedElement(String)

        /// An attribute present in the source is not modeled by the AST and
        /// was dropped. The associated value is the attribute name.
        case ignoredAttribute(String)

        /// An element present in the source is not modeled by the AST and was
        /// dropped. The associated value is the element name.
        case ignoredElement(String)

        /// The `version` attribute did not parse as a `M.m` version number, so
        /// version `1.0` was assumed. The associated value is the raw attribute
        /// value.
        case malformedVersion(String)
    }
}

// MARK: -

extension MXLParser.Diagnostic {

    // MARK: Public Instance Properties

    /// A human-readable description of this diagnostic.
    public var message: String {
        switch self {
        case .defaultedVersion:
            "No version attribute; document version is treated as 1.0"

        case let .deprecatedAttribute(name):
            "Deprecated attribute ‘\(name)’ accepted unchanged"

        case let .deprecatedElement(name):
            "Deprecated element ‘\(name)’ accepted unchanged"

        case let .ignoredAttribute(name):
            "Attribute ‘\(name)’ is not modelled and was ignored"

        case let .ignoredElement(name):
            "Element ‘\(name)’ is not modelled and was ignored"

        case let .malformedVersion(rawValue):
            "Malformed version attribute ‘\(rawValue)’; document version is treated as 1.0"
        }
    }
}

// MARK: - Equatable

extension MXLParser.Diagnostic: Equatable {
}

// MARK: - Sendable

extension MXLParser.Diagnostic: Sendable {
}
