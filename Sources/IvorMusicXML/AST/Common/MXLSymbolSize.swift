// © 2026 John Gary Pusey (see LICENSE.md)

/// The symbol-size type is used to distinguish between full, cue sized, grace cue sized, and oversized symbols.
public enum MXLSymbolSize {

    /// A cue-sized symbol.
    case cue

    /// A full-sized symbol.
    case full

    /// A grace-cue-sized symbol.
    case graceCue

    /// An oversized symbol.
    case large
}

// MARK: - Equatable

extension MXLSymbolSize: Equatable {
}

// MARK: - Hashable

extension MXLSymbolSize: Hashable {
}

// MARK: - Sendable

extension MXLSymbolSize: Sendable {
}
