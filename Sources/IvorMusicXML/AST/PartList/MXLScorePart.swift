// © 2026 John Gary Pusey (see LICENSE.md)

/// The score-part type collects part-wide information for each part in a score. Often, each MusicXML part
/// corresponds to a track in a Standard MIDI Format 1 file. In this case, the midi-device element is used to make
/// a MIDI device or port assignment for the given track or specific MIDI instruments. Initial midi-instrument
/// assignments may be made here as well. The score-instrument elements are used when there are multiple
/// instruments per track.
///
/// Maps the MusicXML `<score-part>` element.
public struct MXLScorePart {

    // MARK: Public Initializers

    /// Creates a new `MXLScorePart`.
    ///
    /// - Parameter id: A unique identifier for this part, referenced by the id attribute of the corresponding part element.
    /// - Parameter identification: Identification information specific to this part.
    /// - Parameter link: Links this score-part to MusicXML documents that contain parts data.
    /// - Parameter name: The name of this part.
    /// - Parameter nameDisplay: Formatting for the display of the part name.
    /// - Parameter abbreviation: The abbreviation of this part’s name.
    /// - Parameter abbreviationDisplay: Formatting for the display of the part abbreviation.
    /// - Parameter group: The group element allows the use of different versions of the part for different purposes. Typical values include score, parts, sound, and data. Ordering information can be derived from the ordering within a MusicXML score or opus.
    /// - Parameter instrument: The instruments used by this part.
    /// - Parameter player: The players who perform this part.
    /// - Parameter group2: The MIDI device and instrument assignments for this part.
    public init(id: String,
                identification: MXLIdentification? = nil,
                link: [MXLPartLink] = [],
                name: MXLPartName,
                nameDisplay: MXLNameDisplay? = nil,
                abbreviation: MXLPartName? = nil,
                abbreviationDisplay: MXLNameDisplay? = nil,
                group: [String] = [],
                instrument: [MXLScoreInstrument] = [],
                player: [MXLPlayer] = [],
                group2: [Group2] = []) {
        self.abbreviation = abbreviation
        self.abbreviationDisplay = abbreviationDisplay
        self.group = group
        self.group2 = group2
        self.id = id
        self.identification = identification
        self.instrument = instrument
        self.link = link
        self.name = name
        self.nameDisplay = nameDisplay
        self.player = player
    }

    // MARK: Public Instance Properties

    /// The abbreviation of this part’s name.
    ///
    /// Maps to a nested MusicXML `<part-abbreviation>` element.
    public let abbreviation: MXLPartName?

    /// Formatting for the display of the part abbreviation.
    ///
    /// Maps to a nested MusicXML `<part-abbreviation-display>` element.
    public let abbreviationDisplay: MXLNameDisplay?

    /// The group element allows the use of different versions of the part for different purposes. Typical values
    /// include score, parts, sound, and data. Ordering information can be derived from the ordering within a MusicXML
    /// score or opus.
    ///
    /// Maps to nested MusicXML `<group>` elements.
    public let group: [String]

    /// The MIDI device and instrument assignments for this part.
    public let group2: [Group2]

    /// A unique identifier for this part, referenced by the id attribute of the corresponding part element.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String

    /// Identification information specific to this part.
    ///
    /// Maps to a nested MusicXML `<identification>` element.
    public let identification: MXLIdentification?

    /// The instruments used by this part.
    ///
    /// Maps to a nested MusicXML `<score-instrument>` element.
    public let instrument: [MXLScoreInstrument]

    /// Links this score-part to MusicXML documents that contain parts data.
    ///
    /// Maps to a nested MusicXML `<part-link>` element.
    public let link: [MXLPartLink]

    /// The name of this part.
    ///
    /// Maps to a nested MusicXML `<part-name>` element.
    public let name: MXLPartName

    /// Formatting for the display of the part name.
    ///
    /// Maps to a nested MusicXML `<part-name-display>` element.
    public let nameDisplay: MXLNameDisplay?

    /// The players who perform this part.
    ///
    /// Maps to nested MusicXML `<player>` elements.
    public let player: [MXLPlayer]
}

// MARK: - Equatable

extension MXLScorePart: Equatable {
}

// MARK: - Hashable

extension MXLScorePart: Hashable {
}

// MARK: - Sendable

extension MXLScorePart: Sendable {
}
