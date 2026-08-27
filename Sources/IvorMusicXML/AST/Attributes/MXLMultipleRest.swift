// © 2026 John Gary Pusey (see LICENSE.md)

/// The text of the multiple-rest type indicates the number of measures in the multiple rest. Multiple rests may
/// use the 1-bar / 2-bar / 4-bar rest symbols, or a single shape. The use-symbols attribute indicates which to
/// use; it is no if not specified.
///
/// Maps the MusicXML `<multiple-rest>` element.
public struct MXLMultipleRest {

    // MARK: Public Initializers

    /// Creates a new `MXLMultipleRest`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter usesSymbols: A Boolean value indicating whether to use the 1-bar / 2-bar / 4-bar rest symbols rather than a single shape. Defaults to `false` if not specified.
    public init(value: Int,
                usesSymbols: Bool? = nil) {
        self.usesSymbols = usesSymbols ?? false
        self.value = value
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether to use the 1-bar / 2-bar / 4-bar rest symbols rather than a single shape.
    /// Defaults to `false` if not specified.
    ///
    /// Maps to the MusicXML `use-symbols` attribute.
    public let usesSymbols: Bool

    /// The value of this element.
    public let value: Int
}

// MARK: - Equatable

extension MXLMultipleRest: Equatable {
}

// MARK: - Hashable

extension MXLMultipleRest: Hashable {
}

// MARK: - Sendable

extension MXLMultipleRest: Sendable {
}
