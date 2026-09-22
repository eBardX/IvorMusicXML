// © 2026 John Gary Pusey (see LICENSE.md)

/// The opus type is used for the root element of a MusicXML opus. Each opus is made up of a series of score,
/// opus-link, and/or nested opus elements. The document-attributes attribute group includes the version
/// attribute. Future versions may include more metadata elements. In this version, we just include the title of
/// the opus.
///
/// Maps the MusicXML `<opus>` root element.
public struct MXLOpus {

    // MARK: Public Initializers

    /// Creates a new `MXLOpus`.
    ///
    /// - Parameter version:  The document-attributes version this opus conforms to. Defaults to `1.0` if not specified.
    /// - Parameter title:    The title element specifies the title of an opus document. It is optional in every version of the specification.
    /// - Parameter items:    One of the alternatives for Opus.
    public init(version: MXLDocument.Version? = nil,
                title: String? = nil,
                items: [Item] = []) {
        self.items = items
        self.title = title
        self.version = version ?? .v1_0
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for Opus.
    public let items: [Item]

    /// The title element specifies the title of an opus document.
    ///
    /// Optional in every version of the specification: `minOccurs="0"` from
    /// MusicXML 2.0 onward, and `title?` in the 1.0 and 1.1 DTDs.
    ///
    /// Maps to a nested MusicXML `<title>` element.
    public let title: String?

    /// The document-attributes attribute group is used to specify the attributes for an entire MusicXML document.
    /// Currently this is used for the version attribute.
    ///
    /// The version attribute was added in Version 1.1 for the score-partwise and score-timewise documents. It
    /// provides an easier way to get version information than through the MusicXML public ID. The default value is
    /// 1.0 to make it possible for programs that handle later versions to distinguish earlier version files reliably.
    /// Programs that write MusicXML 1.1 or later files should set this attribute.
    ///
    /// Maps to the MusicXML `version` attribute.
    public let version: MXLDocument.Version
}

// MARK: - Equatable

extension MXLOpus: Equatable {
}

// MARK: - Hashable

extension MXLOpus: Hashable {
}

// MARK: - Sendable

extension MXLOpus: Sendable {
}
