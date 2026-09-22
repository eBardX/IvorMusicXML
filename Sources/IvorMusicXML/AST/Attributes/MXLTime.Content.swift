// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTime {

    /// One of the alternatives for Time.
    public enum Content {
        /// A senza-misura element explicitly indicates that no time signature is present. The optional element content
        /// indicates the symbol to be used, if any, such as an X. The time element’s symbol attribute is not used when a
        /// senza-misura element is present.
        case senzaMisura(String)

        /// The `time-signature` alternative.
        case timeSignature(_ timeSignature: [MXLTimeSignature], interchangeable: MXLInterchangeable?)
    }
}

// MARK: - Equatable

extension MXLTime.Content: Equatable {
}

// MARK: - Hashable

extension MXLTime.Content: Hashable {
}

// MARK: - Sendable

extension MXLTime.Content: Sendable {
}
