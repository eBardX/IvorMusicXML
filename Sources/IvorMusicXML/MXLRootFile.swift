// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A root file entry in a MusicXML container.
public struct MXLRootFile {

    // MARK: Public Type Properties

    /// The media type for a compressed MusicXML file.
    public static let compressedMediaType = "application/vnd.recordare.musicxml"

    /// The default media type for a MusicXML root file.
    public static let defaultMediaType = uncompressedMediaType

    /// The legacy media type for a compressed MusicXML file.
    public static let oldCompressedMediaType = "application/musicxml+zip"

    /// The legacy media type for an uncompressed MusicXML file.
    public static let oldUncompressedMediaType = "application/musicxml+xml"

    /// The media type for an uncompressed MusicXML file.
    public static let uncompressedMediaType = "application/vnd.recordare.musicxml+xml"

    // MARK: Public Initializers

    /// Creates a new root file entry with the provided path and media type.
    ///
    /// - Parameter fullPath:   The full path to the root file within the
    ///                         archive.
    /// - Parameter mediaType:  The media type of the root file.
    public init(fullPath: String,
                mediaType: String) {
        self.fullPath = fullPath
        self.mediaType = mediaType
    }

    // MARK: Public Instance Properties

    /// The full path to the root file within the archive.
    public let fullPath: String

    /// The media type of the root file.
    public let mediaType: String
}

// MARK: - Sendable

extension MXLRootFile: Sendable {
}
