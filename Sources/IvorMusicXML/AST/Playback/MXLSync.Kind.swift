// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLSync {

    /// The sync-type type specifies the style that a score following application should use to synchronize an
    /// accompaniment with a performer. The none type indicates no synchronization to the performer. The tempo type
    /// indicates synchronization based on the performer tempo rather than individual events in the score. The event
    /// type indicates synchronization by following the performance of individual events in the score rather than
    /// the performer tempo. The mostly-tempo and mostly-event types combine these two approaches, with mostly-tempo
    /// giving more weight to tempo and mostly-event giving more weight to performed events. The always-event type
    /// provides the strictest synchronization by not being forgiving of missing performed events.
    public enum Kind {

        /// The strictest synchronization, not forgiving of missing performed events.
        case alwaysEvent

        /// Synchronization by following the performance of individual events in the score.
        case event

        /// A combination of tempo and event synchronization, giving more weight to performed events.
        case mostlyEvent

        /// A combination of tempo and event synchronization, giving more weight to tempo.
        case mostlyTempo

        /// Synchronization based on the performer tempo rather than individual events in the score.
        case tempo

        /// No synchronization to the performer.
        case unsynchronized
    }
}

// MARK: - Equatable

extension MXLSync.Kind: Equatable {
}

// MARK: - Hashable

extension MXLSync.Kind: Hashable {
}

// MARK: - Sendable

extension MXLSync.Kind: Sendable {
}
