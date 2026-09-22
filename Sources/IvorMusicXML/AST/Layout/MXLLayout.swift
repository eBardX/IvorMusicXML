// © 2026 John Gary Pusey (see LICENSE.md)

/// The layout group specifies the sequence of page, system, and staff layout elements that is common to both the
/// defaults and print elements.
public struct MXLLayout {

    // MARK: Public Initializers

    /// Creates a new `MXLLayout`.
    ///
    /// - Parameter pageLayout:    The score-wide default page layout, including page size and margins.
    /// - Parameter systemLayout:  The score-wide default system layout, including margins and the distance between systems.
    /// - Parameter staffLayout:   The default staff layout for staves after the first one in each part, specifying the vertical distance from the staff above.
    public init(pageLayout: MXLPageLayout? = nil,
                systemLayout: MXLSystemLayout? = nil,
                staffLayout: [MXLStaffLayout] = []) {
        self.pageLayout = pageLayout
        self.staffLayout = staffLayout
        self.systemLayout = systemLayout
    }

    // MARK: Public Instance Properties

    /// The score-wide default page layout, including page size and margins.
    ///
    /// Maps to a nested MusicXML `<page-layout>` element.
    public let pageLayout: MXLPageLayout?

    /// The default staff layout for staves after the first one in each part, specifying the vertical distance from
    /// the staff above.
    ///
    /// Maps to nested MusicXML `<staff-layout>` elements.
    public let staffLayout: [MXLStaffLayout]

    /// The score-wide default system layout, including margins and the distance between systems.
    ///
    /// Maps to a nested MusicXML `<system-layout>` element.
    public let systemLayout: MXLSystemLayout?
}

// MARK: - Equatable

extension MXLLayout: Equatable {
}

// MARK: - Hashable

extension MXLLayout: Hashable {
}

// MARK: - Sendable

extension MXLLayout: Sendable {
}
