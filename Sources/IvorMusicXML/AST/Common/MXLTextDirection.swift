// © 2026 John Gary Pusey (see LICENSE.md)

/// The text-direction type is used to adjust and override the Unicode bidirectional text algorithm, similar to
/// the Directionality data category in the W3C Internationalization Tag Set recommendation. Values are ltr (left-
/// to-right embed), rtl (right-to-left embed), lro (left-to-right bidi-override), and rlo (right-to-left bidi-
/// override). The default value is ltr. This type is typically used by applications that store text in left-to-
/// right visual order rather than logical order. Such applications can use the lro value to better communicate
/// with other applications that more fully support bidirectional text.
public enum MXLTextDirection {

    /// A left-to-right bidi-override.
    case lro

    /// A left-to-right embed. This is the default value.
    case ltr

    /// A right-to-left bidi-override.
    case rlo

    /// A right-to-left embed.
    case rtl
}

// MARK: - Equatable

extension MXLTextDirection: Equatable {
}

// MARK: - Hashable

extension MXLTextDirection: Hashable {
}

// MARK: - Sendable

extension MXLTextDirection: Sendable {
}
