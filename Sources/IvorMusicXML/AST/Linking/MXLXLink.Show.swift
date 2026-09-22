// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLXLink {

    /// The xlink:show attribute, which is used to communicate the desired presentation of the ending resource on
    /// traversal.
    public enum Show {

        /// The ending resource should be embedded within the presentation of the starting resource.
        case embed

        /// The ending resource should be loaded into a new window, frame, pane, or other presentation context.
        case new

        /// A presentation behavior other than those listed here.
        case other

        /// The ending resource should be loaded in the same window, frame, pane, or other presentation context
        /// as the starting resource.
        case replace

        /// The behavior of applying traversal is undefined by XLink.
        case undefined
    }
}

// MARK: - Equatable

extension MXLXLink.Show: Equatable {
}

// MARK: - Hashable

extension MXLXLink.Show: Hashable {
}

// MARK: - Sendable

extension MXLXLink.Show: Sendable {
}
