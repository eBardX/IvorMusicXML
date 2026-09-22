// © 2026 John Gary Pusey (see LICENSE.md)

/// The virtual-instrument element defines a specific virtual instrument used for an instrument sound.
///
/// Maps the MusicXML `<virtual-instrument>` element.
public struct MXLVirtualInstrument {

    // MARK: Public Initializers

    /// Creates a new `MXLVirtualInstrument`.
    ///
    /// - Parameter virtualLibrary:  The virtual-library element indicates the virtual instrument library name.
    /// - Parameter virtualName:     The virtual-name element indicates the library-specific name for the virtual instrument.
    public init(virtualLibrary: String? = nil,
                virtualName: String? = nil) {
        self.virtualLibrary = virtualLibrary
        self.virtualName = virtualName
    }

    // MARK: Public Instance Properties

    /// The virtual-library element indicates the virtual instrument library name.
    ///
    /// Maps to a nested MusicXML `<virtual-library>` element.
    public let virtualLibrary: String?

    /// The virtual-name element indicates the library-specific name for the virtual instrument.
    ///
    /// Maps to a nested MusicXML `<virtual-name>` element.
    public let virtualName: String?
}

// MARK: - Equatable

extension MXLVirtualInstrument: Equatable {
}

// MARK: - Hashable

extension MXLVirtualInstrument: Hashable {
}

// MARK: - Sendable

extension MXLVirtualInstrument: Sendable {
}
