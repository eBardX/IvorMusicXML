// © 2026 John Gary Pusey (see LICENSE.md)

/// The empty-line type represents an empty element with line-shape, line-type, line-length, dashed-formatting,
/// print-style and placement attributes.
///
/// Maps the MusicXML `<doit>`, `<falloff>`, `<plop>`, and `<scoop>` elements.
public struct MXLEmptyLine {

    // MARK: Public Initializers

    /// Creates a new `MXLEmptyLine`.
    ///
    /// - Parameter shape: The line-shape attribute distinguishes between straight and curved lines.
    /// - Parameter kind: The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    /// - Parameter length: The line-length attribute distinguishes between different line lengths for doit, falloff, plop, and scoop articulations.
    /// - Parameter dashedFormatting: The dashed-formatting entity represents the length of dashes and spaces in a dashed line. Both the dash-length and space-length attributes are represented in tenths. These attributes are ignored if the corresponding line-type attribute is not dashed.
    /// - Parameter printStyle: The print-style attribute group collects the most popular combination of printing attributes: position, font, and color.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    public init(shape: MXLLineShape? = nil,
                kind: MXLLineKind? = nil,
                length: MXLLineLength? = nil,
                dashedFormatting: MXLDashedFormatting = MXLDashedFormatting(),
                printStyle: MXLPrintStyle,
                placement: MXLAboveBelow? = nil) {
        self.dashedFormatting = dashedFormatting
        self.kind = kind
        self.length = length
        self.placement = placement
        self.printStyle = printStyle
        self.shape = shape
    }

    // MARK: Public Instance Properties

    /// The dashed-formatting entity represents the length of dashes and spaces in a dashed line. Both the dash-length
    /// and space-length attributes are represented in tenths. These attributes are ignored if the corresponding line-
    /// type attribute is not dashed.
    public let dashedFormatting: MXLDashedFormatting

    /// The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    ///
    /// Maps to the MusicXML `line-type` attribute.
    public let kind: MXLLineKind?

    /// The line-length attribute distinguishes between different line lengths for doit, falloff, plop, and scoop
    /// articulations.
    ///
    /// Maps to the MusicXML `line-length` attribute.
    public let length: MXLLineLength?

    /// The placement attribute indicates whether something is above or below another element, such as a note or a
    /// notation.
    ///
    /// Maps to the MusicXML `placement` attribute.
    public let placement: MXLAboveBelow?

    /// The print-style attribute group collects the most popular combination of printing attributes: position, font,
    /// and color.
    public let printStyle: MXLPrintStyle

    /// The line-shape attribute distinguishes between straight and curved lines.
    ///
    /// Maps to the MusicXML `line-shape` attribute.
    public let shape: MXLLineShape?
}

// MARK: - Equatable

extension MXLEmptyLine: Equatable {
}

// MARK: - Hashable

extension MXLEmptyLine: Hashable {
}

// MARK: - Sendable

extension MXLEmptyLine: Sendable {
}
