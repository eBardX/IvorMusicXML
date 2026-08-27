// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLBend {

    /// One of the alternatives for Bend.
    public enum Content {
        /// The pre-bend element indicates that a bend is a pre-bend rather than a normal bend or a release.
        case preBend

        /// The release element indicates that a bend is a release rather than a normal bend or a pre-bend.
        case release(MXLRelease)
    }
}

// MARK: - Equatable

extension MXLBend.Content: Equatable {
}

// MARK: - Hashable

extension MXLBend.Content: Hashable {
}

// MARK: - Sendable

extension MXLBend.Content: Sendable {
}
