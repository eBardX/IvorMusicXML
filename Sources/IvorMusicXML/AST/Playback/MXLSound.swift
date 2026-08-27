// © 2026 John Gary Pusey (see LICENSE.md)

/// The sound element contains general playback parameters. They can stand alone within a part/measure, or be a
/// component element within a direction.
///
/// Tempo is expressed in quarter notes per minute. If 0, the sound-generating program should prompt the user at
/// the time of compiling a sound (MIDI) file.
///
/// Dynamics (or MIDI velocity) are expressed as a percentage of the default forte value (90 for MIDI 1.0).
///
/// Dacapo indicates to go back to the beginning of the movement. When used it always has the value “yes”.
///
/// Segno and dalsegno are used for backwards jumps to a segno sign; coda and tocoda are used for forward jumps to
/// a coda sign. If there are multiple jumps, the value of these parameters can be used to name and distinguish
/// them. If segno or coda is used, the divisions attribute can also be used to indicate the number of divisions
/// per quarter note. Otherwise sound and MIDI generating programs may have to recompute this.
///
/// By default, a dalsegno or dacapo attribute indicates that the jump should occur the first time through, while
/// a tocoda attribute indicates the jump should occur the second time through. The time that jumps occur can be
/// changed by using the time-only attribute.
///
/// The forward-repeat attribute indicates that a forward repeat sign is implied but not displayed. It is used for
/// example in two-part forms with repeats, such as a minuet and trio where no repeat is displayed at the start of
/// the trio. This usually occurs after a barline. When used it always has the value of “yes”.
///
/// The fine attribute follows the final note or rest in a movement with a da capo or dal segno direction. If
/// numeric, the value represents the actual duration of the final note or rest, which can be ambiguous in written
/// notation and different among parts and voices. The value may also be “yes” to indicate no change to the final
/// duration.
///
/// If the sound element applies only particular times through a repeat, the time-only attribute indicates which
/// times to apply the sound element.
///
/// Pizzicato in a sound element effects all following notes. Yes indicates pizzicato, no indicates arco.
///
/// The pan and elevation attributes are deprecated in Version 2.0. The pan and elevation elements in the midi-
/// instrument element should be used instead. The meaning of the pan and elevation attributes is the same as for
/// the pan and elevation elements. If both are present, the mid-instrument elements take priority.
///
/// The damper-pedal, soft-pedal, and sostenuto-pedal attributes effect playback of the three common piano pedals
/// and their MIDI controller equivalents. The yes value indicates the pedal is depressed; no indicates the pedal
/// is released. A numeric value from 0 to 100 may also be used for half pedaling. This value is the percentage
/// that the pedal is depressed. A value of 0 is equivalent to no, and a value of 100 is equivalent to yes.
///
/// Instrument changes, MIDI devices, MIDI instruments, and playback techniques are changed using the instrument-
/// change, midi-device, midi-instrument, and play elements. When there are multiple instances of these elements,
/// they should be grouped together by instrument using the id attribute values.
///
/// The offset element is used to indicate that the sound takes place offset from the current score position. If
/// the sound element is a child of a direction element, the sound offset element overrides the direction offset
/// element if both elements are present. Note that the offset reflects the intended musical position for the
/// change in sound. It should not be used to compensate for latency issues in particular hardware configurations.
///
/// Maps the MusicXML `<sound>` element.
public struct MXLSound {

    // MARK: Public Initializers

    /// Creates a new `MXLSound`.
    ///
    /// - Parameter id:                    The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter group:                 The instrument changes, MIDI device and instrument assignments, and playback techniques associated with this sound element, grouped by instrument.
    /// - Parameter swing:                 Specifies playback as swung rather than even notes.
    /// - Parameter offset:                Indicates that the sound takes place offset from the current score position.
    /// - Parameter tempo:                 The tempo, expressed in quarter notes per minute. A value of `0` indicates the sound-generating program should prompt the user when compiling a sound file.
    /// - Parameter dynamics:              The dynamics (or MIDI velocity), expressed as a percentage of the default forte value (90 for MIDI 1.0).
    /// - Parameter isDaCapo:              A Boolean value indicating whether to go back to the beginning of the movement.
    /// - Parameter segno:                 Names a segno sign for a backward jump, used to distinguish between multiple jumps.
    /// - Parameter dalsegno:              Names the segno sign to jump back to, used to distinguish between multiple jumps.
    /// - Parameter coda:                  Names a coda sign for a forward jump, used to distinguish between multiple jumps.
    /// - Parameter tocoda:                Names the coda sign to jump forward to, used to distinguish between multiple jumps.
    /// - Parameter divisions:             The number of divisions per quarter note, used together with the segno or coda attributes.
    /// - Parameter impliesForwardRepeat:  A Boolean value indicating whether a forward repeat sign is implied but not displayed.
    /// - Parameter fine:                  Follows the final note or rest in a movement with a da capo or dal segno direction. If numeric, represents the actual duration of the final note or rest.
    /// - Parameter timeOnly:              Indicates which times through a repeat this sound element applies to, if only particular times.
    /// - Parameter isPizzicato:           A Boolean value indicating whether following notes are played pizzicato (`true`) or arco (`false`).
    /// - Parameter pan:                   Deprecated in favor of the pan element in midi-instrument. Specifies placement of sound in a 3-D space relative to the listener, in degrees.
    /// - Parameter elevation:             Deprecated in favor of the elevation element in midi-instrument. Specifies placement of sound in a 3-D space relative to the listener, in degrees.
    /// - Parameter damperPedal:           Controls playback of the damper pedal. A numeric value from 0 to 100 may be used for half pedaling.
    /// - Parameter softPedal:             Controls playback of the soft pedal. A numeric value from 0 to 100 may be used for half pedaling.
    /// - Parameter sostenutoPedal:        Controls playback of the sostenuto pedal. A numeric value from 0 to 100 may be used for half pedaling.
    public init(id: String? = nil,
                group: [Group] = [],
                swing: MXLSwing? = nil,
                offset: MXLOffset? = nil,
                tempo: MXLNonNegativeDecimal? = nil,
                dynamics: MXLNonNegativeDecimal? = nil,
                isDaCapo: Bool? = nil,
                segno: String? = nil,
                dalsegno: String? = nil,
                coda: String? = nil,
                tocoda: String? = nil,
                divisions: MXLDivisions? = nil,
                impliesForwardRepeat: Bool? = nil,
                fine: String? = nil,
                timeOnly: MXLTimeOnly? = nil,
                isPizzicato: Bool? = nil,
                pan: MXLRotationDegrees? = nil,
                elevation: MXLRotationDegrees? = nil,
                damperPedal: MXLYesNoNumber? = nil,
                softPedal: MXLYesNoNumber? = nil,
                sostenutoPedal: MXLYesNoNumber? = nil) {
        self.coda = coda
        self.isDaCapo = isDaCapo
        self.dalsegno = dalsegno
        self.damperPedal = damperPedal
        self.divisions = divisions
        self.dynamics = dynamics
        self.elevation = elevation
        self.fine = fine
        self.impliesForwardRepeat = impliesForwardRepeat
        self.group = group
        self.id = id
        self.offset = offset
        self.pan = pan
        self.isPizzicato = isPizzicato
        self.segno = segno
        self.softPedal = softPedal
        self.sostenutoPedal = sostenutoPedal
        self.swing = swing
        self.tempo = tempo
        self.timeOnly = timeOnly
        self.tocoda = tocoda
    }

    // MARK: Public Instance Properties

    /// Names a coda sign for a forward jump, used to distinguish between multiple jumps.
    ///
    /// Maps to the MusicXML `coda` attribute.
    public let coda: String?

    /// Names the segno sign to jump back to, used to distinguish between multiple jumps.
    ///
    /// Maps to the MusicXML `dalsegno` attribute.
    public let dalsegno: String?

    /// Controls playback of the damper pedal. A numeric value from 0 to 100 may be used for half pedaling.
    ///
    /// Maps to the MusicXML `damper-pedal` attribute.
    public let damperPedal: MXLYesNoNumber?

    /// The number of divisions per quarter note, used together with the segno or coda attributes.
    ///
    /// Maps to the MusicXML `divisions` attribute.
    public let divisions: MXLDivisions?

    /// The dynamics (or MIDI velocity), expressed as a percentage of the default forte value (90 for MIDI 1.0).
    ///
    /// Maps to the MusicXML `dynamics` attribute.
    public let dynamics: MXLNonNegativeDecimal?

    /// Deprecated in favor of the elevation element in midi-instrument. Specifies placement of sound in a 3-D space
    /// relative to the listener, in degrees.
    ///
    /// Maps to the MusicXML `elevation` attribute.
    public let elevation: MXLRotationDegrees?

    /// Follows the final note or rest in a movement with a da capo or dal segno direction. If numeric, represents
    /// the actual duration of the final note or rest.
    ///
    /// Maps to the MusicXML `fine` attribute.
    public let fine: String?

    /// The instrument changes, MIDI device and instrument assignments, and playback techniques associated with this
    /// sound element, grouped by instrument.
    public let group: [Group]

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// A Boolean value indicating whether a forward repeat sign is implied but not displayed.
    ///
    /// Maps to the MusicXML `forward-repeat` attribute.
    public let impliesForwardRepeat: Bool?

    /// A Boolean value indicating whether to go back to the beginning of the movement.
    ///
    /// Maps to the MusicXML `dacapo` attribute.
    public let isDaCapo: Bool?

    /// A Boolean value indicating whether following notes are played pizzicato (`true`) or arco (`false`).
    ///
    /// Maps to the MusicXML `pizzicato` attribute.
    public let isPizzicato: Bool?

    /// Indicates that the sound takes place offset from the current score position.
    ///
    /// Maps to a nested MusicXML `<offset>` element.
    public let offset: MXLOffset?

    /// Deprecated in favor of the pan element in midi-instrument. Specifies placement of sound in a 3-D space
    /// relative to the listener, in degrees.
    ///
    /// Maps to the MusicXML `pan` attribute.
    public let pan: MXLRotationDegrees?

    /// Names a segno sign for a backward jump, used to distinguish between multiple jumps.
    ///
    /// Maps to the MusicXML `segno` attribute.
    public let segno: String?

    /// Controls playback of the soft pedal. A numeric value from 0 to 100 may be used for half pedaling.
    ///
    /// Maps to the MusicXML `soft-pedal` attribute.
    public let softPedal: MXLYesNoNumber?

    /// Controls playback of the sostenuto pedal. A numeric value from 0 to 100 may be used for half pedaling.
    ///
    /// Maps to the MusicXML `sostenuto-pedal` attribute.
    public let sostenutoPedal: MXLYesNoNumber?

    /// Specifies playback as swung rather than even notes.
    ///
    /// Maps to a nested MusicXML `<swing>` element.
    public let swing: MXLSwing?

    /// The tempo, expressed in quarter notes per minute. A value of `0` indicates the sound-generating program
    /// should prompt the user when compiling a sound file.
    ///
    /// Maps to the MusicXML `tempo` attribute.
    public let tempo: MXLNonNegativeDecimal?

    /// Indicates which times through a repeat this sound element applies to, if only particular times.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?

    /// Names the coda sign to jump forward to, used to distinguish between multiple jumps.
    ///
    /// Maps to the MusicXML `tocoda` attribute.
    public let tocoda: String?
}

// MARK: - Equatable

extension MXLSound: Equatable {
}

// MARK: - Hashable

extension MXLSound: Hashable {
}

// MARK: - Sendable

extension MXLSound: Sendable {
}
