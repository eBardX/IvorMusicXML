// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLVirtualInstrumentData {

    /// One of the alternatives for VirtualInstrumentData.
    public enum Content {
        /// The ensemble element is present if performance is intended by an ensemble such as an orchestral section. The
        /// associated value is the size of the section, or `nil` if the ensemble size is not specified.
        case ensemble(Int?)

        /// The solo element is present if performance is intended by a solo instrument.
        case solo
    }
}

// MARK: - Equatable

extension MXLVirtualInstrumentData.Content: Equatable {
}

// MARK: - Hashable

extension MXLVirtualInstrumentData.Content: Hashable {
}

// MARK: - Sendable

extension MXLVirtualInstrumentData.Content: Sendable {
}
