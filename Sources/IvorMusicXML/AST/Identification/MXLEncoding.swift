// © 2026 John Gary Pusey (see LICENSE.md)

/// The encoding element contains information about who did the digital encoding, when, with what software, and in
/// what aspects. Standard type values for the encoder element are music, words, and arrangement, but other types
/// may be used. The type attribute is only needed when there are multiple encoder elements.
///
/// Maps the MusicXML `<encoding>` element.
public struct MXLEncoding {

    // MARK: Public Initializers

    /// Creates a new `MXLEncoding`.
    ///
    /// - Parameter items: One of the alternatives for Encoding.
    public init(items: [Item] = []) {
        self.items = items
    }

    // MARK: Public Instance Properties

    /// One of the alternatives for Encoding.
    public let items: [Item]
}

// MARK: - Equatable

extension MXLEncoding: Equatable {
}

// MARK: - Hashable

extension MXLEncoding: Hashable {
}

// MARK: - Sendable

extension MXLEncoding: Sendable {
}
