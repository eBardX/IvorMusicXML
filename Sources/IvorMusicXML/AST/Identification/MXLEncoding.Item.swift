// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLEncoding {

    /// One of the alternatives for Encoding.
    public enum Item {
        /// The person or organization who did the digital encoding.
        case encoder(MXLTypedText)

        /// The date the digital encoding was done.
        case encodingDate(MXLYyyyMmDd)

        /// A free-form description of the encoding process.
        case encodingDescription(String)

        /// The name of the software used for the encoding.
        case software(String)

        /// Indicates whether a MusicXML encoding supports a particular MusicXML element, attribute, or value.
        case supports(MXLSupports)
    }
}

// MARK: - Equatable

extension MXLEncoding.Item: Equatable {
}

// MARK: - Hashable

extension MXLEncoding.Item: Hashable {
}

// MARK: - Sendable

extension MXLEncoding.Item: Sendable {
}
