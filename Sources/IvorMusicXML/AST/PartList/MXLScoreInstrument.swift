// © 2026 John Gary Pusey (see LICENSE.md)

/// The score-instrument type represents a single instrument within a score-part. As with the score-part type,
/// each score-instrument has a required ID attribute, a name, and an optional abbreviation.
///
/// A score-instrument type is also required if the score specifies MIDI 1.0 channels, banks, or programs. An
/// initial midi-instrument assignment can also be made here. MusicXML software should be able to automatically
/// assign reasonable channels and instruments without these elements in simple cases, such as where part names
/// match General MIDI instrument names.
///
/// The score-instrument element can also distinguish multiple instruments of the same type that are on the same
/// part, such as Clarinet 1 and Clarinet 2 instruments within a Clarinets 1 and 2 part.
///
/// Maps the MusicXML `<score-instrument>` element.
public struct MXLScoreInstrument {

    // MARK: Public Initializers

    /// Creates a new `MXLScoreInstrument`.
    ///
    /// - Parameter id: A required identifier for this instrument, unique within the score-part.
    /// - Parameter name: The instrument-name element is typically used within a software application, rather than appearing on the printed page of a score.
    /// - Parameter abbreviation: The optional instrument-abbreviation element is typically used within a software application, rather than appearing on the printed page of a score.
    /// - Parameter virtualInstrumentData: Virtual instrument data can be part of either the score-instrument element at the start of a part, or an instrument-change element within a part.
    public init(id: String,
                name: String,
                abbreviation: String? = nil,
                virtualInstrumentData: MXLVirtualInstrumentData = MXLVirtualInstrumentData()) {
        self.abbreviation = abbreviation
        self.id = id
        self.name = name
        self.virtualInstrumentData = virtualInstrumentData
    }

    // MARK: Public Instance Properties

    /// The optional instrument-abbreviation element is typically used within a software application, rather than
    /// appearing on the printed page of a score.
    ///
    /// Maps to a nested MusicXML `<instrument-abbreviation>` element.
    public let abbreviation: String?

    /// A required identifier for this instrument, unique within the score-part.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String

    /// The instrument-name element is typically used within a software application, rather than appearing on the
    /// printed page of a score.
    ///
    /// Maps to a nested MusicXML `<instrument-name>` element.
    public let name: String

    /// Virtual instrument data can be part of either the score-instrument element at the start of a part, or an
    /// instrument-change element within a part.
    public let virtualInstrumentData: MXLVirtualInstrumentData
}

// MARK: - Equatable

extension MXLScoreInstrument: Equatable {
}

// MARK: - Hashable

extension MXLScoreInstrument: Hashable {
}

// MARK: - Sendable

extension MXLScoreInstrument: Sendable {
}
