// © 2026 John Gary Pusey (see LICENSE.md)

/// Multiple part-link elements can link a condensed part within a score file to multiple MusicXML parts files.
/// For example, a “Clarinet 1 and 2” part in a score file could link to separate “Clarinet 1” and “Clarinet 2”
/// part files. The instrument-link type distinguishes which of the score-instruments within a score-part are in
/// which part file. The instrument-link id attribute refers to a score-instrument id attribute.
///
/// Maps the MusicXML `<instrument-link>` element.
public struct MXLInstrumentLink {

    // MARK: Public Initializers

    /// Creates a new `MXLInstrumentLink`.
    ///
    /// - Parameter id: A reference to the id attribute of a score-instrument element.
    public init(id: String) {
        self.id = id
    }

    // MARK: Public Instance Properties

    /// A reference to the id attribute of a score-instrument element.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String
}

// MARK: - Equatable

extension MXLInstrumentLink: Equatable {
}

// MARK: - Hashable

extension MXLInstrumentLink: Hashable {
}

// MARK: - Sendable

extension MXLInstrumentLink: Sendable {
}
