// © 2026 John Gary Pusey (see LICENSE.md)

/// The measure-layout type includes the horizontal distance from the previous measure. It applies to the current
/// measure only.
///
/// Maps the MusicXML `<measure-layout>` element.
public struct MXLMeasureLayout {

    // MARK: Public Initializers

    /// Creates a new `MXLMeasureLayout`.
    ///
    /// - Parameter measureDistance:  The measure-distance element specifies the horizontal distance from the previous measure. This value is only used for systems where there is horizontal whitespace in the middle of a system, as in systems with codas. To specify the measure width, use the width attribute of the measure element.
    public init(measureDistance: MXLTenths? = nil) {
        self.measureDistance = measureDistance
    }

    // MARK: Public Instance Properties

    /// The measure-distance element specifies the horizontal distance from the previous measure. This value is only
    /// used for systems where there is horizontal whitespace in the middle of a system, as in systems with codas. To
    /// specify the measure width, use the width attribute of the measure element.
    ///
    /// Maps to a nested MusicXML `<measure-distance>` element.
    public let measureDistance: MXLTenths?
}

// MARK: - Equatable

extension MXLMeasureLayout: Equatable {
}

// MARK: - Hashable

extension MXLMeasureLayout: Hashable {
}

// MARK: - Sendable

extension MXLMeasureLayout: Sendable {
}
