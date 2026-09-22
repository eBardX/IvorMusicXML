// © 2026 John Gary Pusey (see LICENSE.md)

/// The key-accidental type indicates the accidental to be displayed in a non-traditional key signature,
/// represented in the same manner as the accidental type without the formatting attributes.
///
/// Maps the MusicXML `<key-accidental>` element.
public struct MXLKeyAccidental {

    // MARK: Public Initializers

    /// Creates a new `MXLKeyAccidental`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter smufl: The SMuFL canonical glyph name used to specify a particular accidental character.
    public init(value: MXLAccidentalValue,
                smufl: MXLSmuflAccidentalGlyphName? = nil) {
        self.smufl = smufl
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The SMuFL canonical glyph name used to specify a particular accidental character.
    ///
    /// Maps to the MusicXML `smufl` attribute.
    public let smufl: MXLSmuflAccidentalGlyphName?

    /// The value of this element.
    public let value: MXLAccidentalValue
}

// MARK: - Equatable

extension MXLKeyAccidental: Equatable {
}

// MARK: - Hashable

extension MXLKeyAccidental: Hashable {
}

// MARK: - Sendable

extension MXLKeyAccidental: Sendable {
}
