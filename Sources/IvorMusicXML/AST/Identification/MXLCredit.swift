// © 2026 John Gary Pusey (see LICENSE.md)

/// The credit type represents the appearance of the title, composer, arranger, lyricist, copyright, dedication,
/// and other text, symbols, and graphics that commonly appear on the first page of a score. The credit-words,
/// credit-symbol, and credit-image elements are similar to the words, symbol, and image elements for directions.
/// However, since the credit is not part of a measure, the default-x and default-y attributes adjust the origin
/// relative to the bottom left-hand corner of the page. The enclosure for credit-words and credit-symbol is none
/// by default.
///
/// By default, a series of credit-words and credit-symbol elements within a single credit element follow one
/// another in sequence visually. Non-positional formatting attributes are carried over from the previous element
/// by default.
///
/// The page attribute for the credit element specifies the page number where the credit should appear. This is an
/// integer value that starts with 1 for the first page. Its value is 1 by default. Since credits occur before the
/// music, these page numbers do not refer to the page numbering specified by the print element’s page-number
/// attribute.
///
/// The credit-type element indicates the purpose behind a credit. Multiple types of data may be combined in a
/// single credit, so multiple elements may be used. Standard values include page number, title, subtitle,
/// composer, arranger, lyricist, rights, and part name.
///
/// Maps the MusicXML `<credit>` element.
public struct MXLCredit {

    // MARK: Public Initializers

    /// Creates a new `MXLCredit`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind:  Indicates the purpose behind this credit, such as page number, title, subtitle, composer, arranger, lyricist, rights, or part name. Multiple values may be used if multiple purposes are combined in a single credit.
    /// - Parameter link:  The link elements interspersed with this credit’s content.
    /// - Parameter bookmark:  The bookmark elements interspersed with this credit’s content.
    /// - Parameter content: One of the alternatives for Credit.
    /// - Parameter page:  The page number where the credit should appear, starting with 1 for the first page. `1` by default.
    public init(id: String? = nil,
                kind: [String] = [],
                link: [MXLLink] = [],
                bookmark: [MXLBookmark] = [],
                content: Content,
                page: Int? = nil) {
        self.bookmark = bookmark
        self.content = content
        self.id = id
        self.kind = kind
        self.link = link
        self.page = page
    }

    // MARK: Public Instance Properties

    /// The bookmark elements interspersed with this credit’s content.
    ///
    /// Maps to nested MusicXML `<bookmark>` elements.
    public let bookmark: [MXLBookmark]

    /// One of the alternatives for Credit.
    public let content: Content

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Indicates the purpose behind this credit, such as page number, title, subtitle, composer, arranger, lyricist,
    /// rights, or part name. Multiple values may be used if multiple purposes are combined in a single credit.
    ///
    /// Maps to nested MusicXML `<credit-type>` elements.
    public let kind: [String]

    /// The link elements interspersed with this credit’s content.
    ///
    /// Maps to nested MusicXML `<link>` elements.
    public let link: [MXLLink]

    /// The page number where the credit should appear, starting with 1 for the first page. `1` by default.
    ///
    /// Maps to the MusicXML `page` attribute.
    public let page: Int?
}

// MARK: - Equatable

extension MXLCredit: Equatable {
}

// MARK: - Hashable

extension MXLCredit: Hashable {
}

// MARK: - Sendable

extension MXLCredit: Sendable {
}
