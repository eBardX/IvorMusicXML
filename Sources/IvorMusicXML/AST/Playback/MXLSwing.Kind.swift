// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLSwing {

    /// The swing-type-value type specifies the note type, either eighth or 16th, to which the ratio defined in the
    /// swing element is applied.
    ///
    /// Maps the MusicXML `<swing-type>` element.
    public enum Kind {

        /// The ratio applies to eighth notes.
        case eighth

        /// The ratio applies to 16th notes.
        case n16th
    }
}

// MARK: - Equatable

extension MXLSwing.Kind: Equatable {
}

// MARK: - Hashable

extension MXLSwing.Kind: Hashable {
}

// MARK: - Sendable

extension MXLSwing.Kind: Sendable {
}
