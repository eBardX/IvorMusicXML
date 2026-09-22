// © 2026 John Gary Pusey (see LICENSE.md)

/// The empty-print-style-align-id type represents an empty element with print-style-align and optional-unique-id
/// attribute groups.
///
/// Maps the MusicXML `<damp>`, `<damp-all>`, and `<eyeglasses>` elements.
public struct MXLEmptyPrintStyleAlignID {

    // MARK: Public Initializers

    /// Creates a new `MXLEmptyPrintStyleAlignID`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter printStyleAlign: The print-style-align attribute group adds the halign and valign attributes to the position, font, and color attributes.
    public init(id: String? = nil,
                printStyleAlign: MXLPrintStyleAlign) {
        self.id = id
        self.printStyleAlign = printStyleAlign
    }

    // MARK: Public Instance Properties

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The print-style-align attribute group adds the halign and valign attributes to the position, font, and color
    /// attributes.
    public let printStyleAlign: MXLPrintStyleAlign
}

// MARK: - Equatable

extension MXLEmptyPrintStyleAlignID: Equatable {
}

// MARK: - Hashable

extension MXLEmptyPrintStyleAlignID: Hashable {
}

// MARK: - Sendable

extension MXLEmptyPrintStyleAlignID: Sendable {
}
