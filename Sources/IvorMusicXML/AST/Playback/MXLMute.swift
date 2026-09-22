// © 2026 John Gary Pusey (see LICENSE.md)

/// The mute type represents muting for different instruments, including brass, winds, and strings. The on and off
/// values are used for undifferentiated mutes. The remaining values represent specific mutes.
///
/// Maps the MusicXML `<mute>` element.
public enum MXLMute {

    /// A bucket mute.
    case bucket

    /// A cup mute.
    case cup

    /// An echo mute.
    case echo

    /// A harmon mute with the stem removed.
    case harmonNoStem

    /// A harmon mute with the stem in place.
    case harmonStem

    /// A hat mute.
    case hat

    /// An undifferentiated mute, turned off.
    case off

    /// An undifferentiated mute, turned on.
    case on

    /// A palm mute.
    case palm

    /// A plunger mute.
    case plunger

    /// A practice mute.
    case practice

    /// A solotone mute.
    case solotone

    /// A hand-stopped mute.
    case stopHand

    /// A stop mute.
    case stopMute

    /// A straight mute.
    case straight
}

// MARK: - Equatable

extension MXLMute: Equatable {
}

// MARK: - Hashable

extension MXLMute: Hashable {
}

// MARK: - Sendable

extension MXLMute: Sendable {
}
