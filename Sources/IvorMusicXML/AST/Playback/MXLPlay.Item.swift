// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPlay {

    /// One of the alternatives for Play.
    public enum Item {
        /// The ipa element represents International Phonetic Alphabet (IPA) sounds for vocal music. String content is
        /// limited to IPA 2015 symbols represented in Unicode 13.0.
        case ipa(String)

        /// The mute element represents muting for stringed instruments.
        case mute(MXLMute)

        /// The other-play element represents other types of playback.
        case otherPlay(MXLOtherPlay)

        /// The semi-pitched element represents categories of indefinite pitch for percussion instruments.
        case semiPitched(MXLSemiPitched)
    }
}

// MARK: - Equatable

extension MXLPlay.Item: Equatable {
}

// MARK: - Hashable

extension MXLPlay.Item: Hashable {
}

// MARK: - Sendable

extension MXLPlay.Item: Sendable {
}
