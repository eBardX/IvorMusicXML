// © 2026 John Gary Pusey (see LICENSE.md)

/// The double type indicates that the music is doubled one octave from what is currently written. If the above
/// attribute is set to yes, the doubling is one octave above what is written, as for mixed flute / piccolo parts
/// in band literature. Otherwise the doubling is one octave below what is written, as for mixed cello / bass
/// parts in orchestral literature.
///
/// Maps the MusicXML `<double>` element.
public struct MXLDouble {

    // MARK: Public Initializers

    /// Creates a new `MXLDouble`.
    ///
    /// - Parameter isAbove:  A Boolean value indicating whether the doubling is one octave above (`true`) or one octave below (`false`, the default) what is written.
    public init(isAbove: Bool? = nil) {
        self.isAbove = isAbove
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether the doubling is one octave above (`true`) or one octave below (`false`,
    /// the default) what is written.
    ///
    /// Maps to the MusicXML `above` attribute.
    public let isAbove: Bool?
}

// MARK: - Equatable

extension MXLDouble: Equatable {
}

// MARK: - Hashable

extension MXLDouble: Hashable {
}

// MARK: - Sendable

extension MXLDouble: Sendable {
}
