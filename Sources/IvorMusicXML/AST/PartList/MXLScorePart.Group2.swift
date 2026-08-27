// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLScorePart {

    /// A single MIDI device and instrument assignment for a score-part.
    public struct Group2 {

        // MARK: Public Initializers

        /// Creates a new `MXLScorePart.Group2`.
        ///
        /// - Parameter midiDevice: The MIDI device assignment for this element.
        /// - Parameter midiInstrument: The MIDI instrument assignment for this element.
        public init(midiDevice: MXLMidiDevice? = nil,
                    midiInstrument: MXLMidiInstrument? = nil) {
            self.midiDevice = midiDevice
            self.midiInstrument = midiInstrument
        }

        // MARK: Public Instance Properties

        /// The MIDI device assignment for this element.
        public let midiDevice: MXLMidiDevice?

        /// The MIDI instrument assignment for this element.
        public let midiInstrument: MXLMidiInstrument?
    }
}

// MARK: - Equatable

extension MXLScorePart.Group2: Equatable {
}

// MARK: - Hashable

extension MXLScorePart.Group2: Hashable {
}

// MARK: - Sendable

extension MXLScorePart.Group2: Sendable {
}
