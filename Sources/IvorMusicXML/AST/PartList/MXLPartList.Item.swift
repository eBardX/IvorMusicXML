// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPartList {

    /// One of the alternatives for PartList.
    public enum Item {
        /// The part-group element is defined within a group due to its multiple uses within the part-list element.
        case partGroup(MXLPartGroup)

        /// The score-part element is defined within a group due to its multiple uses within the part-list element.
        case scorePart(MXLScorePart)
    }
}

// MARK: - Equatable

extension MXLPartList.Item: Equatable {
}

// MARK: - Hashable

extension MXLPartList.Item: Hashable {
}

// MARK: - Sendable

extension MXLPartList.Item: Sendable {
}
