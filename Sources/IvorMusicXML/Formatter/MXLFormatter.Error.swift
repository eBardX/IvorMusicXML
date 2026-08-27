// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

extension MXLFormatter {

    /// An error that occurs when formatting a MusicXML document.
    public enum Error {
        /// ``MXLFormatter/format(_:compressed:)`` was called on a document whose
        /// ``MXLDocument/isValidated`` flag is `false`.
        ///
        /// Call ``MXLValidator/validate(_:)`` before
        /// ``MXLFormatter/format(_:compressed:)``.
        case notValidated

        /// ``MXLFormatter/format(_:compressed:)`` was called on a time-wise score.
        ///
        /// The formatter writes part-wise scores only.
        /// ``MXLNormalizer/normalize(_:)`` converts a time-wise score to part-wise,
        /// so a document taken through the canonical pipeline never reaches the
        /// formatter still time-wise.
        case unsupportedTimewise

        /// The document could not be written, with an optional underlying error.
        case writeFailure((any EnhancedError)?)
    }
}

// MARK: - EnhancedError

extension MXLFormatter.Error: EnhancedError {
    /// The error category identifying the source module.
    public var category: Category? {
        Category("IvorMusicXML")
    }

    /// The underlying error that caused this error, if any.
    public var cause: (any EnhancedError)? {
        switch self {
        case let .writeFailure(error):
            error

        default:
            nil
        }
    }

    /// A human-readable description of this error.
    public var message: String {
        switch self {
        case .notValidated:
            "Document must be validated before formatting; call MXLValidator.validate(_:) first"

        case .unsupportedTimewise:
            "A time-wise score must be normalized to part-wise before formatting"

        case .writeFailure:
            "Unable to write MusicXML file"
        }
    }
}

// MARK: - Sendable

extension MXLFormatter.Error: Sendable {
}
