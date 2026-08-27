// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLListen {

    /// One of the alternatives for Listen.
    public enum Item {
        /// The assess element overrides the default assessment of a note for a score following or machine
        /// listening application.
        case assess(MXLAssess)

        /// Other types of listening control and interaction not otherwise represented in this enumeration.
        case otherListen(MXLOtherListening)

        /// A point where the accompaniment should wait for a performer event before continuing.
        case wait(MXLWait)
    }
}

// MARK: - Equatable

extension MXLListen.Item: Equatable {
}

// MARK: - Hashable

extension MXLListen.Item: Hashable {
}

// MARK: - Sendable

extension MXLListen.Item: Sendable {
}
