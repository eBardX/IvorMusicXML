// © 2026 John Gary Pusey (see LICENSE.md)

/// The figure type represents a single figure within a figured-bass element.
///
/// Maps the MusicXML `<figure>` element.
public struct MXLFigure {

    // MARK: Public Initializers

    /// Creates a new `MXLFigure`.
    ///
    /// - Parameter prefix: Values for the prefix element include plus and the accidental values sharp, flat, natural, double-sharp, flat-flat, and sharp-sharp. The prefix element may contain additional values for symbols specific to particular figured bass styles.
    /// - Parameter number: A figure-number is a number. Overstrikes of the figure number are represented in the suffix element.
    /// - Parameter suffix: Values for the suffix element include plus and the accidental values sharp, flat, natural, double-sharp, flat-flat, and sharp-sharp. Suffixes include both symbols that come after the figure number and those that overstrike the figure number. The suffix values slash, back-slash, and vertical are used for slashed numbers indicating chromatic alteration. The orientation and display of the slash usually depends on the figure number. The suffix element may contain additional values for symbols specific to particular figured bass styles.
    /// - Parameter extend:  A figured bass extension line following this figure.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    public init(prefix: MXLStyleText? = nil,
                number: MXLStyleText? = nil,
                suffix: MXLStyleText? = nil,
                extend: MXLExtend? = nil,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil) {
        self.extend = extend
        self.footnote = footnote
        self.level = level
        self.number = number
        self.prefix = prefix
        self.suffix = suffix
    }

    // MARK: Public Instance Properties

    /// A figured bass extension line following this figure.
    ///
    /// Maps to a nested MusicXML `<extend>` element.
    public let extend: MXLExtend?

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// A figure-number is a number. Overstrikes of the figure number are represented in the suffix element.
    ///
    /// Maps to a nested MusicXML `<figure-number>` element.
    public let number: MXLStyleText?

    /// Values for the prefix element include plus and the accidental values sharp, flat, natural, double-sharp, flat-
    /// flat, and sharp-sharp. The prefix element may contain additional values for symbols specific to particular
    /// figured bass styles.
    ///
    /// Maps to a nested MusicXML `<prefix>` element.
    public let prefix: MXLStyleText?

    /// Values for the suffix element include plus and the accidental values sharp, flat, natural, double-sharp, flat-
    /// flat, and sharp-sharp. Suffixes include both symbols that come after the figure number and those that
    /// overstrike the figure number. The suffix values slash, back-slash, and vertical are used for slashed numbers
    /// indicating chromatic alteration. The orientation and display of the slash usually depends on the figure
    /// number. The suffix element may contain additional values for symbols specific to particular figured bass
    /// styles.
    ///
    /// Maps to a nested MusicXML `<suffix>` element.
    public let suffix: MXLStyleText?
}

// MARK: - Equatable

extension MXLFigure: Equatable {
}

// MARK: - Hashable

extension MXLFigure: Hashable {
}

// MARK: - Sendable

extension MXLFigure: Sendable {
}
