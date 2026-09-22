// © 2026 John Gary Pusey (see LICENSE.md)

/// The wood type represents pictograms for wood percussion instruments. The smufl attribute is used to
/// distinguish different SMuFL stylistic alternates.
///
/// Maps the MusicXML `<wood>` element.
public struct MXLWood {

    // MARK: Public Initializers

    /// Creates a new `MXLWood`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl: Distinguishes different SMuFL stylistic alternates for this wood pictogram.
    public init(value: Value,
                smufl: MXLSmuflPictogramGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Distinguishes different SMuFL stylistic alternates for this wood pictogram.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflPictogramGlyphName?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLWood: Equatable {
}

// MARK: - Hashable

extension MXLWood: Hashable {
}

// MARK: - Sendable

extension MXLWood: Sendable {
}
