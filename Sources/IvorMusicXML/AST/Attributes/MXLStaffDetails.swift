// © 2026 John Gary Pusey (see LICENSE.md)

/// The staff-details element is used to indicate different types of staves. The optional number attribute
/// specifies the staff number from top to bottom on the system, as with clef. The print-object attribute is used
/// to indicate when a staff is not printed in a part, usually in large scores where empty parts are omitted. It
/// is yes by default. If print-spacing is yes while print-object is no, the score is printed in cutaway format
/// where vertical space is left for the empty part.
///
/// Maps the MusicXML `<staff-details>` element.
public struct MXLStaffDetails {

    // MARK: Public Initializers

    /// Creates a new `MXLStaffDetails`.
    ///
    /// - Parameter staffKind: The kind of staff, such as ossia, cue, editorial, regular, or alternate.
    /// - Parameter group: The number of lines on the staff, and per-line appearance details, for non-5-line staves.
    /// - Parameter staffTuning: The tunings for each line of a tablature staff.
    /// - Parameter capo: The capo element indicates at which fret a capo should be placed on a fretted instrument. This changes the open tuning of the strings specified by staff-tuning by the specified number of half-steps.
    /// - Parameter staffSize: How large a staff space is on this staff.
    /// - Parameter number: The staff number, from top to bottom on the system, that this element applies to.
    /// - Parameter showFrets: Whether to show tablature frets as numbers or letters. Defaults to numbers.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter printsSpacing: A Boolean value indicating whether to leave spacing for an invisible note or object. Used only if no note, dot, or lyric is being printed. Defaults to `true` if not specified.
    public init(staffKind: Kind? = nil,
                group: Group? = nil,
                staffTuning: [MXLStaffTuning] = [],
                capo: Int? = nil,
                staffSize: MXLStaffSize? = nil,
                number: MXLStaffNumber? = nil,
                showFrets: MXLShowFrets? = nil,
                printsObject: Bool? = nil,
                printsSpacing: Bool? = nil) {
        self.capo = capo
        self.group = group
        self.number = number
        self.printsObject = printsObject
        self.printsSpacing = printsSpacing
        self.showFrets = showFrets ?? .numbers
        self.staffSize = staffSize
        self.staffTuning = staffTuning
        self.staffKind = staffKind
    }

    // MARK: Public Instance Properties

    /// The capo element indicates at which fret a capo should be placed on a fretted instrument. This changes the
    /// open tuning of the strings specified by staff-tuning by the specified number of half-steps.
    ///
    /// Maps to a nested MusicXML `<capo>` element.
    public let capo: Int?

    /// The number of lines on the staff, and per-line appearance details, for non-5-line staves.
    ///
    /// Maps to a nested MusicXML `<staff-lines>` element.
    public let group: Group?

    /// The staff number, from top to bottom on the system, that this element applies to.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLStaffNumber?

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?

    /// A Boolean value indicating whether to leave spacing for an invisible note or object. Used only if no note,
    /// dot, or lyric is being printed. Defaults to `true` if not specified.
    ///
    /// Maps to the MusicXML `print-spacing` attribute.
    public let printsSpacing: Bool?

    /// Whether to show tablature frets as numbers or letters. Defaults to numbers.
    ///
    /// Maps to the MusicXML `show-frets` attribute.
    public let showFrets: MXLShowFrets

    /// The kind of staff, such as ossia, cue, editorial, regular, or alternate.
    ///
    /// Maps to a nested MusicXML `<staff-type>` element.
    public let staffKind: Kind?

    /// How large a staff space is on this staff.
    ///
    /// Maps to a nested MusicXML `<staff-size>` element.
    public let staffSize: MXLStaffSize?

    /// The tunings for each line of a tablature staff.
    ///
    /// Maps to nested MusicXML `<staff-tuning>` elements.
    public let staffTuning: [MXLStaffTuning]
}

// MARK: - Equatable

extension MXLStaffDetails: Equatable {
}

// MARK: - Hashable

extension MXLStaffDetails: Hashable {
}

// MARK: - Sendable

extension MXLStaffDetails: Sendable {
}
