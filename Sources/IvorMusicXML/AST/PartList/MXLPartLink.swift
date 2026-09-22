// © 2026 John Gary Pusey (see LICENSE.md)

/// The part-link type allows MusicXML data for both score and parts to be contained within a single compressed
/// MusicXML file. It links a score-part from a score document to MusicXML documents that contain parts data. In
/// the case of a single compressed MusicXML file, the link href values are paths that are relative to the root
/// folder of the zip file.
///
/// Maps the MusicXML `<part-link>` element.
public struct MXLPartLink {

    // MARK: Public Initializers

    /// Creates a new `MXLPartLink`.
    ///
    /// - Parameter instrumentLink: Identifies the instruments used in the linked document.
    /// - Parameter groupLink: Multiple part-link elements can reference different types of linked documents, such as parts and condensed score. The optional group-link elements identify the groups used in the linked document. The content of a group-link element should match the content of a group element in the linked document.
    /// - Parameter xlink: The link-attributes group includes all the simple XLink attributes supported in the MusicXML format. It is also used to connect a MusicXML score with MusicXML parts or a MusicXML opus.
    public init(instrumentLink: [MXLInstrumentLink] = [],
                groupLink: [String] = [],
                xlink: MXLXLink) {
        self.groupLink = groupLink
        self.instrumentLink = instrumentLink
        self.xlink = xlink
    }

    // MARK: Public Instance Properties

    /// Multiple part-link elements can reference different types of linked documents, such as parts and condensed
    /// score. The optional group-link elements identify the groups used in the linked document. The content of a
    /// group-link element should match the content of a group element in the linked document.
    ///
    /// Maps to nested MusicXML `<group-link>` elements.
    public let groupLink: [String]

    /// Identifies the instruments used in the linked document.
    ///
    /// Maps to nested MusicXML `<instrument-link>` elements.
    public let instrumentLink: [MXLInstrumentLink]

    /// The link-attributes group includes all the simple XLink attributes supported in the MusicXML format. It is
    /// also used to connect a MusicXML score with MusicXML parts or a MusicXML opus.
    public let xlink: MXLXLink
}

// MARK: - Equatable

extension MXLPartLink: Equatable {
}

// MARK: - Hashable

extension MXLPartLink: Hashable {
}

// MARK: - Sendable

extension MXLPartLink: Sendable {
}
