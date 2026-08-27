// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLXLink {

    /// The xlink:actuate attribute, which is used to communicate the desired timing of traversal.
    public enum Actuate {

        /// Traversal should be initiated as soon as the ending resource is loaded.
        case onLoad

        /// Traversal should be initiated only on a post-loading event triggered for that purpose.
        case onRequest

        /// A timing behavior other than those listed here.
        case other

        /// No timing is communicated.
        case unspecified
    }
}

// MARK: - Equatable

extension MXLXLink.Actuate: Equatable {
}

// MARK: - Hashable

extension MXLXLink.Actuate: Hashable {
}

// MARK: - Sendable

extension MXLXLink.Actuate: Sendable {
}
