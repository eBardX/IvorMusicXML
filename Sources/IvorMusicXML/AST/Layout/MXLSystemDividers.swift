// © 2026 John Gary Pusey (see LICENSE.md)

/// The system-dividers element indicates the presence or absence of system dividers (also known as system
/// separation marks) between systems displayed on the same page. Dividers on the left and right side of the page
/// are controlled by the left-divider and right-divider elements respectively. The default vertical position is
/// half the system-distance value from the top of the system that is below the divider. The default horizontal
/// position is the left and right system margin, respectively.
///
/// When used in the print element, the system-dividers element affects the dividers that would appear between the
/// current system and the previous system.
///
/// Maps the MusicXML `<system-dividers>` element.
public struct MXLSystemDividers {

    // MARK: Public Initializers

    /// Creates a new `MXLSystemDividers`.
    ///
    /// - Parameter leftDivider:   Controls the divider on the left side of the page.
    /// - Parameter rightDivider:  Controls the divider on the right side of the page.
    public init(leftDivider: MXLEmptyPrintObjectStyleAlign,
                rightDivider: MXLEmptyPrintObjectStyleAlign) {
        self.leftDivider = leftDivider
        self.rightDivider = rightDivider
    }

    // MARK: Public Instance Properties

    /// Controls the divider on the left side of the page.
    ///
    /// Maps to a nested MusicXML `<left-divider>` element.
    public let leftDivider: MXLEmptyPrintObjectStyleAlign

    /// Controls the divider on the right side of the page.
    ///
    /// Maps to a nested MusicXML `<right-divider>` element.
    public let rightDivider: MXLEmptyPrintObjectStyleAlign
}

// MARK: - Equatable

extension MXLSystemDividers: Equatable {
}

// MARK: - Hashable

extension MXLSystemDividers: Hashable {
}

// MARK: - Sendable

extension MXLSystemDividers: Sendable {
}
