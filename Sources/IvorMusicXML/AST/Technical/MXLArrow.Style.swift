// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLArrow {

    /// The arrow-style type represents the style of an arrow, using Unicode arrow terminology. Filled and hollow
    /// arrows indicate polygonal single arrows. Paired arrows are duplicate single arrows in the same direction.
    /// Combined arrows apply to double direction arrows like left right, indicating that an arrow in one direction
    /// should be combined with an arrow in the other direction.
    ///
    /// Maps the MusicXML `<arrow-style>` element.
    public enum Style {

        /// An arrow in one direction combined with an arrow in the other direction.
        case combined

        /// A double direction arrow.
        case double

        /// A polygonal single arrow with a filled head.
        case filled

        /// A polygonal single arrow with a hollow head.
        case hollow

        /// An arrow style other than those listed here.
        case other

        /// Duplicate single arrows in the same direction.
        case paired

        /// A single arrow.
        case single
    }
}

// MARK: - Equatable

extension MXLArrow.Style: Equatable {
}

// MARK: - Hashable

extension MXLArrow.Style: Hashable {
}

// MARK: - Sendable

extension MXLArrow.Style: Sendable {
}
