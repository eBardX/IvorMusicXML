// © 2026 John Gary Pusey (see LICENSE.md)

/// The other-placement-text type represents a text element with print-style, placement, and smufl attribute
/// groups. This type is used by MusicXML notation extension elements to allow specification of specific SMuFL
/// glyphs without needed to add every glyph as a MusicXML element.
///
/// Maps the MusicXML `<other-articulation>`, `<other-ornament>`, and `<other-technical>` elements.
public struct MXLOtherPlacementText {

    // MARK: Public Initializers

    /// Creates a new `MXLOtherPlacementText`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter printStyle: The print-style attribute group collects the most popular combination of printing attributes: position, font, and color.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    /// - Parameter smufl: The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character. Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an element.
    public init(value: String,
                printStyle: MXLPrintStyle,
                placement: MXLAboveBelow? = nil,
                smufl: MXLSmuflGlyphName? = nil) {
        self.placement = placement
        self.printStyle = printStyle
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The placement attribute indicates whether something is above or below another element, such as a note or a
    /// notation.
    ///
    /// Maps to the MusicXML `placement` attribute.
    public let placement: MXLAboveBelow?

    /// The print-style attribute group collects the most popular combination of printing attributes: position, font,
    /// and color.
    public let printStyle: MXLPrintStyle

    /// The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character.
    /// Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an
    /// element.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflGlyphName?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLOtherPlacementText: Equatable {
}

// MARK: - Hashable

extension MXLOtherPlacementText: Hashable {
}

// MARK: - Sendable

extension MXLOtherPlacementText: Sendable {
}
