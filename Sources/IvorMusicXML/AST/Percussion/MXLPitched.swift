// © 2026 John Gary Pusey (see LICENSE.md)

/// The pitched-value type represents pictograms for pitched percussion instruments. The smufl attribute is used
/// to distinguish different SMuFL glyphs for a particular pictogram within the Tuned mallet percussion pictograms
/// range.
///
/// Maps the MusicXML `<pitched>` element.
public struct MXLPitched {

    // MARK: Public Initializers

    /// Creates a new `MXLPitched`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl: Distinguishes different SMuFL glyphs for a particular pictogram within the Tuned mallet percussion pictograms range.
    public init(value: Value,
                smufl: MXLSmuflPictogramGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Distinguishes different SMuFL glyphs for a particular pictogram within the Tuned mallet percussion
    /// pictograms range.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflPictogramGlyphName?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLPitched: Equatable {
}

// MARK: - Hashable

extension MXLPitched: Hashable {
}

// MARK: - Sendable

extension MXLPitched: Sendable {
}
