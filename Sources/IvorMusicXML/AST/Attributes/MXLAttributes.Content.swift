// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLAttributes {

    /// One of the alternatives for Attributes.
    public enum Content {
        /// The for-part element is used in a concert score to indicate the transposition for a transposed part created
        /// from that score. It is only used in score files that contain a concert-score element in the defaults. This
        /// allows concert scores with transposed parts to be represented in a single uncompressed MusicXML file.
        case forPart([MXLForPart])

        /// If the part is being encoded for a transposing instrument in written vs. concert pitch, the transposition must
        /// be encoded in the transpose element using the transpose type.
        case transpose([MXLTranspose])
    }
}

// MARK: - Equatable

extension MXLAttributes.Content: Equatable {
}

// MARK: - Hashable

extension MXLAttributes.Content: Hashable {
}

// MARK: - Sendable

extension MXLAttributes.Content: Sendable {
}
