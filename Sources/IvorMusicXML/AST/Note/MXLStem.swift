// © 2026 John Gary Pusey (see LICENSE.md)

/// Stems can be down, up, none, or double. For down and up stems, the position attributes can be used to specify
/// stem length. The relative values specify the end of the stem relative to the program default. Default values
/// specify an absolute end stem position. Negative values of relative-y that would flip a stem instead of
/// shortening it are ignored. A stem element associated with a rest refers to a stemlet.
///
/// Maps the MusicXML `<stem>` element.
public struct MXLStem {

    // MARK: Public Initializers

    /// Creates a new `MXLStem`.
    ///
    /// - Parameter value:      The value of this element.
    /// - Parameter yPosition:  The y-position attribute group is used for elements like stems where specifying y position is common, but specifying x position is rare.
    /// - Parameter color:      The color attribute group indicates the color of an element.
    public init(value: Value,
                yPosition: MXLYPosition = MXLYPosition(),
                color: MXLColor? = nil) {
        self.color = color
        self.value = value
        self.yPosition = yPosition
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The value of this element.
    public let value: Value

    /// The y-position attribute group is used for elements like stems where specifying y position is common, but
    /// specifying x position is rare.
    public let yPosition: MXLYPosition
}

// MARK: - Equatable

extension MXLStem: Equatable {
}

// MARK: - Hashable

extension MXLStem: Hashable {
}

// MARK: - Sendable

extension MXLStem: Sendable {
}
