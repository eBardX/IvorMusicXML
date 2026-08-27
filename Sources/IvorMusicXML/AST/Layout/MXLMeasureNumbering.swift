// © 2026 John Gary Pusey (see LICENSE.md)

/// The measure-numbering type describes how frequently measure numbers are displayed on this part. The text
/// attribute from the measure element is used for display, or the number attribute if the text attribute is not
/// present. Measures with an implicit attribute set to “yes” never display a measure number, regardless of the
/// measure-numbering setting.
///
/// The optional staff attribute refers to staff numbers within the part, from top to bottom on the system. It
/// indicates which staff is used as the reference point for vertical positioning. A value of 1 is assumed if not
/// present.
///
/// The optional multiple-rest-always and multiple-rest-range attributes describe how measure numbers are shown on
/// multiple rests when the measure-numbering value is not set to none. The multiple-rest-always attribute is set
/// to yes when the measure number should always be shown, even if the multiple rest starts midway through a
/// system when measure numbering is set to system level. The multiple-rest-range attribute is set to yes when
/// measure numbers on multiple rests display the range of numbers for the first and last measure, rather than
/// just the number of the first measure.
///
/// Maps the MusicXML `<measure-numbering>` element.
public struct MXLMeasureNumbering {

    // MARK: Public Initializers

    /// Creates a new `MXLMeasureNumbering`.
    ///
    /// - Parameter value:                      The value of this element.
    /// - Parameter system:                     Distinguishes measure numbers that are associated with a system rather than the particular part where this element appears.
    /// - Parameter staff:                      The staff used as the reference point for vertical positioning. Refers to staff numbers within the part, from top to bottom on the system. A value of `1` is assumed if not present.
    /// - Parameter alwaysShowsOnMultipleRest:  A Boolean value indicating whether the measure number should always be shown on a multiple rest, even if the multiple rest starts midway through a system when measure numbering is set to system level.
    /// - Parameter showsRangeOnMultipleRest:   A Boolean value indicating whether measure numbers on multiple rests display the range of numbers for the first and last measure, rather than just the number of the first measure.
    /// - Parameter position:                   For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font:                       The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color:                      The color attribute group indicates the color of an element.
    /// - Parameter halign:                     In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
    /// - Parameter valign:                     The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. Defaults are implementation-dependent.
    public init(value: Value,
                system: MXLSystemRelationNumber? = nil,
                staff: MXLStaffNumber? = nil,
                alwaysShowsOnMultipleRest: Bool? = nil,
                showsRangeOnMultipleRest: Bool? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                halign: MXLLeftCenterRight? = nil,
                valign: MXLValign? = nil) {
        self.color = color
        self.font = font
        self.halign = halign
        self.alwaysShowsOnMultipleRest = alwaysShowsOnMultipleRest
        self.showsRangeOnMultipleRest = showsRangeOnMultipleRest
        self.position = position
        self.staff = staff
        self.system = system
        self.valign = valign
        self.value = value
    }

    // MARK: Public Instance Properties

    /// A Boolean value indicating whether the measure number should always be shown on a multiple rest, even if the
    /// multiple rest starts midway through a system when measure numbering is set to system level.
    ///
    /// Maps to the MusicXML `multiple-rest-always` attribute.
    public let alwaysShowsOnMultipleRest: Bool?

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// In cases where text extends over more than one line, horizontal alignment and justify values can be different.
    /// The most typical case is for credits, such as:
    ///
    /// Words and music by Pat Songwriter
    ///
    /// Typically this type of credit is aligned to the right, so that the position information refers to the right-
    /// most part of the text. But in this example, the text is center-justified, not right-justified.
    ///
    /// The halign attribute is used in these situations. If it is not present, its value is the same as for the
    /// justify attribute. For elements where a justify attribute is not allowed, the default is implementation-
    /// dependent.
    ///
    /// Maps to the MusicXML `halign` attribute.
    public let halign: MXLLeftCenterRight?

    /// For most elements, any program will compute a default x and y position. The position attributes let this be
    /// changed two ways.
    ///
    /// The default-x and default-y attributes change the computation of the default position. For most elements, the
    /// origin is changed relative to the left-hand side of the note or the musical position within the bar (x) and
    /// the top line of the staff (y).
    ///
    /// For the following elements, the default-x value changes the origin relative to the start of the current
    /// measure:
    ///
    /// - note - figured-bass - harmony - link - directive - measure-numbering - all descendants of the part-list
    /// element - all children of the direction-type element
    ///
    /// This origin is from the start of the entire measure, at either the left barline or the start of the system.
    ///
    /// When the default-x attribute is used within a child element of the part-name-display, part-abbreviation-
    /// display, group-name-display, or group-abbreviation-display elements, it changes the origin relative to the
    /// start of the first measure on the system. These values are used when the current measure or a succeeding
    /// measure starts a new system. The same change of origin is used for the group-symbol element.
    ///
    /// For the note, figured-bass, and harmony elements, the default-x value is considered to have adjusted the
    /// musical position within the bar for its descendant elements.
    ///
    /// Since the credit-words and credit-image elements are not related to a measure, in these cases the default-x
    /// and default-y attributes adjust the origin relative to the bottom left-hand corner of the specified page.
    ///
    /// The relative-x and relative-y attributes change the position relative to the default position, either as
    /// computed by the individual program, or as overridden by the default-x and default-y attributes.
    ///
    /// Positive x is right, negative x is left; positive y is up, negative y is down. All units are in tenths of
    /// interline space. For stems, positive relative-y lengthens a stem while negative relative-y shortens it.
    ///
    /// The default-x and default-y position attributes provide higher-resolution positioning data than related
    /// features such as the placement attribute and the offset element. Applications reading a MusicXML file that can
    /// understand both features should generally rely on the default-x and default-y attributes for their greater
    /// accuracy. For the relative-x and relative-y attributes, the offset element, placement attribute, and directive
    /// attribute provide context for the relative position information, so the two features should be interpreted
    /// together.
    ///
    /// As elsewhere in the MusicXML format, tenths are the global tenths defined by the scaling element, not the
    /// local tenths of a staff resized by the staff-size element.
    public let position: MXLPosition

    /// A Boolean value indicating whether measure numbers on multiple rests display the range of numbers for the
    /// first and last measure, rather than just the number of the first measure.
    ///
    /// Maps to the MusicXML `multiple-rest-range` attribute.
    public let showsRangeOnMultipleRest: Bool?

    /// The staff used as the reference point for vertical positioning. Refers to staff numbers within the part,
    /// from top to bottom on the system. A value of `1` is assumed if not present.
    ///
    /// Maps to the MusicXML `staff` attribute.
    public let staff: MXLStaffNumber?

    /// Distinguishes measure numbers that are associated with a system rather than the particular part where this
    /// element appears.
    ///
    /// Maps to the MusicXML `system` attribute.
    public let system: MXLSystemRelationNumber?

    /// The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the
    /// text. Defaults are implementation-dependent.
    ///
    /// Maps to the MusicXML `valign` attribute.
    public let valign: MXLValign?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLMeasureNumbering: Equatable {
}

// MARK: - Hashable

extension MXLMeasureNumbering: Hashable {
}

// MARK: - Sendable

extension MXLMeasureNumbering: Sendable {
}
