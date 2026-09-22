// © 2026 John Gary Pusey (see LICENSE.md)

/// The glass type represents pictograms for glass percussion instruments. The smufl attribute is used to
/// distinguish different SMuFL glyphs for wind chimes in the Chimes pictograms range, including those made of
/// materials other than glass.
///
/// Maps the MusicXML `<glass>` element.
public struct MXLGlass {

    // MARK: Public Initializers

    /// Creates a new `MXLGlass`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl:  Distinguishes different SMuFL glyphs for wind chimes in the Chimes pictograms range, including those made of materials other than glass.
    public init(value: Value,
                smufl: MXLSmuflPictogramGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Distinguishes different SMuFL glyphs for wind chimes in the Chimes pictograms range, including those made of
    /// materials other than glass.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflPictogramGlyphName?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLGlass: Equatable {
}

// MARK: - Hashable

extension MXLGlass: Hashable {
}

// MARK: - Sendable

extension MXLGlass: Sendable {
}
