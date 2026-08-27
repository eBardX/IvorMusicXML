// © 2026 John Gary Pusey (see LICENSE.md)

/// The listen and listening types, new in Version 4.0, specify different ways that a score following or machine
/// listening application can interact with a performer. The listen type handles interactions that are specific to
/// a note. If multiple child elements of the same type are present, they should have distinct player and/or time-
/// only attributes.
///
/// Maps the MusicXML `<listen>` element.
public struct MXLListen {

    // MARK: Public Initializers

    /// Creates a new `MXLListen`.
    ///
    /// - Parameter items:  One of the alternatives for Listen.
    public init(items: [Item] = []) {
        self.items = items
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for Listen.
    public let items: [Item]
}

// MARK: - Equatable

extension MXLListen: Equatable {
}

// MARK: - Hashable

extension MXLListen: Hashable {
}

// MARK: - Sendable

extension MXLListen: Sendable {
}
