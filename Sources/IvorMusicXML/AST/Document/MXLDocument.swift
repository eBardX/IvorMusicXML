// © 2026 John Gary Pusey (see LICENSE.md)

/// A top-level document parsed from a MusicXML file.
///
/// A document pairs its ``content`` with the pipeline metadata recording how
/// far that content has advanced through `parse → normalize → validate`. The
/// stages both consume and set these flags: the normalizer declines to
/// normalize a document twice, and the stages after it decline to run on
/// content that has not reached them yet.
public struct MXLDocument {

    // MARK: Public Initializers

    /// Creates a new document with the provided content.
    ///
    /// The document is neither normalized nor validated; both
    /// ``isNormalized`` and ``isValidated`` are `false`.
    ///
    /// - Parameter content: The content of the document.
    public init(content: Content) {
        self.init(content: content,
                  isNormalized: false,
                  isValidated: false)
    }

    // MARK: Public Instance Properties

    /// The content of this document.
    public let content: Content

    /// A Boolean value indicating whether this document has been normalized to
    /// the most recent supported MusicXML version by
    /// ``MXLNormalizer/normalize(_:)``.
    ///
    /// `false` for documents created by ``init(content:)`` or returned by the
    /// parser, until the normalizer is called; `true` for every document the
    /// normalizer returns.
    public let isNormalized: Bool

    /// A Boolean value indicating whether this document has been validated by
    /// ``MXLValidator/validate(_:)``.
    ///
    /// `false` until a successful validation returns a copy with this flag set
    /// to `true`.
    public let isValidated: Bool

    // MARK: Internal Initializers

    internal init(content: Content,
                  isNormalized: Bool,
                  isValidated: Bool) {
        self.content = content
        self.isNormalized = isNormalized
        self.isValidated = isValidated
    }
}

// MARK: - Equatable

extension MXLDocument: Equatable {

    // MARK: Public Type Methods

    /// Two documents are equal when their ``content`` matches;
    /// ``isNormalized`` and ``isValidated`` are intentionally excluded because
    /// they are metadata, not content.
    ///
    /// - Parameter lhs: The first document to compare.
    /// - Parameter rhs: The second document to compare.
    ///
    /// - Returns:  Whether the two documents have equal content.
    public static func == (lhs: Self,
                           rhs: Self) -> Bool {
        lhs.content == rhs.content
    }
}

// MARK: - Hashable

extension MXLDocument: Hashable {

    // MARK: Public Instance Methods

    /// Feeds only ``content`` into the provided hasher, matching the property
    /// compared by `==`; ``isNormalized`` and ``isValidated`` are intentionally
    /// excluded because they are metadata, not content.
    ///
    /// - Parameter hasher: The hasher to use.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(content)
    }
}

// MARK: - Sendable

extension MXLDocument: Sendable {
}
