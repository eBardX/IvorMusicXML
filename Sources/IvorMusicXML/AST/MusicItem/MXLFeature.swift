// © 2026 John Gary Pusey (see LICENSE.md)

/// The feature type is a part of the grouping element used for musical analysis. The type attribute represents
/// the type of the feature and the element content represents its value. This type is flexible to allow for
/// different analyses.
///
/// Maps the MusicXML `<feature>` element.
public struct MXLFeature {

    // MARK: Public Initializers

    /// Creates a new `MXLFeature`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter kind:  The type of the feature being represented.
    public init(value: String,
                kind: String? = nil) {
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The type of the feature being represented.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: String?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLFeature: Equatable {
}

// MARK: - Hashable

extension MXLFeature: Hashable {
}

// MARK: - Sendable

extension MXLFeature: Sendable {
}
