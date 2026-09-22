// © 2026 John Gary Pusey (see LICENSE.md)

/// The barre element indicates placing a finger over multiple strings on a single fret. The type is “start” for
/// the lowest pitched string (e.g., the string with the highest MusicXML number) and is “stop” for the highest
/// pitched string.
///
/// Maps the MusicXML `<barre>` element.
public struct MXLBarre {

    // MARK: Public Initializers

    /// Creates a new `MXLBarre`.
    ///
    /// - Parameter kind:  Whether the barre starts or stops at this string.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(kind: MXLStartStop,
                color: MXLColor? = nil) {
        self.color = color
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// Whether the barre starts or stops at this string.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStop
}

// MARK: - Equatable

extension MXLBarre: Equatable {
}

// MARK: - Hashable

extension MXLBarre: Hashable {
}

// MARK: - Sendable

extension MXLBarre: Sendable {
}
