// © 2026 John Gary Pusey (see LICENSE.md)

/// The yes-no-number type is used for attributes that can be either boolean or numeric values.
public enum MXLYesNoNumber {

    /// The `no` value.
    case no

    /// A numeric value.
    case number(Double)

    /// The `yes` value.
    case yes
}

// MARK: - Equatable

extension MXLYesNoNumber: Equatable {
}

// MARK: - Hashable

extension MXLYesNoNumber: Hashable {
}

// MARK: - Sendable

extension MXLYesNoNumber: Sendable {
}
