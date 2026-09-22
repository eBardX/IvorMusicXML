// © 2026 John Gary Pusey (see LICENSE.md)

/// The simple XLink attributes supported in the MusicXML format. It is also used to connect a MusicXML score with
/// MusicXML parts or a MusicXML opus.
public struct MXLXLink {

    // MARK: Public Initializers

    /// Creates a new `MXLXLink`.
    ///
    /// - Parameter href:     A URI reference to the linked resource.
    /// - Parameter role:     A URI reference identifying a resource that describes the role of the linked resource.
    /// - Parameter title:    A human-readable description of the linked resource or link.
    /// - Parameter show:     Defaults to `replace`.
    /// - Parameter actuate:  Defaults to `onRequest`.
    public init(href: String,
                actuate: Actuate = .onRequest,
                role: String? = nil,
                show: Show = .replace,
                title: String? = nil) {
        self.actuate = actuate
        self.href = href
        self.role = role
        self.show = show
        self.title = title
    }

    // MARK: Public Instance Properties

    /// Defaults to `onRequest`.
    ///
    /// Maps to the MusicXML `xlink:actuate` attribute.
    public let actuate: Actuate

    /// A URI reference to the linked resource.
    ///
    /// Maps to the MusicXML `xlink:href` attribute.
    public let href: String

    /// A URI reference identifying a resource that describes the role of the linked resource.
    ///
    /// Maps to the MusicXML `xlink:role` attribute.
    public let role: String?

    /// Defaults to `replace`.
    ///
    /// Maps to the MusicXML `xlink:show` attribute.
    public let show: Show

    /// A human-readable description of the linked resource or link.
    ///
    /// Maps to the MusicXML `xlink:title` attribute.
    public let title: String?
}

// MARK: - Equatable

extension MXLXLink: Equatable {
}

// MARK: - Hashable

extension MXLXLink: Hashable {
}

// MARK: - Sendable

extension MXLXLink: Sendable {
}
