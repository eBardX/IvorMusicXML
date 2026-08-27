// © 2026 John Gary Pusey (see LICENSE.md)

/// The printout attribute group collects the different controls over printing an object (e.g. a note or rest) and
/// its parts, including augmentation dots and lyrics. This is especially useful for notes that overlap in
/// different voices, or for chord sheets that contain lyrics and chords but no melody.
///
/// By default, all these attributes are set to yes. If print-object is set to no, the print-dot and print-lyric
/// attributes are interpreted to also be set to no if they are not present.
public struct MXLPrintout {

    // MARK: Public Initializers

    /// Creates a new `MXLPrintout`.
    ///
    /// - Parameter printsObject:   A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter printsDot:      A Boolean value indicating whether to print the augmentation dots for a note. Defaults to `true`; treated as `false` if `printsObject` is `false` and this is not specified.
    /// - Parameter printsSpacing:  A Boolean value indicating whether to leave spacing for an invisible note or object. Used only if no note, dot, or lyric is being printed. Defaults to `true` if not specified.
    /// - Parameter printsLyric:    A Boolean value indicating whether to print the lyrics for a note. Defaults to `true`; treated as `false` if `printsObject` is `false` and this is not specified.
    public init(printsObject: Bool? = nil,
                printsDot: Bool? = nil,
                printsSpacing: Bool? = nil,
                printsLyric: Bool? = nil) {
        self.printsDot = printsDot ?? true
        self.printsLyric = printsLyric ?? true
        self.printsObject = printsObject
        self.printsSpacing = printsSpacing
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether to print the augmentation dots for a note. Defaults to `true`; treated as
    /// `false` if `printsObject` is `false` and this is not specified.
    ///
    /// Maps to the MusicXML `print-dot` attribute.
    public let printsDot: Bool

    /// A Boolean value indicating whether to print the lyrics for a note. Defaults to `true`; treated as `false` if
    /// `printsObject` is `false` and this is not specified.
    ///
    /// Maps to the MusicXML `print-lyric` attribute.
    public let printsLyric: Bool

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?

    /// A Boolean value indicating whether to leave spacing for an invisible note or object. Used only if no note,
    /// dot, or lyric is being printed. Defaults to `true` if not specified.
    ///
    /// Maps to the MusicXML `print-spacing` attribute.
    public let printsSpacing: Bool?
}

// MARK: - Equatable

extension MXLPrintout: Equatable {
}

// MARK: - Hashable

extension MXLPrintout: Hashable {
}

// MARK: - Sendable

extension MXLPrintout: Sendable {
}
