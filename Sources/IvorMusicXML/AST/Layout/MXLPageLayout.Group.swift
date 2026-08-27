// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLPageLayout {

    /// The height and width of the page, in tenths.
    public struct Group {

        // MARK: Public Initializers

        /// Creates a new `MXLPageLayout.Group`.
        ///
        /// - Parameter pageHeight:  The height of the page, in tenths.
        /// - Parameter pageWidth:   The width of the page, in tenths.
        public init(pageHeight: MXLTenths,
                    pageWidth: MXLTenths) {
            self.pageHeight = pageHeight
            self.pageWidth = pageWidth
        }

        // MARK: Public Instance Properties

        /// The height of the page, in tenths.
        ///
        /// Maps to a nested MusicXML `<page-height>` element.
        public let pageHeight: MXLTenths

        /// The width of the page, in tenths.
        ///
        /// Maps to a nested MusicXML `<page-width>` element.
        public let pageWidth: MXLTenths
    }
}

// MARK: - Equatable

extension MXLPageLayout.Group: Equatable {
}

// MARK: - Hashable

extension MXLPageLayout.Group: Hashable {
}

// MARK: - Sendable

extension MXLPageLayout.Group: Sendable {
}
