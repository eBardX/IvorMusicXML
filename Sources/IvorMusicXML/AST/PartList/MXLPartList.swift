// © 2026 John Gary Pusey (see LICENSE.md)

/// The part-list identifies the different musical parts in this document. Each part has an ID that is used later
/// within the musical data. Since parts may be encoded separately and combined later, identification elements are
/// present at both the score and score-part levels. There must be at least one score-part, combined as desired
/// with part-group elements that indicate braces and brackets. Parts are ordered from top to bottom in a score
/// based on the order in which they appear in the part-list.
///
/// Maps the MusicXML `<part-list>` element.
public struct MXLPartList {

    // MARK: Public Initializers

    /// Creates a new `MXLPartList`.
    ///
    /// - Parameter items: The ordered sequence of part-group and score-part elements making up this part-list.
    public init(items: [Item] = []) {
        self.items = items
    }

    // MARK: Public Instance Properties

    /// The ordered sequence of part-group and score-part elements making up this part-list.
    public let items: [Item]
}

// MARK: - Equatable

extension MXLPartList: Equatable {
}

// MARK: - Hashable

extension MXLPartList: Hashable {
}

// MARK: - Sendable

extension MXLPartList: Sendable {
}
