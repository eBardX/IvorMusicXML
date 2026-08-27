// © 2026 John Gary Pusey (see LICENSE.md)

/// The font attribute group gathers together attributes for determining the font within a credit or direction.
/// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
/// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
/// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
/// vs. a music font.
public struct MXLFont {

    // MARK: Public Initializers

    /// Creates a new `MXLFont`.
    ///
    /// - Parameter family:  A comma-separated list of font names.
    /// - Parameter style:   The font style, either normal or italic.
    /// - Parameter size:    The font size, either one of the CSS sizes or a numeric point size.
    /// - Parameter weight:  The font weight, either normal or bold.
    public init(family: Family? = nil,
                style: Style? = nil,
                size: Size? = nil,
                weight: Weight? = nil) {
        self.family = family
        self.size = size
        self.style = style
        self.weight = weight
    }

    // MARK: Public Instance Properties

    /// A comma-separated list of font names.
    ///
    /// Maps to the MusicXML `font-family` attribute.
    public let family: Family?

    /// The font size, either one of the CSS sizes or a numeric point size.
    ///
    /// Maps to the MusicXML `font-size` attribute.
    public let size: Size?

    /// The font style, either normal or italic.
    ///
    /// Maps to the MusicXML `font-style` attribute.
    public let style: Style?

    /// The font weight, either normal or bold.
    ///
    /// Maps to the MusicXML `font-weight` attribute.
    public let weight: Weight?
}

// MARK: - Equatable

extension MXLFont: Equatable {
}

// MARK: - Hashable

extension MXLFont: Hashable {
}

// MARK: - Sendable

extension MXLFont: Sendable {
}
