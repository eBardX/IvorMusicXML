// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLStaffDetails {

    /// The number of lines on the staff, and per-line appearance details, for non-5-line staves.
    public struct Group {

        // MARK: Public Initializers

        /// Creates a new `MXLStaffDetails.Group`.
        ///
        /// - Parameter staffLines: The staff-lines element specifies the number of lines and is usually used for a non 5-line staff. If the staff-lines element is present, the appearance of each line may be individually specified with a line-detail element.
        /// - Parameter lineDetail: Specifies the appearance of each line individually, when present.
        public init(staffLines: Int,
                    lineDetail: [MXLLineDetail] = []) {
            self.lineDetail = lineDetail
            self.staffLines = staffLines
        }

        // MARK: Public Instance Properties

        /// Specifies the appearance of each line individually, when present.
        ///
        /// Maps to nested MusicXML `<line-detail>` elements.
        public let lineDetail: [MXLLineDetail]

        /// The staff-lines element specifies the number of lines and is usually used for a non 5-line staff. If the
        /// staff-lines element is present, the appearance of each line may be individually specified with a line-detail
        /// element.
        ///
        /// Maps to a nested MusicXML `<staff-lines>` element.
        public let staffLines: Int
    }
}

// MARK: - Equatable

extension MXLStaffDetails.Group: Equatable {
}

// MARK: - Hashable

extension MXLStaffDetails.Group: Hashable {
}

// MARK: - Sendable

extension MXLStaffDetails.Group: Sendable {
}
