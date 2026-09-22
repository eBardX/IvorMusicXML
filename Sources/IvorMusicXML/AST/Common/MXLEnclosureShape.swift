// © 2026 John Gary Pusey (see LICENSE.md)

/// The enclosure-shape type describes the shape and presence / absence of an enclosure around text or symbols. A
/// bracket enclosure is similar to a rectangle with the bottom line missing, as is common in jazz notation. An
/// inverted-bracket enclosure is similar to a rectangle with the top line missing.
public enum MXLEnclosureShape {

    /// A rectangle with the bottom line missing, as is common in jazz notation.
    case bracket

    /// A circular enclosure.
    case circle

    /// A ten-sided enclosure.
    case decagon

    /// A diamond-shaped enclosure.
    case diamond

    /// A seven-sided enclosure.
    case heptagon

    /// A six-sided enclosure.
    case hexagon

    /// A rectangle with the top line missing.
    case invertedBracket

    /// A nine-sided enclosure.
    case nonagon

    /// An eight-sided enclosure.
    case octagon

    /// An oval enclosure.
    case oval

    /// A five-sided enclosure.
    case pentagon

    /// A rectangular enclosure.
    case rectangle

    /// A square enclosure.
    case square

    /// A triangular enclosure.
    case triangle

    /// No enclosure.
    case unenclosed
}

// MARK: - Equatable

extension MXLEnclosureShape: Equatable {
}

// MARK: - Hashable

extension MXLEnclosureShape: Hashable {
}

// MARK: - Sendable

extension MXLEnclosureShape: Sendable {
}
