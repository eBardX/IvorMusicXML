// © 2026 John Gary Pusey (see LICENSE.md)

/// A type that validates a MusicXML score against the MusicXML specification.
public struct MXLValidator {

    // MARK: Public Initializers

    /// Creates a new MusicXML validator.
    public init() {
    }
}

// MARK: -

extension MXLValidator {

    // MARK: Public Instance Methods

    /// Validates the provided document against the MusicXML specification and
    /// returns any issues found.
    ///
    /// The document is checked for conformance the schema cannot express and the
    /// parser does not enforce — referential integrity, durations declared before
    /// any divisions, ending pairing, part-group balance, and standard instrument
    /// sounds. Only checks that
    /// are sound on conforming input are performed; see ``Issue`` for the ones
    /// deliberately omitted. The checks run against the part-wise score; a
    /// time-wise score (which the normalizer converts to part-wise, so the
    /// canonical pipeline never presents one here) is projected to part-wise
    /// before checking.
    ///
    /// An opus passes straight through, marked validated with no issues: its
    /// schema is four elements and the parser already enforces nearly everything
    /// they constrain, so there is nothing left for the checker to decide.
    ///
    /// - Parameter document:   The document to validate.
    ///
    /// - Returns:  A tuple of the validated document and an array of ``Issue``
    ///             values. The document in the tuple is a copy of `document`
    ///             with ``MXLDocument/isValidated`` set to `true` when no issues
    ///             are found; otherwise `document` is returned unchanged
    ///             (re-validating after fixing issues is required). An empty
    ///             issues array means the document is fully conformant.
    ///
    /// - Throws:   ``Error/notNormalized`` if ``MXLDocument/isNormalized`` is
    ///             `false`. Call ``MXLNormalizer/normalize(_:)`` before calling
    ///             this method.
    public func validate(_ document: MXLDocument) throws(Error) -> (MXLDocument, [Issue]) {
        guard !document.isValidated
        else { return (document, []) }

        guard document.isNormalized
        else { throw Error.notNormalized }

        let partwise: MXLScorePartwise

        switch document.content {
        case .opus:
            // The opus schema is four elements and the parser already enforces
            // nearly everything it constrains, so there is nothing to check yet.
            // The pass-through lives here rather than in the parser so that a
            // future opus check needs only a new `Issue` case and a `Checker`
            // arm, not a structural change.
            return (MXLDocument(content: document.content,
                                isNormalized: document.isNormalized,
                                isValidated: true), [])

        case let .scorePartwise(score):
            partwise = score

        case let .scoreTimewise(score):
            partwise = MXLScoreTransform().toPartwise(score).0
        }

        var checker = Checker(score: partwise)

        let issues = checker.check()

        guard issues.isEmpty
        else { return (document, issues) }

        return (MXLDocument(content: document.content,
                            isNormalized: document.isNormalized,
                            isValidated: true), [])
    }
}

// MARK: - Sendable

extension MXLValidator: Sendable {
}
