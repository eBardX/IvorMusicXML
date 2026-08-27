// © 2026 John Gary Pusey (see LICENSE.md)

/// The name-display type is used for exact formatting of multi-font text in part and group names to the left of
/// the system. The print-object attribute can be used to determine what, if anything, is printed at the start of
/// each system. Enclosure for the display-text element is none by default. Language for the display-text element
/// is Italian (“it”) by default.
///
/// Maps the MusicXML `<group-abbreviation-display>`, `<group-name-display>`, `<part-abbreviation-display>`, and
/// `<part-name-display>` elements.
public struct MXLNameDisplay {

    // MARK: Public Initializers

    /// Creates a new `MXLNameDisplay`.
    ///
    /// - Parameter items: One of the alternatives for NameDisplay.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    public init(items: [Item] = [],
                printsObject: Bool? = nil) {
        self.items = items
        self.printsObject = printsObject
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for NameDisplay.
    public let items: [Item]

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?
}

// MARK: - Equatable

extension MXLNameDisplay: Equatable {
}

// MARK: - Hashable

extension MXLNameDisplay: Hashable {
}

// MARK: - Sendable

extension MXLNameDisplay: Sendable {
}
