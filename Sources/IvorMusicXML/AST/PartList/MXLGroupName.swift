// © 2026 John Gary Pusey (see LICENSE.md)

/// The group-name type describes the name or abbreviation of a part-group element. Formatting attributes in the
/// group-name type are deprecated in Version 2.0 in favor of the new group-name-display and group-abbreviation-
/// display elements.
///
/// Maps the MusicXML `<group-abbreviation>` and `<group-name>` elements.
public struct MXLGroupName {

    // MARK: Public Initializers

    /// Creates a new `MXLGroupName`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter text: The group-name-text attribute group is used by the group-name and group-abbreviation elements. The print-style and justify attribute groups are deprecated in MusicXML 2.0 in favor of the new group-name-display and group-abbreviation-display elements.
    public init(value: String,
                text: Text) {
        self.text = text
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The group-name-text attribute group is used by the group-name and group-abbreviation elements. The print-style
    /// and justify attribute groups are deprecated in MusicXML 2.0 in favor of the new group-name-display and group-
    /// abbreviation-display elements.
    public let text: Text

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLGroupName: Equatable {
}

// MARK: - Hashable

extension MXLGroupName: Hashable {
}

// MARK: - Sendable

extension MXLGroupName: Sendable {
}
