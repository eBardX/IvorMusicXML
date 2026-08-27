// © 2026 John Gary Pusey (see LICENSE.md)

/// The instrument-change element type represents a change to the virtual instrument sound for a given score-
/// instrument. The id attribute refers to the score-instrument affected by the change. All instrument-change
/// child elements can also be initially specified within the score-instrument element.
///
/// Maps the MusicXML `<instrument-change>` element.
public struct MXLInstrumentChange {

    // MARK: Public Initializers

    /// Creates a new `MXLInstrumentChange`.
    ///
    /// - Parameter id: A reference to the id of the score-instrument affected by this change.
    public init(id: String) {
        self.id = id
    }

    // MARK: Public Instance Properties

    /// A reference to the id of the score-instrument affected by this change.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String
}

// MARK: - Equatable

extension MXLInstrumentChange: Equatable {
}

// MARK: - Hashable

extension MXLInstrumentChange: Hashable {
}

// MARK: - Sendable

extension MXLInstrumentChange: Sendable {
}
