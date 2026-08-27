// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNameDisplay {

    /// One of the alternatives for NameDisplay.
    public enum Item {
        /// The `accidental-text` alternative.
        case accidentalText(MXLAccidentalText)

        /// The `display-text` alternative.
        case displayText(MXLFormattedText)
    }
}

// MARK: - Equatable

extension MXLNameDisplay.Item: Equatable {
}

// MARK: - Hashable

extension MXLNameDisplay.Item: Hashable {
}

// MARK: - Sendable

extension MXLNameDisplay.Item: Sendable {
}
