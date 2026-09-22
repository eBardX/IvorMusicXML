// © 2026 John Gary Pusey (see LICENSE.md)

/// The tie element indicates that a tie begins or ends with this note. If the tie element applies only particular
/// times through a repeat, the time-only attribute indicates which times to apply it. The tie element indicates
/// sound; the tied element indicates notation.
///
/// Maps the MusicXML `<tie>` element.
public struct MXLTie {

    // MARK: Public Initializers

    /// Creates a new `MXLTie`.
    ///
    /// - Parameter kind:      Whether this element marks the start or the stop of the tie.
    /// - Parameter timeOnly:  Indicates which times through a repeat this tie is played, if only particular times.
    public init(kind: MXLStartStop,
                timeOnly: MXLTimeOnly? = nil) {
        self.timeOnly = timeOnly
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// Whether this element marks the start or the stop of the tie.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: MXLStartStop

    /// Indicates which times through a repeat this tie is played, if only particular times.
    ///
    /// Maps to the MusicXML `time-only` attribute.
    public let timeOnly: MXLTimeOnly?
}

// MARK: - Equatable

extension MXLTie: Equatable {
}

// MARK: - Hashable

extension MXLTie: Hashable {
}

// MARK: - Sendable

extension MXLTie: Sendable {
}
