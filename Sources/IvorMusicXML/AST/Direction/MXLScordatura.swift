// © 2026 John Gary Pusey (see LICENSE.md)

/// Scordatura string tunings are represented by a series of accord elements, similar to the staff-tuning
/// elements. Strings are numbered from high to low.
///
/// Maps the MusicXML `<scordatura>` element.
public struct MXLScordatura {

    // MARK: Public Initializers

    /// Creates a new `MXLScordatura`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter accord: The string tunings for the scordatura, ordered from high to low.
    public init(id: String? = nil,
                accord: [MXLAccord] = []) {
        self.accord = accord
        self.id = id
    }

    // MARK: Public Instance Properties

    /// The string tunings for the scordatura, ordered from high to low.
    ///
    /// Maps to nested MusicXML `<accord>` elements.
    public let accord: [MXLAccord]

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?
}

// MARK: - Equatable

extension MXLScordatura: Equatable {
}

// MARK: - Hashable

extension MXLScordatura: Hashable {
}

// MARK: - Sendable

extension MXLScordatura: Sendable {
}
