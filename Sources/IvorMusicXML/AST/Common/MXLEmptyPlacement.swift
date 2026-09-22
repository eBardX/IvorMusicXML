// © 2026 John Gary Pusey (see LICENSE.md)

/// The empty-placement type represents an empty element with print-style and placement attributes.
///
/// Maps the MusicXML `<dot>` element.
public struct MXLEmptyPlacement {

    // MARK: Public Initializers

    /// Creates a new `MXLEmptyPlacement`.
    ///
    /// - Parameter printStyle: The print-style attribute group collects the most popular combination of printing attributes: position, font, and color.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    public init(printStyle: MXLPrintStyle,
                placement: MXLAboveBelow? = nil) {
        self.placement = placement
        self.printStyle = printStyle
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
}

// MARK: - Equatable

extension MXLEmptyPlacement: Equatable {
}

// MARK: - Hashable

extension MXLEmptyPlacement: Hashable {
}

// MARK: - Sendable

extension MXLEmptyPlacement: Sendable {
}
