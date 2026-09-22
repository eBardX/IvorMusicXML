// © 2026 John Gary Pusey (see LICENSE.md)

/// The typed-text type represents a text element with a type attribute.
///
/// Maps the MusicXML `<creator>`, `<encoder>`, `<relation>`, and `<rights>` elements.
public struct MXLTypedText {

    // MARK: Public Initializers

    /// Creates a new `MXLTypedText`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter kind: The type attribute of this element.
    public init(value: String,
                kind: String? = nil) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type attribute of this element.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: String?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLTypedText: Equatable {
}

// MARK: - Hashable

extension MXLTypedText: Hashable {
}

// MARK: - Sendable

extension MXLTypedText: Sendable {
}
