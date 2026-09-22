// © 2026 John Gary Pusey (see LICENSE.md)

/// The print-style-align attribute group adds the halign and valign attributes to the position, font, and color
/// attributes.
public struct MXLPrintStyleAlign {

    // MARK: Public Initializers

    /// Creates a new `MXLPrintStyleAlign`.
    ///
    /// - Parameter printStyle: The print-style attribute group collects the most popular combination of printing attributes: position, font, and color.
    /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
    /// - Parameter valign: The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. Defaults are implementation-dependent.
    public init(printStyle: MXLPrintStyle,
                halign: MXLLeftCenterRight? = nil,
                valign: MXLValign? = nil) {
        self.halign = halign
        self.printStyle = printStyle
        self.valign = valign
    }

    // MARK: Public Instance Properties

    /// In cases where text extends over more than one line, horizontal alignment and justify values can be different.
    /// The most typical case is for credits, such as:
    ///
    /// Words and music by Pat Songwriter
    ///
    /// Typically this type of credit is aligned to the right, so that the position information refers to the right-
    /// most part of the text. But in this example, the text is center-justified, not right-justified.
    ///
    /// The halign attribute is used in these situations. If it is not present, its value is the same as for the
    /// justify attribute. For elements where a justify attribute is not allowed, the default is implementation-
    /// dependent.
    ///
    /// Maps to the MusicXML `halign` attribute.
    public let halign: MXLLeftCenterRight?

    /// The print-style attribute group collects the most popular combination of printing attributes: position, font,
    /// and color.
    public let printStyle: MXLPrintStyle

    /// The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the
    /// text. Defaults are implementation-dependent.
    ///
    /// Maps to the MusicXML `valign` attribute.
    public let valign: MXLValign?
}

// MARK: - Equatable

extension MXLPrintStyleAlign: Equatable {
}

// MARK: - Hashable

extension MXLPrintStyleAlign: Hashable {
}

// MARK: - Sendable

extension MXLPrintStyleAlign: Sendable {
}
