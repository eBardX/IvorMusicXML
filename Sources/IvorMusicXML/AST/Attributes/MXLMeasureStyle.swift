// © 2026 John Gary Pusey (see LICENSE.md)

/// A measure-style indicates a special way to print partial to multiple measures within a part. This includes
/// multiple rests over several measures, repeats of beats, single, or multiple measures, and use of slash
/// notation.
///
/// The multiple-rest and measure-repeat elements indicate the number of measures covered in the element content.
/// The beat-repeat and slash elements can cover partial measures. All but the multiple-rest element use a type
/// attribute to indicate starting and stopping the use of the style. The optional number attribute specifies the
/// staff number from top to bottom on the system, as with clef.
///
/// Maps the MusicXML `<measure-style>` element.
public struct MXLMeasureStyle {

    // MARK: Public Initializers

    /// Creates a new `MXLMeasureStyle`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter content: One of the alternatives for MeasureStyle.
    /// - Parameter number: The staff number, from top to bottom on the system, that this element applies to.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(id: String? = nil,
                content: Content,
                number: MXLStaffNumber? = nil,
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil) {
        self.color = color
        self.content = content
        self.font = font
        self.id = id
        self.number = number
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// One of the alternatives for MeasureStyle.
    public let content: Content

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The staff number, from top to bottom on the system, that this element applies to.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLStaffNumber?
}

// MARK: - Equatable

extension MXLMeasureStyle: Equatable {
}

// MARK: - Hashable

extension MXLMeasureStyle: Hashable {
}

// MARK: - Sendable

extension MXLMeasureStyle: Sendable {
}
