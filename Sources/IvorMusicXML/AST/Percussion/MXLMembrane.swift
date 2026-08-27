// © 2026 John Gary Pusey (see LICENSE.md)

/// The membrane type represents pictograms for membrane percussion instruments. The smufl attribute is used to
/// distinguish different SMuFL stylistic alternates.
///
/// Maps the MusicXML `<membrane>` element.
public struct MXLMembrane {

    // MARK: Public Initializers

    /// Creates a new `MXLMembrane`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl: Distinguishes different SMuFL stylistic alternates for this membrane pictogram.
    public init(value: Value,
                smufl: MXLSmuflPictogramGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Distinguishes different SMuFL stylistic alternates for this membrane pictogram.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflPictogramGlyphName?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLMembrane: Equatable {
}

// MARK: - Hashable

extension MXLMembrane: Hashable {
}

// MARK: - Sendable

extension MXLMembrane: Sendable {
}
