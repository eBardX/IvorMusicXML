// © 2026 John Gary Pusey (see LICENSE.md)

/// The timpani type represents the timpani pictogram. The smufl attribute is used to distinguish different SMuFL
/// stylistic alternates.
///
/// Maps the MusicXML `<timpani>` element.
public struct MXLTimpani {

    // MARK: Public Initializers

    /// Creates a new `MXLTimpani`.
    ///
    /// - Parameter smufl: Distinguishes different SMuFL stylistic alternates for this timpani pictogram.
    public init(smufl: MXLSmuflPictogramGlyphName? = nil) {
        self.smufl = smufl
    }

    // MARK: Public Instance Properties

    /// Distinguishes different SMuFL stylistic alternates for this timpani pictogram.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflPictogramGlyphName?
}

// MARK: - Equatable

extension MXLTimpani: Equatable {
}

// MARK: - Hashable

extension MXLTimpani: Hashable {
}

// MARK: - Sendable

extension MXLTimpani: Sendable {
}
