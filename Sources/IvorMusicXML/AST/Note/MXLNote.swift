// © 2026 John Gary Pusey (see LICENSE.md)

/// Notes are the most common type of MusicXML data. The MusicXML format distinguishes between elements used for
/// sound information and elements used for notation information (e.g., tie is used for sound, tied for notation).
/// Thus grace notes do not have a duration element. Cue notes have a duration element, as do forward elements,
/// but no tie elements. Having these two types of information available can make interchange easier, as some
/// programs handle one type of information more readily than the other.
///
/// The print-leger attribute is used to indicate whether leger lines are printed. Notes without leger lines are
/// used to indicate indeterminate high and low notes. By default, it is set to yes. If print-object is set to no,
/// print-leger is interpreted to also be set to no if not present. This attribute is ignored for rests.
///
/// The dynamics and end-dynamics attributes correspond to MIDI 1.0’s Note On and Note Off velocities,
/// respectively. They are expressed in terms of percentages of the default forte value (90 for MIDI 1.0).
///
/// The attack and release attributes are used to alter the starting and stopping time of the note from when it
/// would otherwise occur based on the flow of durations - information that is specific to a performance. They are
/// expressed in terms of divisions, either positive or negative. A note that starts a tie should not have a
/// release attribute, and a note that stops a tie should not have an attack attribute. The attack and release
/// attributes are independent of each other. The attack attribute only changes the starting time of a note, and
/// the release attribute only changes the stopping time of a note.
///
/// If a note is played only particular times through a repeat, the time-only attribute shows which times to play
/// the note.
///
/// The pizzicato attribute is used when just this note is sounded pizzicato, vs. the pizzicato element which
/// changes overall playback between pizzicato and arco.
///
/// Maps the MusicXML `<note>` element.
public struct MXLNote {

    // MARK: Public Initializers

    /// Creates a new `MXLNote`.
    ///
    /// - Parameter id:                The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter content:           One of the alternatives for Note.
    /// - Parameter instrument:        The instruments used to play this note, for parts with multiple instruments.
    /// - Parameter footnote:          The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level:             The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter voice:             A voice is a sequence of musical events (e.g. notes, chords, rests) that proceeds linearly in time. The voice element is used to distinguish between multiple voices in individual parts. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter kind:              The graphic note type (e.g. quarter, eighth), if specified.
    /// - Parameter dot:               One dot element is used for each dot of prolongation. The placement attribute is used to specify whether the dot should appear above or below the staff line. It is ignored for notes that appear on a staff space.
    /// - Parameter accidental:        The accidental to be displayed for this note, if any.
    /// - Parameter timeModification:  The time modification (e.g. for tuplets) applied to this note, if any.
    /// - Parameter stem:              The direction of the stem for this note, if any.
    /// - Parameter notehead:          The notehead shape used for this note, if any.
    /// - Parameter noteheadText:      The text displayed inside the notehead, if any.
    /// - Parameter staff:             The staff element is defined within a group due to its use by both notes and direction elements.
    /// - Parameter beam:              The beam markings associated with this note.
    /// - Parameter notations:         The notations (e.g. articulations, ornaments) associated with this note.
    /// - Parameter lyric:             The lyrics associated with this note.
    /// - Parameter play:              Playback information associated with this note, if any.
    /// - Parameter listen:            Listening information associated with this note, if any.
    /// - Parameter xPosition:         The x-position attribute group is used for elements like notes where specifying x position is common, but specifying y position is rare.
    /// - Parameter font:              The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color:             The color attribute group indicates the color of an element.
    /// - Parameter printout:          The printout attribute group collects the different controls over printing an object (e.g. a note or rest) and its parts, including augmentation dots and lyrics. This is especially useful for notes that overlap in different voices, or for chord sheets that contain lyrics and chords but no melody.
    /// - Parameter printsLeger:       A Boolean value indicating whether leger lines are printed. Notes without leger lines indicate indeterminate high and low notes. Defaults to `true`; ignored for rests.
    /// - Parameter dynamics:          The Note On velocity, corresponding to MIDI 1.0’s Note On velocity, expressed as a percentage of the default forte value (90 for MIDI 1.0).
    /// - Parameter endDynamics:       The Note Off velocity, corresponding to MIDI 1.0’s Note Off velocity, expressed as a percentage of the default forte value (90 for MIDI 1.0).
    /// - Parameter attack:            Alters the starting time of the note from when it would otherwise occur, expressed in divisions. A note that stops a tie should not have an attack attribute.
    /// - Parameter release:           Alters the stopping time of the note from when it would otherwise occur, expressed in divisions. A note that starts a tie should not have a release attribute.
    /// - Parameter timeOnly:          Indicates which times through a repeat this note is played, if only particular times.
    /// - Parameter isPizzicato:       A Boolean value indicating whether just this note is sounded pizzicato, as opposed to the pizzicato element, which changes overall playback between pizzicato and arco.
    public init(id: String? = nil,
                content: Content,
                instrument: [MXLInstrument] = [],
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                voice: MXLVoice? = nil,
                kind: Kind? = nil,
                dot: [MXLEmptyPlacement] = [],
                accidental: MXLAccidental? = nil,
                timeModification: MXLTimeModification? = nil,
                stem: MXLStem? = nil,
                notehead: Notehead? = nil,
                noteheadText: NoteheadText? = nil,
                staff: MXLStaff? = nil,
                beam: [MXLBeam] = [],
                notations: [MXLNotations] = [],
                lyric: [MXLLyric] = [],
                play: MXLPlay? = nil,
                listen: MXLListen? = nil,
                xPosition: MXLXPosition = MXLXPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                printout: MXLPrintout = MXLPrintout(),
                printsLeger: Bool? = nil,
                dynamics: MXLNonNegativeDecimal? = nil,
                endDynamics: MXLNonNegativeDecimal? = nil,
                attack: MXLDivisions? = nil,
                release: MXLDivisions? = nil,
                timeOnly: MXLTimeOnly? = nil,
                isPizzicato: Bool? = nil) {
        self.accidental = accidental
        self.attack = attack
        self.beam = beam
        self.color = color
        self.content = content
        self.dot = dot
        self.dynamics = dynamics
        self.endDynamics = endDynamics
        self.font = font
        self.footnote = footnote
        self.id = id
        self.instrument = instrument
        self.level = level
        self.listen = listen
        self.lyric = lyric
        self.notations = notations
        self.noteheadText = noteheadText
        self.isPizzicato = isPizzicato
        self.play = play
        self.printsLeger = printsLeger ?? true
        self.printout = printout
        self.release = release
        self.staff = staff
        self.stem = stem
        self.timeModification = timeModification
        self.timeOnly = timeOnly
        if let kind, kind.size == nil {
            let defaultSize: MXLSymbolSize = switch content {
            case .graceNote:
                .cue

            case .graceNoteCue:
                .graceCue

            case .regularNote:
                .full

            case .regularNoteCue:
                .cue
            }

            self.kind = Kind(value: kind.value, size: defaultSize)
        } else {
            self.kind = kind
        }
        if let notehead, notehead.isFilled == nil {
            let isHollow = switch kind?.value {
            case .breve,
                 .half,
                 .long,
                 .maxima,
                 .whole:
                true

            default:
                false
            }

            self.notehead = Notehead(value: notehead.value,
                                     isFilled: !isHollow,
                                     hasParentheses: notehead.hasParentheses,
                                     font: notehead.font,
                                     color: notehead.color,
                                     smufl: notehead.smufl)
        } else {
            self.notehead = notehead
        }
        self.voice = voice
        self.xPosition = xPosition
    }

    // MARK: Public Instance Properties

    /// The accidental to be displayed for this note, if any.
    ///
    /// Maps to a nested MusicXML `<accidental>` element.
    public let accidental: MXLAccidental?

    /// Alters the starting time of the note from when it would otherwise occur, expressed in divisions. A note that
    /// stops a tie should not have an attack attribute.
    ///
    /// Maps to the MusicXML `attack` attribute.
    public let attack: MXLDivisions?

    /// The beam markings associated with this note.
    ///
    /// Maps to nested MusicXML `<beam>` elements.
    public let beam: [MXLBeam]

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// One of the alternatives for Note.
    public let content: Content

    /// One dot element is used for each dot of prolongation. The placement attribute is used to specify whether the
    /// dot should appear above or below the staff line. It is ignored for notes that appear on a staff space.
    ///
    /// Maps to nested MusicXML `<dot>` elements.
    public let dot: [MXLEmptyPlacement]

    /// The Note On velocity, corresponding to MIDI 1.0’s Note On velocity, expressed as a percentage of the default
    /// forte value (90 for MIDI 1.0).
    ///
    /// Maps to the MusicXML `dynamics` attribute.
    public let dynamics: MXLNonNegativeDecimal?

    /// The Note Off velocity, corresponding to MIDI 1.0’s Note Off velocity, expressed as a percentage of the
    /// default forte value (90 for MIDI 1.0).
    ///
    /// Maps to the MusicXML `end-dynamics` attribute.
    public let endDynamics: MXLNonNegativeDecimal?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The instruments used to play this note, for parts with multiple instruments.
    ///
    /// Maps to nested MusicXML `<instrument>` elements.
    public let instrument: [MXLInstrument]

    /// A Boolean value indicating whether just this note is sounded pizzicato, as opposed to the pizzicato element,
    /// which changes overall playback between pizzicato and arco.
    ///
    /// Maps to the MusicXML `pizzicato` attribute.
    public let isPizzicato: Bool?

    /// The graphic note type (e.g. quarter, eighth), if specified.
    ///
    /// Maps to a nested MusicXML `<type>` element.
    public let kind: Kind?

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// Listening information associated with this note, if any.
    ///
    /// Maps to a nested MusicXML `<listen>` element.
    public let listen: MXLListen?

    /// The lyrics associated with this note.
    ///
    /// Maps to nested MusicXML `<lyric>` elements.
    public let lyric: [MXLLyric]

    /// The notations (e.g. articulations, ornaments) associated with this note.
    ///
    /// Maps to nested MusicXML `<notations>` elements.
    public let notations: [MXLNotations]

    /// The notehead shape used for this note, if any.
    ///
    /// Maps to a nested MusicXML `<notehead>` element.
    public let notehead: Notehead?

    /// The text displayed inside the notehead, if any.
    ///
    /// Maps to a nested MusicXML `<notehead-text>` element.
    public let noteheadText: NoteheadText?

    /// Playback information associated with this note, if any.
    ///
    /// Maps to a nested MusicXML `<play>` element.
    public let play: MXLPlay?

    /// The printout attribute group collects the different controls over printing an object (e.g. a note or rest) and
    /// its parts, including augmentation dots and lyrics. This is especially useful for notes that overlap in
    /// different voices, or for chord sheets that contain lyrics and chords but no melody.
    ///
    /// By default, all these attributes are set to yes. If print-object is set to no, the print-dot and print-lyric
    /// attributes are interpreted to also be set to no if they are not present.
    public let printout: MXLPrintout

    /// A Boolean value indicating whether leger lines are printed. Notes without leger lines indicate indeterminate
    /// high and low notes. Defaults to `true`; ignored for rests.
    ///
    /// Maps to the MusicXML `print-leger` attribute.
    public let printsLeger: Bool

    /// Alters the stopping time of the note from when it would otherwise occur, expressed in divisions. A note that
    /// starts a tie should not have a release attribute.
    ///
    /// Maps to the MusicXML `release` attribute.
    public let release: MXLDivisions?

    /// The staff element is defined within a group due to its use by both notes and direction elements.
    ///
    /// Maps to a nested MusicXML `<staff>` element.
    public let staff: MXLStaff?

    /// The direction of the stem for this note, if any.
    ///
    /// Maps to a nested MusicXML `<stem>` element.
    public let stem: MXLStem?

    /// The time modification (e.g. for tuplets) applied to this note, if any.
    ///
    /// Maps to a nested MusicXML `<time-modification>` element.
    public let timeModification: MXLTimeModification?

    /// Indicates which times through a repeat this note is played, if only particular times.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?

    /// A voice is a sequence of musical events (e.g. notes, chords, rests) that proceeds linearly in time. The voice
    /// element is used to distinguish between multiple voices in individual parts. It is defined within a group due
    /// to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<voice>` element.
    public let voice: MXLVoice?

    /// The x-position attribute group is used for elements like notes where specifying x position is common, but
    /// specifying y position is rare.
    public let xPosition: MXLXPosition
}

// MARK: - Equatable

extension MXLNote: Equatable {
}

// MARK: - Hashable

extension MXLNote: Hashable {
}

// MARK: - Sendable

extension MXLNote: Sendable {
}
