// © 2026 John Gary Pusey (see LICENSE.md)

/// The step type represents a step of the diatonic scale, represented using the English letters A through G.
public enum MXLStep {

    /// The diatonic step A.
    case a

    /// The diatonic step B.
    case b

    /// The diatonic step C.
    case c

    /// The diatonic step D.
    case d

    /// The diatonic step E.
    case e

    /// The diatonic step F.
    case f

    /// The diatonic step G.
    case g
}

// MARK: - Equatable

extension MXLStep: Equatable {
}

// MARK: - Hashable

extension MXLStep: Hashable {
}

// MARK: - Sendable

extension MXLStep: Sendable {
}
