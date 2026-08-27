// © 2026 John Gary Pusey (see LICENSE.md)

/// The bass type is used to indicate a bass note in popular music chord symbols, e.g. G/C. It is generally not
/// used in functional harmony, as inversion is generally not used in pop chord symbols. As with root, it is
/// divided into step and alter elements, similar to pitches. The arrangement attribute specifies where the bass
/// is displayed relative to what precedes it.
///
/// Maps the MusicXML `<bass>` element.
public struct MXLBass {

    // MARK: Public Initializers

    /// Creates a new `MXLBass`.
    ///
    /// - Parameter separator: The optional bass-separator element indicates that text, rather than a line or slash, separates the bass from what precedes it.
    /// - Parameter step:  The pitch step of the bass of the current chord.
    /// - Parameter alter: The bass-alter element represents the chromatic alteration of the bass of the current chord within the harmony element. In some chord styles, the text for the bass-step element may include bass-alter information. In that case, the print-object attribute of the bass-alter element can be set to no. The location attribute indicates whether the alteration should appear to the left or the right of the bass-step; it is right if not specified.
    /// - Parameter arrangement:  Specifies where the bass is displayed relative to what precedes it.
    public init(separator: MXLStyleText? = nil,
                step: Step,
                alter: MXLHarmonyAlter? = nil,
                arrangement: MXLHarmonyArrangement? = nil) {
        self.alter = alter
        self.arrangement = arrangement
        self.separator = separator
        self.step = step
    }

    // MARK: Public Instance Properties

    /// The bass-alter element represents the chromatic alteration of the bass of the current chord within the harmony
    /// element. In some chord styles, the text for the bass-step element may include bass-alter information. In that
    /// case, the print-object attribute of the bass-alter element can be set to no. The location attribute indicates
    /// whether the alteration should appear to the left or the right of the bass-step; it is right if not specified.
    ///
    /// Maps to a nested MusicXML `<bass-alter>` element.
    public let alter: MXLHarmonyAlter?

    /// Specifies where the bass is displayed relative to what precedes it.
    ///
    /// Maps to the MusicXML `arrangement` attribute.
    public let arrangement: MXLHarmonyArrangement?

    /// The optional bass-separator element indicates that text, rather than a line or slash, separates the bass from
    /// what precedes it.
    ///
    /// Maps to a nested MusicXML `<bass-separator>` element.
    public let separator: MXLStyleText?

    /// The pitch step of the bass of the current chord.
    ///
    /// Maps to a nested MusicXML `<bass-step>` element.
    public let step: Step
}

// MARK: - Equatable

extension MXLBass: Equatable {
}

// MARK: - Hashable

extension MXLBass: Hashable {
}

// MARK: - Sendable

extension MXLBass: Sendable {
}
