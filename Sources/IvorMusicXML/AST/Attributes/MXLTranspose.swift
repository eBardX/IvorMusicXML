// © 2026 John Gary Pusey (see LICENSE.md)

/// The transpose type represents what must be added to a written pitch to get a correct sounding pitch. The
/// optional number attribute refers to staff numbers, from top to bottom on the system. If absent, the
/// transposition applies to all staves in the part. Per-staff transposition is most often used in parts that
/// represent multiple instruments.
///
/// Maps the MusicXML `<transpose>` element.
public struct MXLTranspose {

    // MARK: Public Initializers

    /// Creates a new `MXLTranspose`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter content: The transpose group represents what must be added to a written pitch to get a correct sounding pitch.
    /// - Parameter number: The staff number, from top to bottom on the system, that this element applies to. If absent, the transposition applies to all staves in the part.
    public init(id: String? = nil,
                content: Content,
                number: MXLStaffNumber? = nil) {
        self.content = content
        self.id = id
        self.number = number
    }

    // MARK: Public Instance Properties

    /// The transpose group represents what must be added to a written pitch to get a correct sounding pitch.
    public let content: Content

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The staff number, from top to bottom on the system, that this element applies to. If absent, the
    /// transposition applies to all staves in the part.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLStaffNumber?
}

// MARK: - Equatable

extension MXLTranspose: Equatable {
}

// MARK: - Hashable

extension MXLTranspose: Hashable {
}

// MARK: - Sendable

extension MXLTranspose: Sendable {
}
