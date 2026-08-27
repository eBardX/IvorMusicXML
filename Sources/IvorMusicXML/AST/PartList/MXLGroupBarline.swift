// © 2026 John Gary Pusey (see LICENSE.md)

/// The group-barline type indicates if the group should have common barlines.
///
/// Maps the MusicXML `<group-barline>` element.
public struct MXLGroupBarline {

    // MARK: Public Initializers

    /// Creates a new `MXLGroupBarline`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(value: Value,
                color: MXLColor? = nil) {
        self.color = color
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLGroupBarline: Equatable {
}

// MARK: - Hashable

extension MXLGroupBarline: Hashable {
}

// MARK: - Sendable

extension MXLGroupBarline: Sendable {
}
