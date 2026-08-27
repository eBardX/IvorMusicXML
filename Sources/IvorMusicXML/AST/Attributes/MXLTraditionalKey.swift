// © 2026 John Gary Pusey (see LICENSE.md)

/// The traditional-key group represents a traditional key signature using the cycle of fifths.
public struct MXLTraditionalKey {

    // MARK: Public Initializers

    /// Creates a new `MXLTraditionalKey`.
    ///
    /// - Parameter cancel: The old key signature to be canceled before the new one appears, matching the fifths value of the canceled key signature.
    /// - Parameter fifths: The number of flats or sharps in the key signature. Negative values indicate flats and positive values indicate sharps, reflecting the key’s placement within the circle of fifths.
    /// - Parameter mode:   The mode of the key signature, such as major or minor.
    public init(cancel: MXLCancel? = nil,
                fifths: MXLFifths,
                mode: MXLMode? = nil) {
        self.cancel = cancel
        self.fifths = fifths
        self.mode = mode
    }

    // MARK: Public Instance Properties

    /// The old key signature to be canceled before the new one appears, matching the fifths value of the canceled
    /// key signature.
    ///
    /// Maps to a nested MusicXML `<cancel>` element.
    public let cancel: MXLCancel?

    /// The number of flats or sharps in the key signature. Negative values indicate flats and positive values
    /// indicate sharps, reflecting the key’s placement within the circle of fifths.
    ///
    /// Maps to a nested MusicXML `<fifths>` element.
    public let fifths: MXLFifths

    /// The mode of the key signature, such as major or minor.
    ///
    /// Maps to a nested MusicXML `<mode>` element.
    public let mode: MXLMode?
}

// MARK: - Equatable

extension MXLTraditionalKey: Equatable {
}

// MARK: - Hashable

extension MXLTraditionalKey: Hashable {
}

// MARK: - Sendable

extension MXLTraditionalKey: Sendable {
}
