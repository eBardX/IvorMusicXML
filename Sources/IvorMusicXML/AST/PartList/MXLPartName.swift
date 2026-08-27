// © 2026 John Gary Pusey (see LICENSE.md)

/// The part-name type describes the name or abbreviation of a score-part element. Formatting attributes for the
/// part-name element are deprecated in Version 2.0 in favor of the new part-name-display and part-abbreviation-
/// display elements.
///
/// Maps the MusicXML `<part-abbreviation>` and `<part-name>` elements.
public struct MXLPartName {

    // MARK: Public Initializers

    /// Creates a new `MXLPartName`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter text: The part-name-text attribute group is used by the part-name and part-abbreviation elements. The print-style and justify attribute groups are deprecated in MusicXML 2.0 in favor of the new part-name-display and part-abbreviation-display elements.
    public init(value: String,
                text: Text) {
        self.text = text
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The part-name-text attribute group is used by the part-name and part-abbreviation elements. The print-style
    /// and justify attribute groups are deprecated in MusicXML 2.0 in favor of the new part-name-display and part-
    /// abbreviation-display elements.
    public let text: Text

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLPartName: Equatable {
}

// MARK: - Hashable

extension MXLPartName: Hashable {
}

// MARK: - Sendable

extension MXLPartName: Sendable {
}
