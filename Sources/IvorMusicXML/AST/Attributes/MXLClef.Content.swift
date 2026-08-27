// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLClef {

    /// Clefs are represented by a combination of sign, line, and clef-octave-change elements.
    ///
    /// Maps the MusicXML `<clef>` and `<part-clef>` elements.
    public struct Content {

        // MARK: Public Initializers

        /// Creates a new `MXLClef.Content`.
        ///
        /// - Parameter sign: The sign element represents the clef symbol.
        /// - Parameter line: Line numbers are counted from the bottom of the staff. They are only needed with the G, F, and C signs in order to position a pitch correctly on the staff. Standard values are 2 for the G sign (treble clef), 4 for the F sign (bass clef), and 3 for the C sign (alto clef). Line values can be used to specify positions outside the staff, such as a C clef positioned in the middle of a grand staff.
        /// - Parameter octaveChange: The clef-octave-change element is used for transposing clefs. A treble clef for tenors would have a value of -1.
        public init(sign: Sign,
                    line: MXLStaffLinePosition? = nil,
                    octaveChange: MXLOctaveChange? = nil) {
            self.line = line
            self.octaveChange = octaveChange
            self.sign = sign
        }

        // MARK: Public Instance Properties

        /// Line numbers are counted from the bottom of the staff. They are only needed with the G, F, and C signs in
        /// order to position a pitch correctly on the staff. Standard values are 2 for the G sign (treble clef), 4 for
        /// the F sign (bass clef), and 3 for the C sign (alto clef). Line values can be used to specify positions outside
        /// the staff, such as a C clef positioned in the middle of a grand staff.
        ///
        /// Maps to a nested MusicXML `<line>` element.
        public let line: MXLStaffLinePosition?

        /// The clef-octave-change element is used for transposing clefs. A treble clef for tenors would have a value
        /// of -1.
        ///
        /// Maps to a nested MusicXML `<clef-octave-change>` element.
        public let octaveChange: MXLOctaveChange?

        /// The sign element represents the clef symbol.
        ///
        /// Maps to a nested MusicXML `<sign>` element.
        public let sign: Sign
    }
}

// MARK: - Equatable

extension MXLClef.Content: Equatable {
}

// MARK: - Hashable

extension MXLClef.Content: Hashable {
}

// MARK: - Sendable

extension MXLClef.Content: Sendable {
}
