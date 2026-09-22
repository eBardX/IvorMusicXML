// © 2026 John Gary Pusey (see LICENSE.md)

/// Notations refer to musical notations, not XML notations. Multiple notations are allowed in order to represent
/// multiple editorial levels. The print-object attribute, added in Version 3.0, allows notations to represent
/// details of performance technique, such as fingerings, without having them appear in the score.
///
/// Maps the MusicXML `<notations>` element.
public struct MXLNotations {

    // MARK: Public Initializers

    /// Creates a new `MXLNotations`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter items: One of the alternatives for Notations.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    public init(id: String? = nil,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                items: [Item] = [],
                printsObject: Bool? = nil) {
        self.footnote = footnote
        self.id = id
        self.items = items
        self.level = level
        self.printsObject = printsObject
    }

    // MARK: Public Instance Properties

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// One of the alternatives for Notations.
    public let items: [Item]

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?
}

// MARK: - Equatable

extension MXLNotations: Equatable {
}

// MARK: - Hashable

extension MXLNotations: Hashable {
}

// MARK: - Sendable

extension MXLNotations: Sendable {
}
