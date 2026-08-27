// © 2026 John Gary Pusey (see LICENSE.md)

/// A type that normalizes a MusicXML document to the most recent supported
/// MusicXML version.
public struct MXLNormalizer {

    // MARK: Public Initializers

    /// Creates a new MusicXML normalizer.
    public init() {
    }
}

// MARK: -

extension MXLNormalizer {

    // MARK: Public Instance Methods

    /// Returns a copy of the provided document normalized to the most recent
    /// supported MusicXML version, along with an array describing each change
    /// applied.
    ///
    /// Normalization is idempotent: calling `normalize(_:)` on an
    /// already-normalized document returns it immediately with an empty changes
    /// array.
    ///
    /// A part-wise score is run through an ordered chain of per-version
    /// migration passes, entering at its declared version and stamping the
    /// result with the most recent supported version. A time-wise score is first
    /// converted to part-wise — that conversion is itself a deprecation
    /// migration — and then run through the same chain, so a normalized document
    /// is never time-wise. An opus has no migration passes — the opus schema has
    /// never changed structurally — but it does take the same closing version
    /// stamp, applied at every level of nesting. Normalizing a document whose
    /// content changes clears
    /// ``MXLDocument/isValidated``, since any prior validation no longer applies.
    ///
    /// - Parameter document:   The document to normalize.
    ///
    /// - Returns:  A tuple of a new ``MXLDocument`` whose
    ///             ``MXLDocument/isNormalized`` is `true`, and an array of
    ///             ``Change`` values describing each normalization applied.
    public func normalize(_ document: MXLDocument) -> (MXLDocument, [Change]) {
        guard !document.isNormalized
        else { return (document, []) }

        return Editor(document: document).edit()
    }
}

// MARK: - Sendable

extension MXLNormalizer: Sendable {
}
