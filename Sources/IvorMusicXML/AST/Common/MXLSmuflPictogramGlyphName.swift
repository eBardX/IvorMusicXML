// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The smufl-pictogram-glyph-name type is used to reference a specific Standard Music Font Layout (SMuFL)
/// percussion pictogram character. The value is a SMuFL canonical glyph name that starts with pict.
public struct MXLSmuflPictogramGlyphName: StringRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLSmuflPictogramGlyphName` with the provided string value.
    ///
    /// If the provided string value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter stringValue: A SMuFL canonical glyph name for a percussion pictogram character.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// A SMuFL canonical glyph name for a percussion pictogram character.
    public let stringValue: String
}

// MARK: -

extension MXLSmuflPictogramGlyphName {

    // MARK: Public Type Methods

    /// Determines if the provided string value is a valid representation for a `MXLSmuflPictogramGlyphName`.
    ///
    /// - Parameter stringValue: The string value to check for validity.
    ///
    /// - Returns: `true` when the provided string value starts with `pict`, followed by one or more further
    ///            glyph name characters; `false` otherwise.
    public static func isValid(_ stringValue: String) -> Bool {
        guard stringValue.hasPrefix("pict")
        else { return false }

        let suffix = stringValue.dropFirst(4)

        return !suffix.isEmpty && MXLSmuflGlyphName.isValid(String(suffix))
    }
}
