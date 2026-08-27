// © 2026 John Gary Pusey (see LICENSE.md)

/// The semi-pitched type represents categories of indefinite pitch for percussion instruments.
///
/// Maps the MusicXML `<semi-pitched>` element.
public enum MXLSemiPitched {

    /// A high indefinite pitch.
    case high

    /// A low indefinite pitch.
    case low

    /// A medium indefinite pitch.
    case medium

    /// A medium-high indefinite pitch.
    case mediumHigh

    /// A medium-low indefinite pitch.
    case mediumLow

    /// A very low indefinite pitch.
    case veryLow
}

// MARK: - Equatable

extension MXLSemiPitched: Equatable {
}

// MARK: - Hashable

extension MXLSemiPitched: Hashable {
}

// MARK: - Sendable

extension MXLSemiPitched: Sendable {
}
