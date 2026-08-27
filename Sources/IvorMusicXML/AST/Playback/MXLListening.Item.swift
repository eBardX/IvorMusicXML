// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLListening {

    /// One of the alternatives for Listening.
    public enum Item {
        /// Other types of listening control and interaction not otherwise represented in this enumeration.
        case otherListening(MXLOtherListening)

        /// The style that a score following application should use to synchronize an accompaniment with a
        /// performer.
        case sync(MXLSync)
    }
}

// MARK: - Equatable

extension MXLListening.Item: Equatable {
}

// MARK: - Hashable

extension MXLListening.Item: Hashable {
}

// MARK: - Sendable

extension MXLListening.Item: Sendable {
}
