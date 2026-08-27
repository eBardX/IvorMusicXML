// © 2026 John Gary Pusey (see LICENSE.md)

/// The distance element represents standard distances between notation elements in tenths. The type attribute
/// defines what type of distance is being defined. Valid values include hyphen (for hyphens in lyrics) and beam.
///
/// Maps the MusicXML `<distance>` element.
public struct MXLDistance {

    // MARK: Public Initializers

    /// Creates a new `MXLDistance`.
    ///
    /// - Parameter value:  The value of this element.
    /// - Parameter kind:   The type of distance being defined, such as hyphen (for hyphens in lyrics) or beam.
    public init(value: Double,
                kind: Kind) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type of distance being defined, such as hyphen (for hyphens in lyrics) or beam.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// The value of this element.
    public let value: Double
}

// MARK: - Equatable

extension MXLDistance: Equatable {
}

// MARK: - Hashable

extension MXLDistance: Hashable {
}

// MARK: - Sendable

extension MXLDistance: Sendable {
}
