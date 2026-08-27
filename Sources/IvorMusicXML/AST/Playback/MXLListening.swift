// © 2026 John Gary Pusey (see LICENSE.md)

/// The listen and listening types, new in Version 4.0, specify different ways that a score following or machine
/// listening application can interact with a performer. The listening type handles interactions that change the
/// state of the listening application from the specified point in the performance onward. If multiple child
/// elements of the same type are present, they should have distinct player and/or time-only attributes.
///
/// The offset element is used to indicate that the listening change takes place offset from the current score
/// position. If the listening element is a child of a direction element, the listening offset element overrides
/// the direction offset element if both elements are present. Note that the offset reflects the intended musical
/// position for the change in state. It should not be used to compensate for latency issues in particular
/// hardware configurations.
///
/// Maps the MusicXML `<listening>` element.
public struct MXLListening {

    // MARK: Public Initializers

    /// Creates a new `MXLListening`.
    ///
    /// - Parameter items:   One of the alternatives for Listening.
    /// - Parameter offset:  Indicates that the listening change takes place offset from the current score position, in divisions.
    public init(items: [Item] = [],
                offset: MXLOffset? = nil) {
        self.items = items
        self.offset = offset
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for Listening.
    public let items: [Item]

    /// Indicates that the listening change takes place offset from the current score position, in divisions.
    ///
    /// Maps to a nested MusicXML `<offset>` element.
    public let offset: MXLOffset?
}

// MARK: - Equatable

extension MXLListening: Equatable {
}

// MARK: - Hashable

extension MXLListening: Hashable {
}

// MARK: - Sendable

extension MXLListening: Sendable {
}
