// © 2026 John Gary Pusey (see LICENSE.md)

/// The placement-text type represents a text element with print-style and placement attribute groups.
///
/// Maps the MusicXML `<pluck>` and `<with-bar>` elements.
public struct MXLPlacementText {

    // MARK: Public Initializers

    /// Creates a new `MXLPlacementText`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter printStyle: The print-style attribute group collects the most popular combination of printing attributes: position, font, and color.
    /// - Parameter placement: The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    public init(value: String,
                printStyle: MXLPrintStyle,
                placement: MXLAboveBelow? = nil) {
        self.placement = placement
        self.printStyle = printStyle
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

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLPlacementText: Equatable {
}

// MARK: - Hashable

extension MXLPlacementText: Hashable {
}

// MARK: - Sendable

extension MXLPlacementText: Sendable {
}
