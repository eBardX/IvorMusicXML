// © 2026 John Gary Pusey (see LICENSE.md)

/// The appearance type controls general graphical settings for the music’s final form appearance on a printed
/// page of display. This includes support for line widths, definitions for note sizes, and standard distances
/// between notation elements, plus an extension element for other aspects of appearance.
///
/// Maps the MusicXML `<appearance>` element.
public struct MXLAppearance {

    // MARK: Public Initializers

    /// Creates a new `MXLAppearance`.
    ///
    /// - Parameter lineWidth:        The widths of the various line types used in the score.
    /// - Parameter noteSize:         The percentages of the regular note size used for cue and large notes.
    /// - Parameter distance:         The standard distances between notation elements.
    /// - Parameter glyph:            The SMuFL glyphs used for different variations of semantically identical symbols.
    /// - Parameter otherAppearance:  Any graphical settings not yet defined elsewhere in the MusicXML format.
    public init(lineWidth: [MXLLineWidth] = [],
                noteSize: [MXLNoteSize] = [],
                distance: [MXLDistance] = [],
                glyph: [MXLGlyph] = [],
                otherAppearance: [MXLOtherAppearance] = []) {
        self.distance = distance
        self.glyph = glyph
        self.lineWidth = lineWidth
        self.noteSize = noteSize
        self.otherAppearance = otherAppearance
    }

    // MARK: Public Instance Properties

    /// The standard distances between notation elements.
    ///
    /// Maps to nested MusicXML `<distance>` elements.
    public let distance: [MXLDistance]

    /// The SMuFL glyphs used for different variations of semantically identical symbols.
    ///
    /// Maps to nested MusicXML `<glyph>` elements.
    public let glyph: [MXLGlyph]

    /// The widths of the various line types used in the score.
    ///
    /// Maps to nested MusicXML `<line-width>` elements.
    public let lineWidth: [MXLLineWidth]

    /// The percentages of the regular note size used for cue and large notes.
    ///
    /// Maps to nested MusicXML `<note-size>` elements.
    public let noteSize: [MXLNoteSize]

    /// Any graphical settings not yet defined elsewhere in the MusicXML format.
    ///
    /// Maps to nested MusicXML `<other-appearance>` elements.
    public let otherAppearance: [MXLOtherAppearance]
}

// MARK: - Equatable

extension MXLAppearance: Equatable {
}

// MARK: - Hashable

extension MXLAppearance: Hashable {
}

// MARK: - Sendable

extension MXLAppearance: Sendable {
}
