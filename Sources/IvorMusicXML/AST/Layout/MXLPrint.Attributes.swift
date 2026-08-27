// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPrint {

    /// The print-attributes group is used by the print element. The new-system and new-page attributes indicate
    /// whether to force a system or page break, or to force the current music onto the same system or page as the
    /// preceding music. Normally this is the first music data within a measure. If used in multi-part music, they
    /// should be placed in the same positions within each part, or the results are undefined. The page-number
    /// attribute sets the number of a new page; it is ignored if new-page is not “yes”. Version 2.0 adds a blank-page
    /// attribute. This is a positive integer value that specifies the number of blank pages to insert before the
    /// current measure. It is ignored if new-page is not “yes”. These blank pages have no music, but may have text or
    /// images specified by the credit element. This is used to allow a combination of pages that are all text, or all
    /// text and images, together with pages of music.
    ///
    /// The staff-spacing attribute specifies spacing between multiple staves in tenths of staff space. This is
    /// deprecated as of Version 1.1; the staff-layout element should be used instead. If both are present, the staff-
    /// layout values take priority.
    public struct Attributes {

        // MARK: Public Initializers

        /// Creates a new `MXLPrint.Attributes`.
        ///
        /// - Parameter staffSpacing:     The spacing between multiple staves, in tenths of staff space. Deprecated as of Version 1.1 in favor of the staff-layout element; if both are present, the staff-layout values take priority.
        /// - Parameter startsNewSystem:  A Boolean value indicating whether to force a system break, or to force the current music onto the same system as the preceding music, normally the first music data within a measure. In multi-part music this should be placed in the same position within each part, or the results are undefined.
        /// - Parameter startsNewPage:    A Boolean value indicating whether to force a page break, or to force the current music onto the same page as the preceding music, normally the first music data within a measure. In multi-part music this should be placed in the same position within each part, or the results are undefined.
        /// - Parameter blankPage:        The number of blank pages to insert before the current measure. Ignored if `newPage` is not `true`. Blank pages have no music, but may have text or images specified by the credit element.
        /// - Parameter pageNumber:       The number of a new page. Ignored if `newPage` is not `true`.
        public init(staffSpacing: MXLTenths? = nil,
                    startsNewSystem: Bool? = nil,
                    startsNewPage: Bool? = nil,
                    blankPage: Int? = nil,
                    pageNumber: String? = nil) {
            self.blankPage = blankPage
            self.startsNewPage = startsNewPage
            self.startsNewSystem = startsNewSystem
            self.pageNumber = pageNumber
            self.staffSpacing = staffSpacing
        }

        // MARK: Public Instance Properties

        /// The number of blank pages to insert before the current measure. Ignored if `newPage` is not `true`. Blank
        /// pages have no music, but may have text or images specified by the credit element.
        ///
        /// Maps to the MusicXML `blank-page` attribute.
        public let blankPage: Int?

        /// The number of a new page. Ignored if `newPage` is not `true`.
        ///
        /// Maps to the MusicXML `page-number` attribute.
        public let pageNumber: String?

        /// The spacing between multiple staves, in tenths of staff space. Deprecated as of Version 1.1 in favor of
        /// the staff-layout element; if both are present, the staff-layout values take priority.
        ///
        /// Maps to the MusicXML `staff-spacing` attribute.
        public let staffSpacing: MXLTenths?

        /// A Boolean value indicating whether to force a page break, or to force the current music onto the same
        /// page as the preceding music, normally the first music data within a measure. In multi-part music this
        /// should be placed in the same position within each part, or the results are undefined.
        ///
        /// Maps to the MusicXML `new-page` attribute.
        public let startsNewPage: Bool?

        /// A Boolean value indicating whether to force a system break, or to force the current music onto the same
        /// system as the preceding music, normally the first music data within a measure. In multi-part music this
        /// should be placed in the same position within each part, or the results are undefined.
        ///
        /// Maps to the MusicXML `new-system` attribute.
        public let startsNewSystem: Bool?
    }
}

// MARK: - Equatable

extension MXLPrint.Attributes: Equatable {
}

// MARK: - Hashable

extension MXLPrint.Attributes: Hashable {
}

// MARK: - Sendable

extension MXLPrint.Attributes: Sendable {
}
