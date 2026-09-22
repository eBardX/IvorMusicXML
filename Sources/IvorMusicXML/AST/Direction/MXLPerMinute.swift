// © 2026 John Gary Pusey (see LICENSE.md)

/// The per-minute type can be a number, or a text description including numbers. If a font is specified, it
/// overrides the font specified for the overall metronome element. This allows separate specification of a music
/// font for the beat-unit and a text font for the numeric value, in cases where a single metronome font is not
/// used.
///
/// Maps the MusicXML `<per-minute>` element.
public struct MXLPerMinute {

    // MARK: Public Initializers

    /// Creates a new `MXLPerMinute`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    public init(value: String,
                font: MXLFont = MXLFont()) {
        self.font = font
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLPerMinute: Equatable {
}

// MARK: - Hashable

extension MXLPerMinute: Hashable {
}

// MARK: - Sendable

extension MXLPerMinute: Sendable {
}
