// © 2026 John Gary Pusey (see LICENSE.md)

/// The valign-image type is used to indicate vertical alignment for images and graphics, so it does not include a
/// baseline value. Defaults are implementation-dependent.
public enum MXLValignImage {

    /// Alignment to the bottom of the image.
    case bottom

    /// Alignment to the middle of the image.
    case middle

    /// Alignment to the top of the image.
    case top
}

// MARK: - Equatable

extension MXLValignImage: Equatable {
}

// MARK: - Hashable

extension MXLValignImage: Hashable {
}

// MARK: - Sendable

extension MXLValignImage: Sendable {
}
