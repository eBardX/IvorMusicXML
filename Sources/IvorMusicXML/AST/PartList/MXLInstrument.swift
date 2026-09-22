// © 2026 John Gary Pusey (see LICENSE.md)

/// The instrument type distinguishes between score-instrument elements in a score-part. The id attribute is an
/// IDREF back to the score-instrument ID. If multiple score-instruments are specified in a score-part, there
/// should be an instrument element for each note in the part. Notes that are shared between multiple score-
/// instruments can have more than one instrument element.
///
/// Maps the MusicXML `<instrument>` element.
public struct MXLInstrument {

    // MARK: Public Initializers

    /// Creates a new `MXLInstrument`.
    ///
    /// - Parameter id: A reference to the id of the score-instrument element that this instrument represents.
    public init(id: String) {
        self.id = id
    }

    // MARK: Public Instance Properties

    /// A reference to the id of the score-instrument element that this instrument represents.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String
}

// MARK: - Equatable

extension MXLInstrument: Equatable {
}

// MARK: - Hashable

extension MXLInstrument: Hashable {
}

// MARK: - Sendable

extension MXLInstrument: Sendable {
}
