// © 2026 John Gary Pusey (see LICENSE.md)

/// The time-relation type indicates the symbol used to represent the interchangeable aspect of dual time
/// signatures.
///
/// Maps the MusicXML `<time-relation>` element.
public enum MXLTimeRelation {

    /// A bracket symbol.
    case bracket

    /// An equals sign symbol.
    case equals

    /// A hyphen symbol.
    case hyphen

    /// A parentheses symbol.
    case parentheses

    /// A slash symbol.
    case slash

    /// A space symbol.
    case space
}

// MARK: - Equatable

extension MXLTimeRelation: Equatable {
}

// MARK: - Hashable

extension MXLTimeRelation: Hashable {
}

// MARK: - Sendable

extension MXLTimeRelation: Sendable {
}
