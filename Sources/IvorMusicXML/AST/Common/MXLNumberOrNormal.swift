// © 2026 John Gary Pusey (see LICENSE.md)

/// The number-or-normal values can be either a decimal number or the string “normal”. This is used by the line-
/// height and letter-spacing attributes.
public enum MXLNumberOrNormal {

    /// The `normal` value.
    case normal

    /// A decimal number value.
    case number(Double)
}

// MARK: - Equatable

extension MXLNumberOrNormal: Equatable {
}

// MARK: - Hashable

extension MXLNumberOrNormal: Hashable {
}

// MARK: - Sendable

extension MXLNumberOrNormal: Sendable {
}
