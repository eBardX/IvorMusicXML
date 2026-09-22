// © 2026 John Gary Pusey (see LICENSE.md)

/// The metal type represents pictograms for metal percussion instruments. The smufl attribute is used to
/// distinguish different SMuFL stylistic alternates.
///
/// Maps the MusicXML `<metal>` element.
public struct MXLMetal {

    // MARK: Public Initializers

    /// Creates a new `MXLMetal`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl: Distinguishes different SMuFL stylistic alternates for this metal pictogram.
    public init(value: Value,
                smufl: MXLSmuflPictogramGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Distinguishes different SMuFL stylistic alternates for this metal pictogram.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflPictogramGlyphName?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLMetal: Equatable {
}

// MARK: - Hashable

extension MXLMetal: Hashable {
}

// MARK: - Sendable

extension MXLMetal: Sendable {
}
