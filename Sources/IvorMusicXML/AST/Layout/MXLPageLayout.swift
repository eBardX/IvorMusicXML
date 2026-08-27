// © 2026 John Gary Pusey (see LICENSE.md)

/// Page layout can be defined both in score-wide defaults and in the print element. Page margins are specified
/// either for both even and odd pages, or via separate odd and even page number values. The type is not needed
/// when used as part of a print element. If omitted when used in the defaults element, “both” is the default.
///
/// If no page-layout element is present in the defaults element, default page layout values are chosen by the
/// application.
///
/// When used in the print element, the page-layout element affects the appearance of the current page only. All
/// other pages use the default values as determined by the defaults element. If any child elements are missing
/// from the page-layout element in a print element, the values determined by the defaults element are used there
/// as well.
///
/// Maps the MusicXML `<page-layout>` element.
public struct MXLPageLayout {

    // MARK: Public Initializers

    /// Creates a new `MXLPageLayout`.
    ///
    /// - Parameter group:        The page height and width, if specified.
    /// - Parameter pageMargins:  The page margins for even, odd, or both page types.
    public init(group: Group? = nil,
                pageMargins: [MXLPageMargins] = []) {
        self.group = group
        self.pageMargins = pageMargins
    }

    // MARK: Public Instance Properties

    /// The page height and width, if specified.
    ///
    /// Maps to a nested MusicXML `<page-height>` element.
    public let group: Group?

    /// The page margins for even, odd, or both page types.
    ///
    /// Maps to nested MusicXML `<page-margins>` elements.
    public let pageMargins: [MXLPageMargins]
}

// MARK: - Equatable

extension MXLPageLayout: Equatable {
}

// MARK: - Hashable

extension MXLPageLayout: Hashable {
}

// MARK: - Sendable

extension MXLPageLayout: Sendable {
}
