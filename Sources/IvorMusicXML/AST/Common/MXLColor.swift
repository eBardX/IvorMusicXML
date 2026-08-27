// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// The color type indicates the color of an element. Color may be represented as hexadecimal RGB triples, as in
/// HTML, or as hexadecimal ARGB tuples, with the A indicating alpha of transparency. An alpha value of 00 is
/// totally transparent; FF is totally opaque. If RGB is used, the A value is assumed to be FF.
///
/// For instance, the RGB value “#800080” represents purple. An ARGB value of “#40800080” would be a transparent
/// purple.
///
/// As in SVG 1.1, colors are defined in terms of the sRGB color space (IEC 61966).
public struct MXLColor: StringRepresentable {

    // MARK: Public Initializers

    /// Creates a new `MXLColor` with the provided string value.
    ///
    /// If the provided string value is determined to be invalid, this initializer returns `nil`.
    ///
    /// - Parameter stringValue: A `#` followed by a hexadecimal RGB triple or ARGB tuple, such as “#800080” or
    ///                          “#40800080”.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// A `#` followed by a hexadecimal RGB triple or ARGB tuple, such as “#800080” or “#40800080”.
    public let stringValue: String
}

// MARK: -

extension MXLColor {

    // MARK: Public Type Methods

    /// Determines if the provided string value is a valid representation for a `MXLColor`.
    ///
    /// - Parameter stringValue: The string value to check for validity.
    ///
    /// - Returns: `true` when the provided string value is a `#` followed by 6 or 8 uppercase hexadecimal digits;
    ///            `false` otherwise.
    public static func isValid(_ stringValue: String) -> Bool {
        guard stringValue.hasPrefix("#")
        else { return false }

        let hexDigits = stringValue.dropFirst()

        guard hexDigits.count == 6 || hexDigits.count == 8
        else { return false }

        return hexDigits.allSatisfy { $0.isNumber || ("A"..."F").contains($0) }
    }
}
