// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLHole {

    /// The hole-closed type represents whether the hole is closed, open, or half-open. The optional location
    /// attribute indicates which portion of the hole is filled in when the element value is half.
    ///
    /// Maps the MusicXML `<hole-closed>` element.
    public struct Closed {

        // MARK: Public Initializers

        /// Creates a new `MXLHole.Closed`.
        ///
        /// - Parameter value:     The value of this element.
        /// - Parameter location:  Indicates which portion of the hole is filled in when the value is half.
        public init(value: MXLHole.Closed.Value,
                    location: MXLHole.Closed.Location? = nil) {
            self.location = location
            self.value = value
        }

        // MARK: Public Instance Properties

        /// Indicates which portion of the hole is filled in when the value is half.
        ///
        /// Maps to the MusicXML `location` attribute.
        public let location: MXLHole.Closed.Location?

        /// The value of this element.
        public let value: MXLHole.Closed.Value
    }
}

// MARK: - Equatable

extension MXLHole.Closed: Equatable {
}

// MARK: - Hashable

extension MXLHole.Closed: Hashable {
}

// MARK: - Sendable

extension MXLHole.Closed: Sendable {
}
