// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// The duration type of a grace note.
public enum MXLGraceDuration {
    /// A grace note that makes additional time, with the specified amount of
    /// real-time divisions.
    case makeTime(Float)

    /// A grace note that steals time from the following note, with the
    /// specified percentage of that note’s time.
    case stealTimeFollowing(Float)

    /// A grace note that steals time from the previous note, with the specified
    /// percentage of that note’s time.
    case stealTimePrevious(Float)

    /// A grace note with an unspecified duration.
    case unspecified
}

// MARK: - Sendable

extension MXLGraceDuration: Sendable {
}
