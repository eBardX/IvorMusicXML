// © 2026 John Gary Pusey (see LICENSE.md)

/// The show-tuplet type indicates whether to show a part of a tuplet relating to the tuplet-actual element, both
/// the tuplet-actual and tuplet-normal elements, or neither.
public enum MXLShowTuplet {

    /// Show only the tuplet-actual element.
    case actual

    /// Show both the tuplet-actual and tuplet-normal elements.
    case both

    /// Show neither the tuplet-actual nor the tuplet-normal element.
    case neither
}

// MARK: - Equatable

extension MXLShowTuplet: Equatable {
}

// MARK: - Hashable

extension MXLShowTuplet: Hashable {
}

// MARK: - Sendable

extension MXLShowTuplet: Sendable {
}
