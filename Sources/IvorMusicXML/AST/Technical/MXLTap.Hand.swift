// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLTap {

    /// The tap-hand type represents the symbol to use for a tap element. The left and right values refer to the SMuFL
    /// guitarLeftHandTapping and guitarRightHandTapping glyphs respectively.
    public enum Hand {

        /// The SMuFL guitarLeftHandTapping glyph.
        case left

        /// The SMuFL guitarRightHandTapping glyph.
        case right
    }
}

// MARK: - Equatable

extension MXLTap.Hand: Equatable {
}

// MARK: - Hashable

extension MXLTap.Hand: Hashable {
}

// MARK: - Sendable

extension MXLTap.Hand: Sendable {
}
