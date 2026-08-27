// © 2026 John Gary Pusey (see LICENSE.md)

/// Works are optionally identified by number and title. The work type also may indicate a link to the opus
/// document that composes multiple scores into a collection.
///
/// Maps the MusicXML `<work>` element.
public struct MXLWork {

    // MARK: Public Initializers

    /// Creates a new `MXLWork`.
    ///
    /// - Parameter number: The work-number element specifies the number of a work, such as its opus number.
    /// - Parameter title: The work-title element specifies the title of a work, not including its opus or other work number.
    /// - Parameter opus: A link to the opus document that composes multiple scores into a collection.
    public init(number: String? = nil,
                title: String? = nil,
                opus: MXLXLink? = nil) {
        self.number = number
        self.opus = opus
        self.title = title
    }

    // MARK: Public Instance Properties

    /// The work-number element specifies the number of a work, such as its opus number.
    ///
    /// Maps to a nested MusicXML `<work-number>` element.
    public let number: String?

    /// A link to the opus document that composes multiple scores into a collection.
    ///
    /// Maps to a nested MusicXML `<opus>` element.
    public let opus: MXLXLink?

    /// The work-title element specifies the title of a work, not including its opus or other work number.
    ///
    /// Maps to a nested MusicXML `<work-title>` element.
    public let title: String?
}

// MARK: - Equatable

extension MXLWork: Equatable {
}

// MARK: - Hashable

extension MXLWork: Hashable {
}

// MARK: - Sendable

extension MXLWork: Sendable {
}
