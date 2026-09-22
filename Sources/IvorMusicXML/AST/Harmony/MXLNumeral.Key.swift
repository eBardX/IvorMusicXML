// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNumeral {

    /// The numeral-key type is used when the key for the numeral is different than the key specified by the key
    /// signature. The numeral-fifths element specifies the key in the same way as the fifths element. The numeral-
    /// mode element specifies the mode similar to the mode element, but with a restricted set of values
    ///
    /// Maps the MusicXML `<numeral-key>` element.
    public struct Key {

        // MARK: Public Initializers

        /// Creates a new `MXLNumeral.Key`.
        ///
        /// - Parameter fifths: Specifies the key in the same way as the fifths element.
        /// - Parameter mode: Specifies the mode, similar to the mode element, but with a restricted set of values.
        /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
        public init(fifths: MXLFifths,
                    mode: Mode,
                    printsObject: Bool? = nil) {
            self.fifths = fifths
            self.mode = mode
            self.printsObject = printsObject
        }

        // MARK: Public Instance Properties

        /// Specifies the key in the same way as the fifths element.
        ///
        /// Maps to a nested MusicXML `<numeral-fifths>` element.
        public let fifths: MXLFifths

        /// Specifies the mode, similar to the mode element, but with a restricted set of values.
        ///
        /// Maps to a nested MusicXML `<numeral-mode>` element.
        public let mode: Mode

        /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
        /// specified.
        ///
        /// Maps to the MusicXML `print-object` attribute.
        public let printsObject: Bool?
    }
}

// MARK: - Equatable

extension MXLNumeral.Key: Equatable {
}

// MARK: - Hashable

extension MXLNumeral.Key: Hashable {
}

// MARK: - Sendable

extension MXLNumeral.Key: Sendable {
}
