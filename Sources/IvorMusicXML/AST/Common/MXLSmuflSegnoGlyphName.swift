// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The smufl-segno-glyph-name type is used to reference a specific Standard Music Font Layout (SMuFL) segno
/// character. The value is a SMuFL canonical glyph name that starts with segno.
public struct MXLSmuflSegnoGlyphName: StringRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLSmuflSegnoGlyphName` with the provided string value.
    ///
    /// If the provided string value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter stringValue: A SMuFL canonical glyph name for a segno character.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// A SMuFL canonical glyph name for a segno character.
    public let stringValue: String
}

// MARK: -

extension MXLSmuflSegnoGlyphName {

    // MARK: Public Type Methods

    /// Determines if the provided string value is a valid representation for a `MXLSmuflSegnoGlyphName`.
    ///
    /// - Parameter stringValue: The string value to check for validity.
    ///
    /// - Returns: `true` when the provided string value starts with `segno`, optionally followed by further glyph
    ///            name characters; `false` otherwise.
    public static func isValid(_ stringValue: String) -> Bool {
        guard stringValue.hasPrefix("segno")
        else { return false }

        let suffix = stringValue.dropFirst(5)

        return suffix.isEmpty || MXLSmuflGlyphName.isValid(String(suffix))
    }
}
