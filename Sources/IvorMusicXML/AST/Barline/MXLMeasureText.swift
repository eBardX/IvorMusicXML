// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The measure-text type is used for the text attribute of measure elements. It has at least one character. The
/// implicit attribute of the measure element should be set to “yes” rather than setting the text attribute to an
/// empty string.
public struct MXLMeasureText {

    // MARK: Public Initializers

    /// Creates a new `MXLMeasureText` with the provided string value.
    ///
    /// If the provided string value is empty, this initializer returns `nil`.
    ///
    /// - Parameter stringValue: The text attribute of a measure element. It has at least one character.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// The text attribute of a measure element. It has at least one character.
    public let stringValue: String
}

// MARK: - StringRepresentable

extension MXLMeasureText: StringRepresentable {
}
