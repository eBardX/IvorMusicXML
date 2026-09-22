// © 2026 John Gary Pusey (see LICENSE.md)

/// The upright-inverted type describes the appearance of a fermata element. The value is upright if not
/// specified.
public enum MXLUprightInverted {

    /// An inverted fermata.
    case inverted

    /// An upright fermata. This is the default value.
    case upright
}

// MARK: - Equatable

extension MXLUprightInverted: Equatable {
}

// MARK: - Hashable

extension MXLUprightInverted: Hashable {
}

// MARK: - Sendable

extension MXLUprightInverted: Sendable {
}
