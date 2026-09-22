// © 2026 John Gary Pusey (see LICENSE.md)

/// The style-text type represents a text element with a print-style attribute group.
///
/// Maps the MusicXML `<bass-separator>`, `<figure-number>`, `<function>`, `<prefix>`, and `<suffix>` elements.
public struct MXLStyleText {

    // MARK: Public Initializers

    /// Creates a new `MXLStyleText`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter printStyle: The print-style attribute group collects the most popular combination of printing attributes: position, font, and color.
    public init(value: String,
                printStyle: MXLPrintStyle) {
        self.printStyle = printStyle
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The print-style attribute group collects the most popular combination of printing attributes: position, font,
    /// and color.
    public let printStyle: MXLPrintStyle

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLStyleText: Equatable {
}

// MARK: - Hashable

extension MXLStyleText: Hashable {
}

// MARK: - Sendable

extension MXLStyleText: Sendable {
}
