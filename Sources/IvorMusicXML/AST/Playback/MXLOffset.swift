// © 2026 John Gary Pusey (see LICENSE.md)

/// An offset is represented in terms of divisions, and indicates where the direction will appear relative to the
/// current musical location. The current musical location is always within the current measure, even at the end
/// of a measure.
///
/// The offset affects the visual appearance of the direction. If the sound attribute is “yes”, then the offset
/// affects playback and listening too. If the sound attribute is “no”, then any sound or listening associated
/// with the direction takes effect at the current location. The sound attribute is “no” by default for
/// compatibility with earlier versions of the MusicXML format. If an element within a direction includes a
/// default-x attribute, the offset value will be ignored when determining the appearance of that element.
///
/// Maps the MusicXML `<offset>` element.
public struct MXLOffset {

    // MARK: Public Initializers

    /// Creates a new `MXLOffset`.
    ///
    /// - Parameter value:            The value of this element.
    /// - Parameter affectsPlayback:  A Boolean value indicating whether the offset affects playback and listening in addition to visual appearance. Defaults to `false` if not specified.
    public init(value: Double,
                affectsPlayback: Bool? = nil) {
        self.affectsPlayback = affectsPlayback ?? false
        self.value = value
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether the offset affects playback and listening in addition to visual
    /// appearance. Defaults to `false` if not specified.
    ///
    /// Maps to the MusicXML `sound` attribute.
    public let affectsPlayback: Bool

    /// The value of this element.
    public let value: Double
}

// MARK: - Equatable

extension MXLOffset: Equatable {
}

// MARK: - Hashable

extension MXLOffset: Hashable {
}

// MARK: - Sendable

extension MXLOffset: Sendable {
}
