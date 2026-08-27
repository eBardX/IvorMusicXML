// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLBarline.StyleColor {

    /// The bar-style type represents barline style information. Choices are regular, dotted, dashed, heavy, light-
    /// light, light-heavy, heavy-light, heavy-heavy, tick (a short stroke through the top line), short (a partial
    /// barline between the 2nd and 4th lines), and none.
    public enum Style {

        /// A dashed barline.
        case dashed

        /// A dotted barline.
        case dotted

        /// A heavy barline.
        case heavy

        /// Two heavy barlines.
        case heavyHeavy

        /// A heavy barline followed by a light barline.
        case heavyLight

        /// No barline.
        case invisible

        /// A light barline followed by a heavy barline.
        case lightHeavy

        /// Two light barlines.
        case lightLight

        /// A regular barline.
        case regular

        /// A partial barline between the 2nd and 4th lines.
        case short

        /// A short stroke through the top line.
        case tick
    }
}

// MARK: - Equatable

extension MXLBarline.StyleColor.Style: Equatable {
}

// MARK: - Hashable

extension MXLBarline.StyleColor.Style: Hashable {
}

// MARK: - Sendable

extension MXLBarline.StyleColor.Style: Sendable {
}
