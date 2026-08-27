// © 2026 John Gary Pusey (see LICENSE.md)

/// The other-text type represents a text element with a smufl attribute group. This type is used by MusicXML
/// direction extension elements to allow specification of specific SMuFL glyphs without needed to add every glyph
/// as a MusicXML element.
///
/// Maps the MusicXML `<other-dynamics>` and `<other-percussion>` elements.
public struct MXLOtherText {

    // MARK: Public Initializers

    /// Creates a new `MXLOtherText`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl: The smufl attribute group is used to indicate a particular Standard Music Font Layout (SMuFL) character. Sometimes this is a formatting choice, and sometimes this is a refinement of the semantic meaning of an element.
    public init(value: String,
                smufl: MXLSmuflGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

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

extension MXLOtherText: Equatable {
}

// MARK: - Hashable

extension MXLOtherText: Hashable {
}

// MARK: - Sendable

extension MXLOtherText: Sendable {
}
