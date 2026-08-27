// © 2026 John Gary Pusey (see LICENSE.md)

/// The group-symbol-value type indicates how the symbol for a group or multi-staff part is indicated in the
/// score.
public enum MXLGroupSymbolValue {

    /// A brace symbol.
    case brace

    /// A bracket symbol.
    case bracket

    /// A line symbol.
    case line

    /// A square symbol.
    case square

    /// No symbol.
    case unmarked
}

// MARK: - Equatable

extension MXLGroupSymbolValue: Equatable {
}

// MARK: - Hashable

extension MXLGroupSymbolValue: Hashable {
}

// MARK: - Sendable

extension MXLGroupSymbolValue: Sendable {
}
