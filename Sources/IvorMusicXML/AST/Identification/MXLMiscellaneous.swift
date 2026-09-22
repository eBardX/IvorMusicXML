// © 2026 John Gary Pusey (see LICENSE.md)

/// If a program has other metadata not yet supported in the MusicXML format, it can go in the miscellaneous
/// element. The miscellaneous type puts each separate part of metadata into its own miscellaneous-field type.
///
/// Maps the MusicXML `<miscellaneous>` element.
public struct MXLMiscellaneous {

    // MARK: Public Initializers

    /// Creates a new `MXLMiscellaneous`.
    ///
    /// - Parameter field: The individual pieces of metadata, each with its own name and value.
    public init(field: [Field] = []) {
        self.field = field
    }

    // MARK: Public Instance Properties

    /// The individual pieces of metadata, each with its own name and value.
    ///
    /// Maps to nested MusicXML `<miscellaneous-field>` elements.
    public let field: [Field]
}

// MARK: - Equatable

extension MXLMiscellaneous: Equatable {
}

// MARK: - Hashable

extension MXLMiscellaneous: Hashable {
}

// MARK: - Sendable

extension MXLMiscellaneous: Sendable {
}
