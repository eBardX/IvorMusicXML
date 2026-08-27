// © 2026 John Gary Pusey (see LICENSE.md)

/// The effect type represents pictograms for sound effect percussion instruments. The smufl attribute is used to
/// distinguish different SMuFL stylistic alternates.
///
/// Maps the MusicXML `<effect>` element.
public struct MXLEffect {

    // MARK: Public Initializers

    /// Creates a new `MXLEffect`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl:  Distinguishes different SMuFL stylistic alternates for this effect pictogram.
    public init(value: Value,
                smufl: MXLSmuflPictogramGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Distinguishes different SMuFL stylistic alternates for this effect pictogram.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflPictogramGlyphName?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLEffect: Equatable {
}

// MARK: - Hashable

extension MXLEffect: Hashable {
}

// MARK: - Sendable

extension MXLEffect: Sendable {
}
