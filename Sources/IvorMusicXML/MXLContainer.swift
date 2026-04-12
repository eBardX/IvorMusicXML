// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A MusicXML container that holds a list of root files.
public struct MXLContainer {

    // MARK: Public Initializers

    /// Creates a new container with the provided list of root files.
    ///
    /// - Parameter rootFiles:  The root files held by the container.
    public init(rootFiles: [MXLRootFile]) {
        self.rootFiles = rootFiles
    }

    // MARK: Public Instance Properties

    /// The root files held by the container.
    public let rootFiles: [MXLRootFile]
}

// MARK: - Sendable

extension MXLContainer: Sendable {
}
