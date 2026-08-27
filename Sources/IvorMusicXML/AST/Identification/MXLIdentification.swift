// © 2026 John Gary Pusey (see LICENSE.md)

/// Identification contains basic metadata about the score. It includes information that may apply at a score-
/// wide, movement-wide, or part-wide level. The creator, rights, source, and relation elements are based on
/// Dublin Core.
///
/// Maps the MusicXML `<identification>` element.
public struct MXLIdentification {

    // MARK: Public Initializers

    /// Creates a new `MXLIdentification`.
    ///
    /// - Parameter creator: The creator element is borrowed from Dublin Core. It is used for the creators of the score. The type attribute is used to distinguish different creative contributions. Thus, there can be multiple creators within an identification. Standard type values are composer, lyricist, and arranger. Other type values may be used for different types of creative roles. The type attribute should usually be used even if there is just a single creator element. The MusicXML format does not use the creator / contributor distinction from Dublin Core.
    /// - Parameter rights: The rights element is borrowed from Dublin Core. It contains copyright and other intellectual property notices. Words, music, and derivatives can have different types, so multiple rights elements with different type attributes are supported. Standard type values are music, words, and arrangement, but other types may be used. The type attribute is only needed when there are multiple rights elements.
    /// - Parameter encoding: Information about who did the digital encoding, when, with what software, and in what aspects.
    /// - Parameter source: The source for the music that is encoded. This is similar to the Dublin Core source element.
    /// - Parameter relation: A related resource for the music that is encoded. This is similar to the Dublin Core relation element. Standard type values are music, words, and arrangement, but other types may be used.
    /// - Parameter miscellaneous: Other metadata not yet supported elsewhere in the MusicXML format.
    public init(creator: [MXLTypedText] = [],
                rights: [MXLTypedText] = [],
                encoding: MXLEncoding? = nil,
                source: String? = nil,
                relation: [MXLTypedText] = [],
                miscellaneous: MXLMiscellaneous? = nil) {
        self.creator = creator
        self.encoding = encoding
        self.miscellaneous = miscellaneous
        self.relation = relation
        self.rights = rights
        self.source = source
    }

    // MARK: Public Instance Properties

    /// The creator element is borrowed from Dublin Core. It is used for the creators of the score. The type attribute
    /// is used to distinguish different creative contributions. Thus, there can be multiple creators within an
    /// identification. Standard type values are composer, lyricist, and arranger. Other type values may be used for
    /// different types of creative roles. The type attribute should usually be used even if there is just a single
    /// creator element. The MusicXML format does not use the creator / contributor distinction from Dublin Core.
    ///
    /// Maps to nested MusicXML `<creator>` elements.
    public let creator: [MXLTypedText]

    /// Information about who did the digital encoding, when, with what software, and in what aspects.
    ///
    /// Maps to a nested MusicXML `<encoding>` element.
    public let encoding: MXLEncoding?

    /// Other metadata not yet supported elsewhere in the MusicXML format.
    ///
    /// Maps to a nested MusicXML `<miscellaneous>` element.
    public let miscellaneous: MXLMiscellaneous?

    /// A related resource for the music that is encoded. This is similar to the Dublin Core relation element.
    /// Standard type values are music, words, and arrangement, but other types may be used.
    ///
    /// Maps to nested MusicXML `<relation>` elements.
    public let relation: [MXLTypedText]

    /// The rights element is borrowed from Dublin Core. It contains copyright and other intellectual property
    /// notices. Words, music, and derivatives can have different types, so multiple rights elements with different
    /// type attributes are supported. Standard type values are music, words, and arrangement, but other types may be
    /// used. The type attribute is only needed when there are multiple rights elements.
    ///
    /// Maps to nested MusicXML `<rights>` elements.
    public let rights: [MXLTypedText]

    /// The source for the music that is encoded. This is similar to the Dublin Core source element.
    ///
    /// Maps to a nested MusicXML `<source>` element.
    public let source: String?
}

// MARK: - Equatable

extension MXLIdentification: Equatable {
}

// MARK: - Hashable

extension MXLIdentification: Hashable {
}

// MARK: - Sendable

extension MXLIdentification: Sendable {
}
