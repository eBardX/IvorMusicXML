// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMeasureNumbering {

    /// The measure-numbering-value type describes how measure numbers are displayed on this part: no numbers, numbers
    /// every measure, or numbers every system.
    public enum Value {

        /// A measure number is displayed on every measure.
        case measure

        /// No measure numbers are displayed.
        case never

        /// A measure number is displayed on every system.
        case system
    }
}

// MARK: - Equatable

extension MXLMeasureNumbering.Value: Equatable {
}

// MARK: - Hashable

extension MXLMeasureNumbering.Value: Hashable {
}

// MARK: - Sendable

extension MXLMeasureNumbering.Value: Sendable {
}
