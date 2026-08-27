// © 2026 John Gary Pusey (see LICENSE.md)

/// The glyph element represents what SMuFL glyph should be used for different variations of symbols that are
/// semantically identical. The type attribute specifies what type of glyph is being defined. The element value
/// specifies what SMuFL glyph to use, including recommended stylistic alternates. The SMuFL glyph name should
/// match the type. For instance, a type of quarter-rest would use values restQuarter, restQuarterOld, or
/// restQuarterZ. A type of g-clef-ottava-bassa would use values gClef8vb, gClef8vbOld, or gClef8vbCClef. A type
/// of octave-shift-up-8 would use values ottava, ottavaBassa, ottavaBassaBa, ottavaBassaVb, or octaveBassa.
///
/// Maps the MusicXML `<glyph>` element.
public struct MXLGlyph {

    // MARK: Public Initializers

    /// Creates a new `MXLGlyph`.
    ///
    /// - Parameter value:  The value of this element.
    /// - Parameter kind:   The type of glyph being defined.
    public init(value: String,
                kind: Kind) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type of glyph being defined.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLGlyph: Equatable {
}

// MARK: - Hashable

extension MXLGlyph: Hashable {
}

// MARK: - Sendable

extension MXLGlyph: Sendable {
}
