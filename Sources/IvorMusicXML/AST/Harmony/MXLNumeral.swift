// © 2026 John Gary Pusey (see LICENSE.md)

/// The numeral type represents the Roman numeral or Nashville number part of a harmony. It requires that the key
/// be specified in the encoding, either with a key or numeral-key element.
///
/// Maps the MusicXML `<numeral>` element.
public struct MXLNumeral {

    // MARK: Public Initializers

    /// Creates a new `MXLNumeral`.
    ///
    /// - Parameter root: The Roman numeral or Nashville number part of the harmony.
    /// - Parameter alter: The numeral-alter element represents an alteration to the numeral-root, similar to the alter element for a pitch. The print-object attribute can be used to hide an alteration in cases such as when the MusicXML encoding of a 6 or 7 numeral-root in a minor key requires an alteration that is not displayed. The location attribute indicates whether the alteration should appear to the left or the right of the numeral-root. It is left by default.
    /// - Parameter key: The key for the numeral, when it differs from the key specified by the key signature.
    public init(root: Root,
                alter: MXLHarmonyAlter? = nil,
                key: Key? = nil) {
        self.alter = alter
        self.key = key
        self.root = root
    }

    // MARK: Public Instance Properties

    /// The numeral-alter element represents an alteration to the numeral-root, similar to the alter element for a
    /// pitch. The print-object attribute can be used to hide an alteration in cases such as when the MusicXML
    /// encoding of a 6 or 7 numeral-root in a minor key requires an alteration that is not displayed. The location
    /// attribute indicates whether the alteration should appear to the left or the right of the numeral-root. It is
    /// left by default.
    ///
    /// Maps to a nested MusicXML `<numeral-alter>` element.
    public let alter: MXLHarmonyAlter?

    /// The key for the numeral, when it differs from the key specified by the key signature.
    ///
    /// Maps to a nested MusicXML `<numeral-key>` element.
    public let key: Key?

    /// The Roman numeral or Nashville number part of the harmony.
    ///
    /// Maps to a nested MusicXML `<numeral-root>` element.
    public let root: Root
}

// MARK: - Equatable

extension MXLNumeral: Equatable {
}

// MARK: - Hashable

extension MXLNumeral: Hashable {
}

// MARK: - Sendable

extension MXLNumeral: Sendable {
}
