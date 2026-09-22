// © 2026 John Gary Pusey (see LICENSE.md)

/// If the staff-lines element is present, the appearance of each line may be individually specified with a line-
/// detail type. Staff lines are numbered from bottom to top. The print-object attribute allows lines to be hidden
/// within a staff. This is used in special situations such as a widely-spaced percussion staff where a note
/// placed below the higher line is distinct from a note placed above the lower line. Hidden staff lines are
/// included when specifying clef lines and determining display-step / display-octave values, but are not counted
/// as lines for the purposes of the system-layout and staff-layout elements.
///
/// Maps the MusicXML `<line-detail>` element.
public struct MXLLineDetail {

    // MARK: Public Initializers

    /// Creates a new `MXLLineDetail`.
    ///
    /// - Parameter line: The staff line being configured, counted from the bottom of the staff.
    /// - Parameter width: The width of the line, in tenths, if different from the default.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter lineKind: The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    public init(line: MXLStaffLine,
                width: MXLTenths? = nil,
                color: MXLColor? = nil,
                lineKind: MXLLineKind? = nil,
                printsObject: Bool? = nil) {
        self.color = color
        self.line = line
        self.lineKind = lineKind
        self.printsObject = printsObject
        self.width = width
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The staff line being configured, counted from the bottom of the staff.
    ///
    /// Maps to the MusicXML `line` attribute.
    public let line: MXLStaffLine

    /// The line-type attribute distinguishes between solid, dashed, dotted, and wavy lines.
    ///
    /// Maps to the MusicXML `line-type` attribute.
    public let lineKind: MXLLineKind?

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?

    /// The width of the line, in tenths, if different from the default.
    ///
    /// Maps to the MusicXML `width` attribute.
    public let width: MXLTenths?
}

// MARK: - Equatable

extension MXLLineDetail: Equatable {
}

// MARK: - Hashable

extension MXLLineDetail: Hashable {
}

// MARK: - Sendable

extension MXLLineDetail: Sendable {
}
