// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

/// An error that occurs when parsing a MusicXML document.
public enum MXLParseError {
    /// The root file has an unsupported media type.
    case invalidRootFileMediaType(String)

    /// No root file was found in the container.
    case noRootFileFound

    /// The MusicXML document failed to parse, with an optional underlying
    /// error.
    case parseFailure((any EnhancedError)?)
}

// MARK: - EnhancedError

extension MXLParseError: EnhancedError {
    /// Returns the error category identifying the source module.
    public var category: Category? {
        Category("IvorMusicXML")
    }

    /// Returns the underlying error that caused this error, if any.
    public var cause: (any EnhancedError)? {
        switch self {
        case let .parseFailure(error):
            error

        default:
            nil
        }
    }

    /// Returns a human-readable description of this error.
    public var message: String {
        switch self {
        case let .invalidRootFileMediaType(mediaType):
            "Invalid root file media type: \(mediaType)"

        case .noRootFileFound:
            "No root files found in container"

        case .parseFailure:
            "Unable to parse MusicXML file"
        }
    }
}

// MARK: - Sendable

extension MXLParseError: Sendable {
}
