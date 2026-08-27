// © 2026 John Gary Pusey (see LICENSE.md)

/// The beam-value type represents the type of beam associated with each of 8 beam levels (up to 1024th notes)
/// available for each note.
public enum MXLBeamValue {

    /// A backward hook.
    case backwardHook

    /// The beginning of a beam.
    case begin

    /// A continuation of a beam.
    case `continue`

    /// The end of a beam.
    case end

    /// A forward hook.
    case forwardHook
}

// MARK: - Equatable

extension MXLBeamValue: Equatable {
}

// MARK: - Hashable

extension MXLBeamValue: Hashable {
}

// MARK: - Sendable

extension MXLBeamValue: Sendable {
}
