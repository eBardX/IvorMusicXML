// © 2026 John Gary Pusey (see LICENSE.md)

/// The interchangeable type is used to represent the second in a pair of interchangeable dual time signatures,
/// such as the 6/8 in 3/4 (6/8). A separate symbol attribute value is available compared to the time element’s
/// symbol attribute, which applies to the first of the dual time signatures.
///
/// Maps the MusicXML `<interchangeable>` element.
public struct MXLInterchangeable {

    // MARK: Public Initializers

    /// Creates a new `MXLInterchangeable`.
    ///
    /// - Parameter timeRelation: The symbol used to represent the interchangeable aspect of the dual time signatures.
    /// - Parameter timeSignature: Time signatures are represented by the beats element for the numerator and the beat-type element for the denominator.
    /// - Parameter symbol: The symbol used to display this time signature, distinct from the symbol used for the first of the dual time signatures.
    /// - Parameter separator: How the beats and beat-type values are arranged relative to one another. `.stacked` if not specified.
    public init(timeRelation: MXLTimeRelation? = nil,
                timeSignature: [MXLTimeSignature] = [],
                symbol: MXLTimeSymbol? = nil,
                separator: MXLTimeSeparator? = nil) {
        self.separator = separator ?? .stacked
        self.symbol = symbol
        self.timeRelation = timeRelation
        self.timeSignature = timeSignature
    }

    // MARK: Public Instance Properties

    /// How the beats and beat-type values are arranged relative to one another. `.stacked` if not
    /// specified.
    ///
    /// Maps to the MusicXML `separator` attribute.
    public let separator: MXLTimeSeparator

    /// The symbol used to display this time signature, distinct from the symbol used for the first of the dual time
    /// signatures.
    ///
    /// Maps to the MusicXML `symbol` attribute.
    public let symbol: MXLTimeSymbol?

    /// The symbol used to represent the interchangeable aspect of the dual time signatures.
    ///
    /// Maps to a nested MusicXML `<time-relation>` element.
    public let timeRelation: MXLTimeRelation?

    /// Time signatures are represented by the beats element for the numerator and the beat-type element for the
    /// denominator.
    public let timeSignature: [MXLTimeSignature]
}

// MARK: - Equatable

extension MXLInterchangeable: Equatable {
}

// MARK: - Hashable

extension MXLInterchangeable: Hashable {
}

// MARK: - Sendable

extension MXLInterchangeable: Sendable {
}
