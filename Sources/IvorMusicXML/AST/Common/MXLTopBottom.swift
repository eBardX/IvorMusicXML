// © 2026 John Gary Pusey (see LICENSE.md)

/// The top-bottom type is used to indicate the top or bottom part of a vertical shape like non-arpeggiate.
public enum MXLTopBottom {

    /// The bottom part of the shape.
    case bottom

    /// The top part of the shape.
    case top
}

// MARK: - Equatable

extension MXLTopBottom: Equatable {
}

// MARK: - Hashable

extension MXLTopBottom: Hashable {
}

// MARK: - Sendable

extension MXLTopBottom: Sendable {
}
