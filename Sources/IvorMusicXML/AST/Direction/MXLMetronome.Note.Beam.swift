// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiTools

extension MXLMetronome.Note {

    /// The metronome-beam type works like the beam type in defining metric relationships, but does not include all
    /// the attributes available in the beam type.
    ///
    /// Maps the MusicXML `<metronome-beam>` element.
    public struct Beam {

        // MARK: Public Initializers

        /// Creates a new `MXLMetronome.Note.Beam`.
        ///
        /// - Parameter value: The value of this element.
        /// - Parameter number: Defaults to `1`.
        public init(value: MXLBeamValue,
                    number: MXLBeamLevel? = nil) {
            self.number = number ?? 1
            self.value = value
        }

        // MARK: Public Instance Properties

        /// Defaults to `1`.
        ///
        /// Maps to the MusicXML `number` attribute.
        public let number: MXLBeamLevel

        /// The value of this element.
        public let value: MXLBeamValue
    }
}

// MARK: - Equatable

extension MXLMetronome.Note.Beam: Equatable {
}

// MARK: - Hashable

extension MXLMetronome.Note.Beam: Hashable {
}

// MARK: - Sendable

extension MXLMetronome.Note.Beam: Sendable {
}
