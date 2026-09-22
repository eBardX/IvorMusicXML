// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLOpus {

    /// The score elements provide the links to the individual scores within an opus. The new-page attribute, added in
    /// Version 2.0, is used to indicate if the first page of the score is different than the last page of the
    /// previous score. If new-page is “yes”, then a different page is used; if “no”, then the same page is used. The
    /// default value is implementation-dependent.
    ///
    /// Maps the MusicXML `<score>` element.
    public struct Score {

        // MARK: Public Initializers

        /// Creates a new `MXLOpus.Score`.
        ///
        /// - Parameter newPage: A Boolean value indicating whether the first page of the score is different from the last page of the previous score. The default value is implementation-dependent.
        /// - Parameter xlink: The link-attributes group includes all the simple XLink attributes supported in the MusicXML format. It is also used to connect a MusicXML score with MusicXML parts or a MusicXML opus.
        public init(newPage: Bool? = nil,
                    xlink: MXLXLink) {
            self.newPage = newPage
            self.xlink = xlink
        }

        // MARK: Public Instance Properties

        /// A Boolean value indicating whether the first page of the score is different from the last page of the
        /// previous score. The default value is implementation-dependent.
        ///
        /// Maps to the MusicXML `new-page` attribute.
        public let newPage: Bool?

        /// The link-attributes group includes all the simple XLink attributes supported in the MusicXML format. It is
        /// also used to connect a MusicXML score with MusicXML parts or a MusicXML opus.
        public let xlink: MXLXLink
    }
}

// MARK: - Equatable

extension MXLOpus.Score: Equatable {
}

// MARK: - Hashable

extension MXLOpus.Score: Hashable {
}

// MARK: - Sendable

extension MXLOpus.Score: Sendable {
}
