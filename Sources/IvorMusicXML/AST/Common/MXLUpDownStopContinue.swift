// © 2026 John Gary Pusey (see LICENSE.md)

/// The up-down-stop-continue type is used for octave-shift elements, indicating the direction of the shift from
/// their true pitched values because of printing difficulty.
public enum MXLUpDownStopContinue {

    /// A continuation of an octave shift, typically across a system break.
    case `continue`

    /// An octave shift downward.
    case down

    /// The end of an octave shift.
    case stop

    /// An octave shift upward.
    case up
}

// MARK: - Equatable

extension MXLUpDownStopContinue: Equatable {
}

// MARK: - Hashable

extension MXLUpDownStopContinue: Hashable {
}

// MARK: - Sendable

extension MXLUpDownStopContinue: Sendable {
}
