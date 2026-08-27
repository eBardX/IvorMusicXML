// © 2026 John Gary Pusey (see LICENSE.md)

/// The xml:space attribute value, as defined by the XML 1.0 specification.
public enum MXLXmlSpace {

    /// Whitespace handling follows the default, application-dependent behavior.
    case `default`

    /// Whitespace should be preserved.
    case preserve
}

// MARK: - Equatable

extension MXLXmlSpace: Equatable {
}

// MARK: - Hashable

extension MXLXmlSpace: Hashable {
}

// MARK: - Sendable

extension MXLXmlSpace: Sendable {
}
