// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The smufl-wavy-line-glyph-name type is used to reference a specific Standard Music Font Layout (SMuFL) wavy
/// line character. The value is a SMuFL canonical glyph name that either starts with wiggle, or begins with
/// guitar and ends with VibratoStroke. This includes all the glyphs in the Multi-segment lines range, excluding
/// the beam glyphs.
public struct MXLSmuflWavyLineGlyphName: StringRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLSmuflWavyLineGlyphName` with the provided string value.
    ///
    /// If the provided string value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter stringValue: A SMuFL canonical glyph name for a wavy line character.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// A SMuFL canonical glyph name for a wavy line character.
    public let stringValue: String
}

// MARK: -

extension MXLSmuflWavyLineGlyphName {

    // MARK: Public Type Methods

    /// Determines if the provided string value is a valid representation for a `MXLSmuflWavyLineGlyphName`.
    ///
    /// - Parameter stringValue: The string value to check for validity.
    ///
    /// - Returns: `true` when the provided string value starts with `wiggle` followed by one or more further
    ///            glyph name characters, or starts with `guitar` and ends with `VibratoStroke`; `false` otherwise.
    public static func isValid(_ stringValue: String) -> Bool {
        if stringValue.hasPrefix("wiggle") {
            let suffix = stringValue.dropFirst(6)

            return !suffix.isEmpty && MXLSmuflGlyphName.isValid(String(suffix))
        }

        if stringValue.hasPrefix("guitar"),
           stringValue.hasSuffix("VibratoStroke") {
            let start = stringValue.index(stringValue.startIndex, offsetBy: 6)
            let end = stringValue.index(stringValue.endIndex, offsetBy: -13)

            guard start <= end
            else { return false }

            let middle = stringValue[start..<end]

            return middle.isEmpty || MXLSmuflGlyphName.isValid(String(middle))
        }

        return false
    }
}
