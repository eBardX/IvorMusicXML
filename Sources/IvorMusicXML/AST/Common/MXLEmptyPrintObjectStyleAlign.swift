// © 2026 John Gary Pusey (see LICENSE.md)

/// The empty-print-style-align-object type represents an empty element with print-object and print-style-align
/// attribute groups.
///
/// Maps the MusicXML `<left-divider>` and `<right-divider>` elements.
public struct MXLEmptyPrintObjectStyleAlign {

    // MARK: Public Initializers

    /// Creates a new `MXLEmptyPrintObjectStyleAlign`.
    ///
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter printStyleAlign: The print-style-align attribute group adds the halign and valign attributes to the position, font, and color attributes.
    public init(printsObject: Bool? = nil,
                printStyleAlign: MXLPrintStyleAlign) {
        self.printStyleAlign = printStyleAlign
        self.printsObject = printsObject
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?

    /// The print-style-align attribute group adds the halign and valign attributes to the position, font, and color
    /// attributes.
    public let printStyleAlign: MXLPrintStyleAlign
}

// MARK: - Equatable

extension MXLEmptyPrintObjectStyleAlign: Equatable {
}

// MARK: - Hashable

extension MXLEmptyPrintObjectStyleAlign: Hashable {
}

// MARK: - Sendable

extension MXLEmptyPrintObjectStyleAlign: Sendable {
}
