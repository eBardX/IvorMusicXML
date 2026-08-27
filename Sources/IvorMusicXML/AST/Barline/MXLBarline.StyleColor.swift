// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLBarline {

    /// The bar-style-color type contains barline style and color information.
    ///
    /// Maps the MusicXML `<bar-style>` element.
    public struct StyleColor {

        // MARK: Public Initializers

        /// Creates a new `MXLBarline.StyleColor`.
        ///
        /// - Parameter value: The value of this element.
        /// - Parameter color: The color attribute group indicates the color of an element.
        public init(value: Style,
                    color: MXLColor? = nil) {
            self.color = color
            self.value = value
        }

        // MARK: Public Instance Properties

        /// The color attribute group indicates the color of an element.
        public let color: MXLColor?

        /// The value of this element.
        public let value: Style
    }
}

// MARK: - Equatable

extension MXLBarline.StyleColor: Equatable {
}

// MARK: - Hashable

extension MXLBarline.StyleColor: Hashable {
}

// MARK: - Sendable

extension MXLBarline.StyleColor: Sendable {
}
