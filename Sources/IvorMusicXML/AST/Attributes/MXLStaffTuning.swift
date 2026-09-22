// © 2026 John Gary Pusey (see LICENSE.md)

/// The staff-tuning type specifies the open, non-capo tuning of the lines on a tablature staff.
///
/// Maps the MusicXML `<staff-tuning>` element.
public struct MXLStaffTuning {

    // MARK: Public Initializers

    /// Creates a new `MXLStaffTuning`.
    ///
    /// - Parameter tuning: The tuning group contains the sequence of elements common to the staff-tuning and accord elements.
    /// - Parameter line: The staff line number, counted from the bottom of the staff, to which this tuning applies.
    public init(tuning: MXLTuning,
                line: MXLStaffLine) {
        self.line = line
        self.tuning = tuning
    }

    // MARK: Public Instance Properties

    /// The staff line number, counted from the bottom of the staff, to which this tuning applies.
    ///
    /// Maps to the MusicXML `line` attribute.
    public let line: MXLStaffLine

    /// The tuning group contains the sequence of elements common to the staff-tuning and accord elements.
    public let tuning: MXLTuning
}

// MARK: - Equatable

extension MXLStaffTuning: Equatable {
}

// MARK: - Hashable

extension MXLStaffTuning: Hashable {
}

// MARK: - Sendable

extension MXLStaffTuning: Sendable {
}
