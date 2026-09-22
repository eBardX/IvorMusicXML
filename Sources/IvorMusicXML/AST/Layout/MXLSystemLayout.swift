// © 2026 John Gary Pusey (see LICENSE.md)

/// A system is a group of staves that are read and played simultaneously. System layout includes left and right
/// margins and the vertical distance from the previous system. The system distance is measured from the bottom
/// line of the previous system to the top line of the current system. It is ignored for the first system on a
/// page. The top system distance is measured from the page’s top margin to the top line of the first system. It
/// is ignored for all but the first system on a page.
///
/// Sometimes the sum of measure widths in a system may not equal the system width specified by the layout
/// elements due to roundoff or other errors. The behavior when reading MusicXML files in these cases is
/// application-dependent. For instance, applications may find that the system layout data is more reliable than
/// the sum of the measure widths, and adjust the measure widths accordingly.
///
/// When used in the defaults element, the system-layout element defines a default appearance for all systems in
/// the score. If no system-layout element is present in the defaults element, default system layout values are
/// chosen by the application.
///
/// When used in the print element, the system-layout element affects the appearance of the current system only.
/// All other systems use the default values as determined by the defaults element. If any child elements are
/// missing from the system-layout element in a print element, the values determined by the defaults element are
/// used there as well. This type of system-layout element need only be read from or written to the first visible
/// part in the score.
///
/// Maps the MusicXML `<system-layout>` element.
public struct MXLSystemLayout {

    // MARK: Public Initializers

    /// Creates a new `MXLSystemLayout`.
    ///
    /// - Parameter systemMargins:      The left and right margins for the system, relative to the page margins.
    /// - Parameter systemDistance:     The vertical distance from the bottom line of the previous system to the top line of the current system, in tenths. Ignored for the first system on a page.
    /// - Parameter topSystemDistance:  The vertical distance from the page’s top margin to the top line of the first system, in tenths. Ignored for all but the first system on a page.
    /// - Parameter systemDividers:     Indicates the presence or absence of system dividers between this system and the previous system.
    public init(systemMargins: MXLSystemMargins? = nil,
                systemDistance: MXLTenths? = nil,
                topSystemDistance: MXLTenths? = nil,
                systemDividers: MXLSystemDividers? = nil) {
        self.systemDistance = systemDistance
        self.systemDividers = systemDividers
        self.systemMargins = systemMargins
        self.topSystemDistance = topSystemDistance
    }

    // MARK: Public Instance Properties

    /// The vertical distance from the bottom line of the previous system to the top line of the current system, in
    /// tenths. Ignored for the first system on a page.
    ///
    /// Maps to a nested MusicXML `<system-distance>` element.
    public let systemDistance: MXLTenths?

    /// Indicates the presence or absence of system dividers between this system and the previous system.
    ///
    /// Maps to a nested MusicXML `<system-dividers>` element.
    public let systemDividers: MXLSystemDividers?

    /// The left and right margins for the system, relative to the page margins.
    ///
    /// Maps to a nested MusicXML `<system-margins>` element.
    public let systemMargins: MXLSystemMargins?

    /// The vertical distance from the page’s top margin to the top line of the first system, in tenths. Ignored for
    /// all but the first system on a page.
    ///
    /// Maps to a nested MusicXML `<top-system-distance>` element.
    public let topSystemDistance: MXLTenths?
}

// MARK: - Equatable

extension MXLSystemLayout: Equatable {
}

// MARK: - Hashable

extension MXLSystemLayout: Hashable {
}

// MARK: - Sendable

extension MXLSystemLayout: Sendable {
}
