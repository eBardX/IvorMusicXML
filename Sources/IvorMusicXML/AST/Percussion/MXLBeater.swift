// © 2026 John Gary Pusey (see LICENSE.md)

/// The beater type represents pictograms for beaters, mallets, and sticks that do not have different materials
/// represented in the pictogram.
///
/// Maps the MusicXML `<beater>` element.
public struct MXLBeater {

    // MARK: Public Initializers

    /// Creates a new `MXLBeater`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter tip:  The direction the tip of the beater points.
    public init(value: Value,
                tip: MXLTipDirection? = nil) {
        self.tip = tip
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The direction the tip of the beater points.
    ///
    /// Maps to the MusicXML `tip` attribute.
    public let tip: MXLTipDirection?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLBeater: Equatable {
}

// MARK: - Hashable

extension MXLBeater: Hashable {
}

// MARK: - Sendable

extension MXLBeater: Sendable {
}
