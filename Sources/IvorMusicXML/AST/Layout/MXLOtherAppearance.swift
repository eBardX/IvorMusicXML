// © 2026 John Gary Pusey (see LICENSE.md)

/// The other-appearance type is used to define any graphical settings not yet in the current version of the
/// MusicXML format. This allows extended representation, though without application interoperability.
///
/// Maps the MusicXML `<other-appearance>` element.
public struct MXLOtherAppearance {

    // MARK: Public Initializers

    /// Creates a new `MXLOtherAppearance`.
    ///
    /// - Parameter value:  The value of this element.
    /// - Parameter kind:   The type of graphical setting represented by this element.
    public init(value: String,
                kind: String) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type of graphical setting represented by this element.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: String

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLOtherAppearance: Equatable {
}

// MARK: - Hashable

extension MXLOtherAppearance: Hashable {
}

// MARK: - Sendable

extension MXLOtherAppearance: Sendable {
}
