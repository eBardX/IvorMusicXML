// © 2026 John Gary Pusey (see LICENSE.md)

/// Staff layout includes the vertical distance from the bottom line of the previous staff in this system to the
/// top line of the staff specified by the number attribute. The optional number attribute refers to staff numbers
/// within the part, from top to bottom on the system. A value of 1 is used if not present.
///
/// When used in the defaults element, the values apply to all systems in all parts. When used in the print
/// element, the values apply to the current system only. This value is ignored for the first staff in a system.
///
/// Maps the MusicXML `<staff-layout>` element.
public struct MXLStaffLayout {

    // MARK: Public Initializers

    /// Creates a new `MXLStaffLayout`.
    ///
    /// - Parameter staffDistance:  The vertical distance from the bottom line of the previous staff in this system to the top line of this staff, in tenths.
    /// - Parameter number:         The staff number, from top to bottom on the system, that this element applies to. A value of `1` is used if not present.
    public init(staffDistance: MXLTenths? = nil,
                number: MXLStaffNumber? = nil) {
        self.number = number
        self.staffDistance = staffDistance
    }

    // MARK: Public Instance Properties

    /// The staff number, from top to bottom on the system, that this element applies to. A value of `1` is used if
    /// not present.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLStaffNumber?

    /// The vertical distance from the bottom line of the previous staff in this system to the top line of this
    /// staff, in tenths.
    ///
    /// Maps to a nested MusicXML `<staff-distance>` element.
    public let staffDistance: MXLTenths?
}

// MARK: - Equatable

extension MXLStaffLayout: Equatable {
}

// MARK: - Hashable

extension MXLStaffLayout: Hashable {
}

// MARK: - Sendable

extension MXLStaffLayout: Sendable {
}
