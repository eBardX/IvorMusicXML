// © 2026 John Gary Pusey (see LICENSE.md)

/// The measure-repeat type is used for both single and multiple measure repeats. The text of the element
/// indicates the number of measures to be repeated in a single pattern. The slashes attribute specifies the
/// number of slashes to use in the repeat sign. It is 1 if not specified. The text of the element is ignored when
/// the type is stop.
///
/// The stop type indicates the first measure where the repeats are no longer displayed. Both the start and the
/// stop of the measure-repeat should be specified unless the repeats are displayed through the end of the part.
///
/// The measure-repeat element specifies a notation style for repetitions. The actual music being repeated needs
/// to be repeated within each measure of the MusicXML file. This element specifies the notation that indicates
/// the repeat.
///
/// Maps the MusicXML `<measure-repeat>` element.
public struct MXLMeasureRepeat {

    // MARK: Public Initializers

    /// Creates a new `MXLMeasureRepeat`.
    ///
    /// - Parameter value: The number of measures to be repeated in a single pattern, or `nil` when the value is empty (as when the type is stop).
    /// - Parameter kind: Whether this element marks the start or the stop of the measure repeat.
    /// - Parameter slashes: The number of slashes to use in the repeat sign. `1` if not specified.
    public init(value: Int? = nil,
                kind: MXLStartStop,
                slashes: Int? = nil) {
        self.slashes = slashes
        self.kind = kind
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Whether this element marks the start or the stop of the measure repeat.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStop

    /// The number of slashes to use in the repeat sign. `1` if not specified.
    ///
    /// Maps to the MusicXML `slashes` attribute.
    public let slashes: Int?

    /// The number of measures to be repeated in a single pattern, or `nil` when the value is empty (as when the type
    /// is stop).
    public let value: Int?
}

// MARK: - Equatable

extension MXLMeasureRepeat: Equatable {
}

// MARK: - Hashable

extension MXLMeasureRepeat: Hashable {
}

// MARK: - Sendable

extension MXLMeasureRepeat: Sendable {
}
