// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The smufl-accidental-glyph-name type is used to reference a specific Standard Music Font Layout (SMuFL)
/// accidental character. The value is a SMuFL canonical glyph name that starts with one of the strings used at
/// the start of glyph names for SMuFL accidentals.
public struct MXLSmuflAccidentalGlyphName: StringRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLSmuflAccidentalGlyphName` with the provided string value.
    ///
    /// If the provided string value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter stringValue: A SMuFL canonical glyph name for an accidental character.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// A SMuFL canonical glyph name for an accidental character.
    public let stringValue: String
}

// MARK: -

extension MXLSmuflAccidentalGlyphName {

    // MARK: Public Type Methods

    /// Determines if the provided string value is a valid representation for a `MXLSmuflAccidentalGlyphName`.
    ///
    /// - Parameter stringValue: The string value to check for validity.
    ///
    /// - Returns: `true` when the provided string value starts with `acc`, `medRenFla`, `medRenNatura`,
    ///            `medRenShar`, or `kievanAccidental`, followed by one or more further glyph name characters;
    ///            `false` otherwise.
    public static func isValid(_ stringValue: String) -> Bool {
        let prefixes = ["acc", "medRenFla", "medRenNatura", "medRenShar", "kievanAccidental"]

        guard let prefix = prefixes.first(where: stringValue.hasPrefix)
        else { return false }

        let suffix = stringValue.dropFirst(prefix.count)

        return !suffix.isEmpty && MXLSmuflGlyphName.isValid(String(suffix))
    }
}
