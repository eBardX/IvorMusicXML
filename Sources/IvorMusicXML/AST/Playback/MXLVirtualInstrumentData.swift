// © 2026 John Gary Pusey (see LICENSE.md)

/// Virtual instrument data can be part of either the score-instrument element at the start of a part, or an
/// instrument-change element within a part.
public struct MXLVirtualInstrumentData {

    // MARK: Public Initializers

    /// Creates a new `MXLVirtualInstrumentData`.
    ///
    /// - Parameter instrumentSound:    The instrument-sound element describes the default timbre of the score-instrument. This description is independent of a particular virtual or MIDI instrument specification and allows playback to be shared more easily between applications and libraries.
    /// - Parameter content:            One of the alternatives for VirtualInstrumentData.
    /// - Parameter virtualInstrument:  The specific virtual instrument used for the instrument sound.
    public init(instrumentSound: String? = nil,
                content: Content? = nil,
                virtualInstrument: MXLVirtualInstrument? = nil) {
        self.content = content
        self.instrumentSound = instrumentSound
        self.virtualInstrument = virtualInstrument
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for VirtualInstrumentData.
    public let content: Content?

    /// The instrument-sound element describes the default timbre of the score-instrument. This description is
    /// independent of a particular virtual or MIDI instrument specification and allows playback to be shared more
    /// easily between applications and libraries.
    ///
    /// Maps to a nested MusicXML `<instrument-sound>` element.
    public let instrumentSound: String?

    /// The specific virtual instrument used for the instrument sound.
    ///
    /// Maps to a nested MusicXML `<virtual-instrument>` element.
    public let virtualInstrument: MXLVirtualInstrument?
}

// MARK: - Equatable

extension MXLVirtualInstrumentData: Equatable {
}

// MARK: - Hashable

extension MXLVirtualInstrumentData: Hashable {
}

// MARK: - Sendable

extension MXLVirtualInstrumentData: Sendable {
}
