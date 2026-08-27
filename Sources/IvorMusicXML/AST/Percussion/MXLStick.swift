// © 2026 John Gary Pusey (see LICENSE.md)

/// The stick type represents pictograms where the material of the stick, mallet, or beater is included. The
/// parentheses and dashed-circle attributes indicate the presence of these marks around the round beater part of
/// a pictogram. Values for these attributes are “no” if not present.
///
/// Maps the MusicXML `<stick>` element.
public struct MXLStick {

    // MARK: Public Initializers

    /// Creates a new `MXLStick`.
    ///
    /// - Parameter kind: The type of stick, mallet, or beater.
    /// - Parameter material: The material of the stick, mallet, or beater.
    /// - Parameter tip: The direction that the tip of the stick, mallet, or beater points.
    /// - Parameter hasParentheses: A Boolean value indicating whether the pictogram is enclosed in parentheses. Defaults to `false` if not present.
    /// - Parameter hasDashedCircle: A Boolean value indicating whether the pictogram is enclosed in a dashed circle. Defaults to `false` if not present.
    public init(kind: Kind,
                material: Material,
                tip: MXLTipDirection? = nil,
                hasParentheses: Bool? = nil,
                hasDashedCircle: Bool? = nil) {
        self.hasDashedCircle = hasDashedCircle ?? false
        self.hasParentheses = hasParentheses ?? false
        self.kind = kind
        self.material = material
        self.tip = tip
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether the pictogram is enclosed in a dashed circle. Defaults to `false` if not
    /// present.
    ///
    /// Maps to the MusicXML `dashed-circle` attribute.
    public let hasDashedCircle: Bool

    /// A Boolean value indicating whether the pictogram is enclosed in parentheses. Defaults to `false` if not
    /// present.
    ///
    /// Maps to the MusicXML `parentheses` attribute.
    public let hasParentheses: Bool

    /// The type of stick, mallet, or beater.
    ///
    /// Maps to a nested MusicXML `<stick-type>` element.
    public let kind: Kind

    /// The material of the stick, mallet, or beater.
    ///
    /// Maps to a nested MusicXML `<stick-material>` element.
    public let material: Material

    /// The direction that the tip of the stick, mallet, or beater points.
    ///
    /// Maps to the MusicXML `tip` attribute.
    public let tip: MXLTipDirection?
}

// MARK: - Equatable

extension MXLStick: Equatable {
}

// MARK: - Hashable

extension MXLStick: Hashable {
}

// MARK: - Sendable

extension MXLStick: Sendable {
}
