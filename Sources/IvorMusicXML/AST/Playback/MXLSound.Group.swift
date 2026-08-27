// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLSound {

    /// A grouping of instrument changes, MIDI device and instrument assignments, and playback techniques
    /// associated with a single instrument within a sound element.
    public struct Group {

        // MARK: Public Initializers

        /// Creates a new `MXLSound.Group`.
        ///
        /// - Parameter instrumentChange:  A change to the instrument used for playback.
        /// - Parameter midiDevice:        The MIDI device assignment.
        /// - Parameter midiInstrument:    The MIDI instrument assignment.
        /// - Parameter play:              Playback techniques to be used.
        public init(instrumentChange: MXLInstrumentChange? = nil,
                    midiDevice: MXLMidiDevice? = nil,
                    midiInstrument: MXLMidiInstrument? = nil,
                    play: MXLPlay? = nil) {
            self.instrumentChange = instrumentChange
            self.midiDevice = midiDevice
            self.midiInstrument = midiInstrument
            self.play = play
        }

        // MARK: Public Instance Properties

        /// A change to the instrument used for playback.
        public let instrumentChange: MXLInstrumentChange?

        /// The MIDI device assignment.
        public let midiDevice: MXLMidiDevice?

        /// The MIDI instrument assignment.
        public let midiInstrument: MXLMidiInstrument?

        /// Playback techniques to be used.
        public let play: MXLPlay?
    }
}

// MARK: - Equatable

extension MXLSound.Group: Equatable {
}

// MARK: - Hashable

extension MXLSound.Group: Hashable {
}

// MARK: - Sendable

extension MXLSound.Group: Sendable {
}
