// © 2026 John Gary Pusey (see LICENSE.md)

// The document element for the `META-INF/container.xml` file inside a compressed (`.mxl`) MusicXML archive; maps
// the MusicXML `<container>` root element. This is an archive implementation detail rather than a document in its
// own right: it exists only inside a `.mxl`, and each rootfile's `full-path` is defined relative to the zip root,
// so a standalone container has nothing to be relative to. Accordingly it is not a case of `MXLDocument.Content`.
internal struct MXLContainer {

    // MARK: Internal Initializers

    internal init(rootfiles: [Rootfile] = []) {
        self.rootfiles = rootfiles
    }

    // MARK: Internal Instance Properties

    // Maps to nested MusicXML `<rootfiles>` elements.
    internal let rootfiles: [Rootfile]
}

// MARK: - Equatable

extension MXLContainer: Equatable {
}

// MARK: - Hashable

extension MXLContainer: Hashable {
}

// MARK: - Sendable

extension MXLContainer: Sendable {
}
