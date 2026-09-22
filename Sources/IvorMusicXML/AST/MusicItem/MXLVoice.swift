// © 2026 John Gary Pusey (see LICENSE.md)

/// A voice is a sequence of musical events (e.g. notes, chords, rests) that proceeds linearly in time. The voice
/// element is used to distinguish between multiple voices in individual parts. It is defined within a group due
/// to its multiple uses within the MusicXML schema.
///
/// Maps the MusicXML `<voice>` element.
public struct MXLVoice {

    // MARK: Public Initializers

    /// Creates a new `MXLVoice`.
    ///
    /// - Parameter voice: The identifier distinguishing this voice from other voices in the same part.
    public init(voice: String) {
        self.voice = voice
    }

    // MARK: Public Instance Properties

    /// The identifier distinguishing this voice from other voices in the same part.
    public let voice: String
}

// MARK: - Equatable

extension MXLVoice: Equatable {
}

// MARK: - Hashable

extension MXLVoice: Hashable {
}

// MARK: - Sendable

extension MXLVoice: Sendable {
}
