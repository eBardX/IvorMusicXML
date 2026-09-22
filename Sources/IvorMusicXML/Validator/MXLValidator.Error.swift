// © 2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

extension MXLValidator {

    /// An error thrown when a document cannot be validated at all, as distinct
    /// from a document that is validated and found wanting.
    public enum Error {

        /// ``MXLValidator/validate(_:)`` was called on a document whose
        /// ``MXLDocument/isNormalized`` flag is `false`.
        ///
        /// Call ``MXLNormalizer/normalize(_:)`` before
        /// ``MXLValidator/validate(_:)``.
        case notNormalized
    }
}

// MARK: - EnhancedError

extension MXLValidator.Error: EnhancedError {

    /// The error category identifying the source module.
    public var category: Category? {
        Category("IvorMusicXML")
    }

    /// A human-readable description of this error.
    public var message: String {
        switch self {
        case .notNormalized:
            "Document must be normalized before validation; call MXLNormalizer.normalize(_:) first"
        }
    }
}

// MARK: - Equatable

extension MXLValidator.Error: Equatable {
}

// MARK: - Sendable

extension MXLValidator.Error: Sendable {
}
