// © 2026 John Gary Pusey (see LICENSE.md)

/// The for-part type is used in a concert score to indicate the transposition for a transposed part created from
/// that score. It is only used in score files that contain a concert-score element in the defaults. This allows
/// concert scores with transposed parts to be represented in a single uncompressed MusicXML file.
///
/// The optional number attribute refers to staff numbers, from top to bottom on the system. If absent, the child
/// elements apply to all staves in the created part.
///
/// Maps the MusicXML `<for-part>` element.
public struct MXLForPart {

    // MARK: Public Initializers

    /// Creates a new `MXLForPart`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter clef: The part-clef element is used for transpositions that also include a change of clef, as for instruments such as bass clarinet.
    /// - Parameter transpose: The chromatic element in a part-transpose element will usually have a non-zero value, since octave transpositions can be represented in concert scores using the transpose element.
    /// - Parameter number:  The staff number, from top to bottom on the system, that this element applies to. If absent, the child elements apply to all staves in the created part.
    public init(id: String? = nil,
                clef: MXLClef.Content? = nil,
                transpose: MXLTranspose.Content,
                number: MXLStaffNumber? = nil) {
        self.clef = clef
        self.id = id
        self.number = number
        self.transpose = transpose
    }

    // MARK: Public Instance Properties

    /// The part-clef element is used for transpositions that also include a change of clef, as for instruments such
    /// as bass clarinet.
    ///
    /// Maps to a nested MusicXML `<part-clef>` element.
    public let clef: MXLClef.Content?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The staff number, from top to bottom on the system, that this element applies to. If absent, the child
    /// elements apply to all staves in the created part.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLStaffNumber?

    /// The chromatic element in a part-transpose element will usually have a non-zero value, since octave
    /// transpositions can be represented in concert scores using the transpose element.
    ///
    /// Maps to a nested MusicXML `<part-transpose>` element.
    public let transpose: MXLTranspose.Content
}

// MARK: - Equatable

extension MXLForPart: Equatable {
}

// MARK: - Hashable

extension MXLForPart: Hashable {
}

// MARK: - Sendable

extension MXLForPart: Sendable {
}
