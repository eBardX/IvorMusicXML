// © 2026 John Gary Pusey (see LICENSE.md)

/// The midi-instrument type defines MIDI 1.0 instrument playback. The midi-instrument element can be a part of
/// either the score-instrument element at the start of a part, or the sound element within a part. The id
/// attribute refers to the score-instrument affected by the change.
///
/// Maps the MusicXML `<midi-instrument>` element.
public struct MXLMidiInstrument {

    // MARK: Public Initializers

    /// Creates a new `MXLMidiInstrument`.
    ///
    /// - Parameter id:             The score-instrument affected by the change.
    /// - Parameter midiChannel:    The midi-channel element specifies a MIDI 1.0 channel number ranging from 1 to 16.
    /// - Parameter midiName:       The midi-name element corresponds to a ProgramName meta-event within a Standard MIDI File.
    /// - Parameter midiBank:       The midi-bank element specifies a MIDI 1.0 bank number ranging from 1 to 16,384.
    /// - Parameter midiProgram:    The midi-program element specifies a MIDI 1.0 program number ranging from 1 to 128.
    /// - Parameter midiUnpitched:  For unpitched instruments, the midi-unpitched element specifies a MIDI 1.0 note number ranging from 1 to 128. It is usually used with MIDI banks for percussion. Note that MIDI 1.0 note numbers are generally specified from 0 to 127 rather than the 1 to 128 numbering used in this element.
    /// - Parameter volume:         The volume element value is a percentage of the maximum ranging from 0 to 100, with decimal values allowed. This corresponds to a scaling value for the MIDI 1.0 channel volume controller.
    /// - Parameter pan:            The pan and elevation elements allow placing of sound in a 3-D space relative to the listener. Both are expressed in degrees ranging from -180 to 180. For pan, 0 is straight ahead, -90 is hard left, 90 is hard right, and -180 and 180 are directly behind the listener.
    /// - Parameter elevation:      The elevation and pan elements allow placing of sound in a 3-D space relative to the listener. Both are expressed in degrees ranging from -180 to 180. For elevation, 0 is level with the listener, 90 is directly above, and -90 is directly below.
    public init(id: String,
                midiChannel: MXLMidi16? = nil,
                midiName: String? = nil,
                midiBank: MXLMidi16384? = nil,
                midiProgram: MXLMidi128? = nil,
                midiUnpitched: MXLMidi128? = nil,
                volume: MXLPercent? = nil,
                pan: MXLRotationDegrees? = nil,
                elevation: MXLRotationDegrees? = nil) {
        self.elevation = elevation
        self.id = id
        self.midiBank = midiBank
        self.midiChannel = midiChannel
        self.midiName = midiName
        self.midiProgram = midiProgram
        self.midiUnpitched = midiUnpitched
        self.pan = pan
        self.volume = volume
    }

    // MARK: Public Instance Properties

    /// The elevation and pan elements allow placing of sound in a 3-D space relative to the listener. Both are
    /// expressed in degrees ranging from -180 to 180. For elevation, 0 is level with the listener, 90 is directly
    /// above, and -90 is directly below.
    ///
    /// Maps to a nested MusicXML `<elevation>` element.
    public let elevation: MXLRotationDegrees?

    /// The score-instrument affected by the change.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String

    /// The midi-bank element specifies a MIDI 1.0 bank number ranging from 1 to 16,384.
    ///
    /// Maps to a nested MusicXML `<midi-bank>` element.
    public let midiBank: MXLMidi16384?

    /// The midi-channel element specifies a MIDI 1.0 channel number ranging from 1 to 16.
    ///
    /// Maps to a nested MusicXML `<midi-channel>` element.
    public let midiChannel: MXLMidi16?

    /// The midi-name element corresponds to a ProgramName meta-event within a Standard MIDI File.
    ///
    /// Maps to a nested MusicXML `<midi-name>` element.
    public let midiName: String?

    /// The midi-program element specifies a MIDI 1.0 program number ranging from 1 to 128.
    ///
    /// Maps to a nested MusicXML `<midi-program>` element.
    public let midiProgram: MXLMidi128?

    /// For unpitched instruments, the midi-unpitched element specifies a MIDI 1.0 note number ranging from 1 to 128.
    /// It is usually used with MIDI banks for percussion. Note that MIDI 1.0 note numbers are generally specified
    /// from 0 to 127 rather than the 1 to 128 numbering used in this element.
    ///
    /// Maps to a nested MusicXML `<midi-unpitched>` element.
    public let midiUnpitched: MXLMidi128?

    /// The pan and elevation elements allow placing of sound in a 3-D space relative to the listener. Both are
    /// expressed in degrees ranging from -180 to 180. For pan, 0 is straight ahead, -90 is hard left, 90 is hard
    /// right, and -180 and 180 are directly behind the listener.
    ///
    /// Maps to a nested MusicXML `<pan>` element.
    public let pan: MXLRotationDegrees?

    /// The volume element value is a percentage of the maximum ranging from 0 to 100, with decimal values allowed.
    /// This corresponds to a scaling value for the MIDI 1.0 channel volume controller.
    ///
    /// Maps to a nested MusicXML `<volume>` element.
    public let volume: MXLPercent?
}

// MARK: - Equatable

extension MXLMidiInstrument: Equatable {
}

// MARK: - Hashable

extension MXLMidiInstrument: Hashable {
}

// MARK: - Sendable

extension MXLMidiInstrument: Sendable {
}
