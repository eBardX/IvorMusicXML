// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLCancel {

    /// The cancel-location type is used to indicate where a key signature cancellation appears relative to a new key
    /// signature: to the left, to the right, or before the barline and to the left. It is left by default. For mid-
    /// measure key elements, a cancel-location of before-barline should be treated like a cancel-location of left.
    public enum Location {

        /// Before the barline and to the left of the new key signature.
        case beforeBarline

        /// To the left of the new key signature.
        case left

        /// To the right of the new key signature.
        case right
    }
}

// MARK: - Equatable

extension MXLCancel.Location: Equatable {
}

// MARK: - Hashable

extension MXLCancel.Location: Hashable {
}

// MARK: - Sendable

extension MXLCancel.Location: Sendable {
}
