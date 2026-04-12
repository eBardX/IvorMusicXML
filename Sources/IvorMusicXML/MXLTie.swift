// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// The tie state of a MusicXML note.
public enum MXLTie {
    /// The note has no tie.
    case neither

    /// The note starts a tie.
    case start

    /// The note stops a tie.
    case stop

    /// The note both stops and starts a tie.
    case stopStart
}

// MARK: -

extension MXLTie {

    // MARK: Public Type Methods

    /// Returns the result of combining two tie values.
    ///
    /// - Parameter lhs:    The left-hand side tie value.
    /// - Parameter rhs:    The right-hand side tie value.
    ///
    /// - Returns:  The combined tie value.
    public static func + (lhs: Self,
                          rhs: Self) -> Self {
        switch (lhs, rhs) {
        case (_, .neither),
            (.start, .start),
            (.stop, .stop),
            (.stopStart, _):
            return lhs

        case (_, .stopStart),
            (.neither, _):
            return rhs

        case (.start, .stop),
            (.stop, .start):
            return .stopStart
        }
    }

    /// Combines the left-hand side tie value with the right-hand side tie
    /// value in place.
    ///
    /// - Parameter lhs:    The left-hand side tie value to update.
    /// - Parameter rhs:    The right-hand side tie value.
    public static func += (lhs: inout Self,
                           rhs: Self) {
        lhs = lhs + rhs
    }
}

// MARK: - Sendable

extension MXLTie: Sendable {
}
