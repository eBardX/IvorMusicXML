// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLArrow {

    /// One of the alternatives for Arrow.
    public enum Content {
        /// The `arrow-direction` alternative.
        case arrowDirection(_ arrowDirection: Direction, style: Style?, hasArrowhead: Bool)

        /// The `circular-arrow` alternative.
        case circularArrow(MXLCircularArrow)
    }
}

// MARK: - Equatable

extension MXLArrow.Content: Equatable {
}

// MARK: - Hashable

extension MXLArrow.Content: Hashable {
}

// MARK: - Sendable

extension MXLArrow.Content: Sendable {
}
