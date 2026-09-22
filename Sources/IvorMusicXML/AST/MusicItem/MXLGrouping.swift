// © 2026 John Gary Pusey (see LICENSE.md)

/// The grouping type is used for musical analysis. When the type attribute is “start” or “single”, it usually
/// contains one or more feature elements. The number attribute is used for distinguishing between overlapping and
/// hierarchical groupings. The member-of attribute allows for easy distinguishing of what grouping elements are
/// in what hierarchy. Feature elements contained within a “stop” type of grouping may be ignored.
///
/// This element is flexible to allow for different types of analyses. Future versions of the MusicXML format may
/// add elements that can represent more standardized categories of analysis data, allowing for easier data
/// sharing.
///
/// Maps the MusicXML `<grouping>` element.
public struct MXLGrouping {

    // MARK: Public Initializers

    /// Creates a new `MXLGrouping`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter feature:  The feature elements contained within this grouping.
    /// - Parameter kind:  Whether this grouping is a start, stop, or single (self-contained) grouping.
    /// - Parameter number: Defaults to `1`.
    /// - Parameter memberOf:  Distinguishes what hierarchy this grouping element belongs to.
    public init(id: String? = nil,
                feature: [MXLFeature] = [],
                kind: MXLStartStopSingle,
                number: String? = nil,
                memberOf: String? = nil) {
        self.feature = feature
        self.id = id
        self.memberOf = memberOf
        self.number = number ?? "1"
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The feature elements contained within this grouping.
    ///
    /// Maps to nested MusicXML `<feature>` elements.
    public let feature: [MXLFeature]

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Whether this grouping is a start, stop, or single (self-contained) grouping.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStopSingle

    /// Distinguishes what hierarchy this grouping element belongs to.
    ///
    /// Maps to the MusicXML `member-of` attribute.
    public let memberOf: String?

    /// Defaults to `1`.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: String
}

// MARK: - Equatable

extension MXLGrouping: Equatable {
}

// MARK: - Hashable

extension MXLGrouping: Hashable {
}

// MARK: - Sendable

extension MXLGrouping: Sendable {
}
