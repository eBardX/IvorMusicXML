// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLCredit.Content {

    /// A group of credit-symbol and credit-words elements interspersed with link and bookmark elements, used to
    /// represent an alternating sequence of credit content within a single credit element.
    public struct AlternativeGroup {

        // MARK: Public Initializers

        /// Creates a new `MXLCredit.Content.AlternativeGroup`.
        ///
        /// - Parameter link:  The link elements interspersed within the alternating credit content.
        /// - Parameter bookmark:  The bookmark elements interspersed within the alternating credit content.
        /// - Parameter content: One of the alternatives for AlternativeGroup.
        public init(link: [MXLLink] = [],
                    bookmark: [MXLBookmark] = [],
                    content: Content) {
            self.bookmark = bookmark
            self.content = content
            self.link = link
        }

        // MARK: Public Instance Properties

        /// The bookmark elements interspersed within the alternating credit content.
        public let bookmark: [MXLBookmark]

        /// One of the alternatives for AlternativeGroup.
        public let content: Content

        /// The link elements interspersed within the alternating credit content.
        public let link: [MXLLink]
    }
}

// MARK: - Equatable

extension MXLCredit.Content.AlternativeGroup: Equatable {
}

// MARK: - Hashable

extension MXLCredit.Content.AlternativeGroup: Hashable {
}

// MARK: - Sendable

extension MXLCredit.Content.AlternativeGroup: Sendable {
}
