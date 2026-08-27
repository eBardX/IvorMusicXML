// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The smufl-glyph-name type is used for attributes that reference a specific Standard Music Font Layout (SMuFL)
/// character. The value is a SMuFL canonical glyph name, not a code point. For instance, the value for a standard
/// piano pedal mark would be keyboardPedalPed, not U+E650.
public struct MXLSmuflGlyphName: StringRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLSmuflGlyphName` with the provided string value.
    ///
    /// If the provided string value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter stringValue: A SMuFL canonical glyph name, such as `keyboardPedalPed`.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// A SMuFL canonical glyph name, such as `keyboardPedalPed`.
    public let stringValue: String
}

// MARK: -

extension MXLSmuflGlyphName {

    // MARK: Public Type Methods

    /// Determines if the provided string value is a valid representation for a `MXLSmuflGlyphName`.
    ///
    /// - Parameter stringValue: The string value to check for validity.
    ///
    /// - Returns: `true` when the provided string value is non-empty and contains only characters allowed in an
    ///            XML name token; `false` otherwise.
    public static func isValid(_ stringValue: String) -> Bool {
        !stringValue.isEmpty && stringValue.allSatisfy(isNameCharacter)
    }

    // MARK: Internal Type Methods

    internal static func isNameCharacter(_ character: Character) -> Bool {
        character.isLetter || character.isNumber || "-_.:".contains(character)
    }
}
