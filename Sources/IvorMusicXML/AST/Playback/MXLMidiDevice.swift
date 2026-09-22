// © 2026 John Gary Pusey (see LICENSE.md)

/// The midi-device type corresponds to the DeviceName meta event in Standard MIDI Files. The optional port
/// attribute is a number from 1 to 16 that can be used with the unofficial MIDI 1.0 port (or cable) meta event.
/// Unlike the DeviceName meta event, there can be multiple midi-device elements per MusicXML part. The optional
/// id attribute refers to the score-instrument assigned to this device. If missing, the device assignment affects
/// all score-instrument elements in the score-part.
///
/// Maps the MusicXML `<midi-device>` element.
public struct MXLMidiDevice {

    // MARK: Public Initializers

    /// Creates a new `MXLMidiDevice`.
    ///
    /// - Parameter id:     The score-instrument assigned to this device. If missing, the device assignment affects all score-instrument elements in the score-part.
    /// - Parameter value:  The value of this element.
    /// - Parameter port:   The MIDI 1.0 port (or cable) number, from 1 to 16, for use with the unofficial MIDI 1.0 port meta event.
    public init(id: String? = nil,
                value: String,
                port: MXLMidi16? = nil) {
        self.id = id
        self.port = port
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The score-instrument assigned to this device. If missing, the device assignment affects all score-instrument
    /// elements in the score-part.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The MIDI 1.0 port (or cable) number, from 1 to 16, for use with the unofficial MIDI 1.0 port meta event.
    ///
    /// Maps to the MusicXML `port` attribute.
    public let port: MXLMidi16?

    /// The value of this element.
    public let value: String
}

// MARK: - Equatable

extension MXLMidiDevice: Equatable {
}

// MARK: - Hashable

extension MXLMidiDevice: Hashable {
}

// MARK: - Sendable

extension MXLMidiDevice: Sendable {
}
