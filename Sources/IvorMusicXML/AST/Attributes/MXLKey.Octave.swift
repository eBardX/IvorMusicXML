// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLKey {

    /// The key-octave type specifies in which octave an element of a key signature appears. The content specifies the
    /// octave value using the same values as the display-octave element. The number attribute is a positive integer
    /// that refers to the key signature element in left-to-right order. If the cancel attribute is set to yes, then
    /// this number refers to the canceling key signature specified by the cancel element in the parent key element.
    /// The cancel attribute cannot be set to yes if there is no corresponding cancel element within the parent key
    /// element. It is no by default.
    ///
    /// Maps the MusicXML `<key-octave>` element.
    public struct Octave {

        // MARK: Public Initializers

        /// Creates a new `MXLKey.Octave`.
        ///
        /// - Parameter value: The value of this element.
        /// - Parameter number: A positive integer that refers to the key signature element in left-to-right order.
        /// - Parameter isCancelling: A Boolean value indicating whether this number refers to the canceling key signature specified by the cancel element in the parent key element, rather than to the new key signature. Cannot be `true` if there is no corresponding cancel element within the parent key element.
        public init(value: Int,
                    number: Int,
                    isCancelling: Bool? = nil) {
            self.isCancelling = isCancelling
            self.number = number
            self.value = value
        }

        // MARK: Public Instance Properties

        /// A Boolean value indicating whether this number refers to the canceling key signature specified by the
        /// cancel element in the parent key element, rather than to the new key signature. Cannot be `true` if there
        /// is no corresponding cancel element within the parent key element.
        ///
        /// Maps to the MusicXML `cancel` attribute.
        public let isCancelling: Bool?

        /// A positive integer that refers to the key signature element in left-to-right order.
        ///
        /// Maps to the MusicXML `number` attribute.
        public let number: Int

        /// The value of this element.
        public let value: Int
    }
}

// MARK: - Equatable

extension MXLKey.Octave: Equatable {
}

// MARK: - Hashable

extension MXLKey.Octave: Hashable {
}

// MARK: - Sendable

extension MXLKey.Octave: Sendable {
}
