// © 2026 John Gary Pusey (see LICENSE.md)

/// The stick-location type represents pictograms for the location of sticks, beaters, or mallets on cymbals,
/// gongs, drums, and other instruments.
///
/// Maps the MusicXML `<stick-location>` element.
public enum MXLStickLocation {

    /// The center of the instrument.
    case center

    /// The bell of a cymbal.
    case cymbalBell

    /// The edge of a cymbal.
    case cymbalEdge

    /// The rim of the instrument.
    case rim
}

// MARK: - Equatable

extension MXLStickLocation: Equatable {
}

// MARK: - Hashable

extension MXLStickLocation: Hashable {
}

// MARK: - Sendable

extension MXLStickLocation: Sendable {
}
