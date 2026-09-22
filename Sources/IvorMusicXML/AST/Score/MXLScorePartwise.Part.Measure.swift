// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLScorePartwise.Part {

    /// Maps the MusicXML `<measure>` element.
    public struct Measure {

        // MARK: Public Initializers

        /// Creates a new `MXLScorePartwise.Part.Measure`.
        ///
        /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
        /// - Parameter number:          The measure number. In partwise files, this should be the same for measures in different parts that share the same left barline. Often numeric, but not required to be; non-numeric values are typically combined with `implicit` or `nonControlling` set to `true`. For a pickup measure, this is typically `"0"` with `implicit` set to `true`.
        /// - Parameter isImplicit:        A Boolean value indicating whether the measure number should never appear, such as for pickup measures and the last half of mid-measure repeats. Defaults to `false` if not specified.
        /// - Parameter isNonControlling:  A Boolean value indicating whether the left barline in this measure does not coincide with the left barline of measures in other parts, as in multimetric music like the Don Giovanni minuet. Defaults to `false` if not specified.
        /// - Parameter text:            The displayed measure number, when different from the value of `number`. Ignored when `implicit` is `true`.
        /// - Parameter width:           The width of the measure, in tenths, from barline or system start to barline or system end. These are the global tenths defined by the scaling element, not local tenths as modified by the staff-size element.
        /// - Parameter items: The music-data group that contains the basic musical data associated with this measure.
        public init(id: String? = nil,
                    number: String,
                    isImplicit: Bool? = nil,
                    isNonControlling: Bool? = nil,
                    text: MXLMeasureText? = nil,
                    width: MXLTenths? = nil,
                    items: [MXLMusicItem] = []) {
            self.id = id
            self.isImplicit = isImplicit ?? false
            self.isNonControlling = isNonControlling ?? false
            self.items = items
            self.number = number
            self.text = text
            self.width = width
        }

        // MARK: Public Instance Properties

        /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
        /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
        /// specifies an id reference.
        ///
        /// Maps to the MusicXML `id` attribute.
        public let id: String?

        /// A Boolean value indicating whether the measure number should never appear, such as for pickup measures and
        /// the last half of mid-measure repeats. Defaults to `false` if not specified.
        ///
        /// Maps to the MusicXML `implicit` attribute.
        public let isImplicit: Bool

        /// A Boolean value indicating whether the left barline in this measure does not coincide with the left barline
        /// of measures in other parts, as in multimetric music like the Don Giovanni minuet. Defaults to `false` if not
        /// specified.
        ///
        /// Maps to the MusicXML `non-controlling` attribute.
        public let isNonControlling: Bool

        /// The music-data group contains the basic musical data that is either associated with a part or a measure,
        /// depending on whether the partwise or timewise hierarchy is used.
        public let items: [MXLMusicItem]

        /// The measure number. In partwise files, this should be the same for measures in different parts that share
        /// the same left barline. Often numeric, but not required to be; non-numeric values are typically combined with
        /// `implicit` or `nonControlling` set to `true`. For a pickup measure, this is typically `"0"` with `implicit`
        /// set to `true`.
        ///
        /// Maps to the MusicXML `number` attribute.
        public let number: String

        /// The displayed measure number, when different from the value of `number`. Ignored when `implicit` is `true`.
        ///
        /// Maps to the MusicXML `text` attribute.
        public let text: MXLMeasureText?

        /// The width of the measure, in tenths, from barline or system start to barline or system end. These are the
        /// global tenths defined by the scaling element, not local tenths as modified by the staff-size element.
        ///
        /// Maps to the MusicXML `width` attribute.
        public let width: MXLTenths?
    }
}

// MARK: - Equatable

extension MXLScorePartwise.Part.Measure: Equatable {
}

// MARK: - Hashable

extension MXLScorePartwise.Part.Measure: Hashable {
}

// MARK: - Sendable

extension MXLScorePartwise.Part.Measure: Sendable {
}
