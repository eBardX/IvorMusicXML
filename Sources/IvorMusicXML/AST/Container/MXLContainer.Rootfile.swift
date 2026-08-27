// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLContainer {

    // A rootfile lists one top-level file (score-partwise, score-timewise, or opus) in the MusicXML container;
    // maps the MusicXML `<rootfile>` element. It is an error for the first rootfile in a rootfiles element to have
    // a non-MusicXML media type; if no media type is present at all, a MusicXML file is assumed.
    internal struct Rootfile {

        // MARK: Internal Initializers

        internal init(fullPath: String,
                      mediaType: String? = nil) {
            self.fullPath = fullPath
            self.mediaType = mediaType
        }

        // MARK: Internal Instance Properties

        internal let fullPath: String

        // If not present, a MusicXML file is assumed.
        internal let mediaType: String?
    }
}

// MARK: -

extension MXLContainer.Rootfile {

    // MARK: Internal Type Properties

    // The media type for a compressed MusicXML file.
    internal static let compressedMediaType = "application/vnd.recordare.musicxml"

    // The default media type for a MusicXML root file.
    internal static let defaultMediaType = uncompressedMediaType

    // The legacy media type for a compressed MusicXML file.
    internal static let oldCompressedMediaType = "application/musicxml+zip"

    // The legacy media type for an uncompressed MusicXML file.
    internal static let oldUncompressedMediaType = "application/musicxml+xml"

    // The media type for an uncompressed MusicXML file.
    internal static let uncompressedMediaType = "application/vnd.recordare.musicxml+xml"
}

// MARK: - Equatable

extension MXLContainer.Rootfile: Equatable {
}

// MARK: - Hashable

extension MXLContainer.Rootfile: Hashable {
}

// MARK: - Sendable

extension MXLContainer.Rootfile: Sendable {
}
