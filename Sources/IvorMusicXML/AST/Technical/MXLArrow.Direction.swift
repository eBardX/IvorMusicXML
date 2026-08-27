// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLArrow {

    /// The arrow-direction type represents the direction in which an arrow points, using Unicode arrow terminology.
    ///
    /// Maps the MusicXML `<arrow-direction>` element.
    public enum Direction {

        /// The arrow points down.
        case down

        /// The arrow points left.
        case left

        /// The arrow points both left and right.
        case leftRight

        /// The arrow points northeast.
        case northeast

        /// The arrow points both northeast and southwest.
        case northeastSouthwest

        /// The arrow points northwest.
        case northwest

        /// The arrow points both northwest and southeast.
        case northwestSoutheast

        /// An arrow direction other than those listed here.
        case other

        /// The arrow points right.
        case right

        /// The arrow points southeast.
        case southeast

        /// The arrow points southwest.
        case southwest

        /// The arrow points up.
        case up

        /// The arrow points both up and down.
        case upDown
    }
}

// MARK: - Equatable

extension MXLArrow.Direction: Equatable {
}

// MARK: - Hashable

extension MXLArrow.Direction: Hashable {
}

// MARK: - Sendable

extension MXLArrow.Direction: Sendable {
}
