// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLBreathMark {

    /// The breath-mark-value type represents the symbol used for a breath mark.
    public enum Value {

        /// A comma-shaped breath mark.
        case comma

        /// An unspecified breath mark symbol.
        case empty

        /// A Salzedo-style breath mark.
        case salzedo

        /// A tick-shaped breath mark.
        case tick

        /// An upbow-shaped breath mark.
        case upbow
    }
}

// MARK: - Equatable

extension MXLBreathMark.Value: Equatable {
}

// MARK: - Hashable

extension MXLBreathMark.Value: Hashable {
}

// MARK: - Sendable

extension MXLBreathMark.Value: Sendable {
}
