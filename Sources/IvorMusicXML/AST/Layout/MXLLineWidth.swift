// © 2026 John Gary Pusey (see LICENSE.md)

/// The line-width type indicates the width of a line type in tenths. The type attribute defines what type of line
/// is being defined. Values include beam, bracket, dashes, enclosure, ending, extend, heavy barline, leger, light
/// barline, octave shift, pedal, slur middle, slur tip, staff, stem, tie middle, tie tip, tuplet bracket, and
/// wedge. The text content is expressed in tenths.
///
/// Maps the MusicXML `<line-width>` element.
public struct MXLLineWidth {

    // MARK: Public Initializers

    /// Creates a new `MXLLineWidth`.
    ///
    /// - Parameter value:  The value of this element.
    /// - Parameter kind:   The type of line being defined, such as beam, bracket, dashes, staff, or stem.
    public init(value: Double,
                kind: Kind) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type of line being defined, such as beam, bracket, dashes, staff, or stem.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// The value of this element.
    public let value: Double
}

// MARK: - Equatable

extension MXLLineWidth: Equatable {
}

// MARK: - Hashable

extension MXLLineWidth: Hashable {
}

// MARK: - Sendable

extension MXLLineWidth: Sendable {
}
