// © 2026 John Gary Pusey (see LICENSE.md)

/// The circular-arrow type represents the direction in which a circular arrow points, using Unicode arrow
/// terminology.
///
/// Maps the MusicXML `<circular-arrow>` element.
public enum MXLCircularArrow {

    /// The circular arrow points anticlockwise.
    case anticlockwise

    /// The circular arrow points clockwise.
    case clockwise
}

// MARK: - Equatable

extension MXLCircularArrow: Equatable {
}

// MARK: - Hashable

extension MXLCircularArrow: Hashable {
}

// MARK: - Sendable

extension MXLCircularArrow: Sendable {
}
