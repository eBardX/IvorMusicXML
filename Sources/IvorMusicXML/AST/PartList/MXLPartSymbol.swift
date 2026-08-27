// © 2026 John Gary Pusey (see LICENSE.md)

/// The part-symbol type indicates how a symbol for a multi-staff part is indicated in the score; brace is the
/// default value. The top-staff and bottom-staff attributes are used when the brace does not extend across the
/// entire part. For example, in a 3-staff organ part, the top-staff will typically be 1 for the right hand, while
/// the bottom-staff will typically be 2 for the left hand. Staff 3 for the pedals is usually outside the brace.
/// By default, the presence of a part-symbol element that does not extend across the entire part also indicates a
/// corresponding change in the common barlines within a part.
///
/// Maps the MusicXML `<part-symbol>` element.
public struct MXLPartSymbol {

    // MARK: Public Initializers

    /// Creates a new `MXLPartSymbol`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter topStaff: The staff number of the topmost staff spanned by the symbol, used when the symbol does not extend across the entire part.
    /// - Parameter bottomStaff: The staff number of the bottommost staff spanned by the symbol, used when the symbol does not extend across the entire part.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter color: The color attribute group indicates the color of an element.
    public init(value: MXLGroupSymbolValue,
                topStaff: MXLStaffNumber? = nil,
                bottomStaff: MXLStaffNumber? = nil,
                position: MXLPosition = MXLPosition(),
                color: MXLColor? = nil) {
        self.bottomStaff = bottomStaff
        self.color = color
        self.position = position
        self.topStaff = topStaff
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The staff number of the bottommost staff spanned by the symbol, used when the symbol does not extend across
    /// the entire part.
    ///
    /// Maps to the MusicXML `bottom-staff` attribute.
    public let bottomStaff: MXLStaffNumber?

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

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

    /// The staff number of the topmost staff spanned by the symbol, used when the symbol does not extend across the
    /// entire part.
    ///
    /// Maps to the MusicXML `top-staff` attribute.
    public let topStaff: MXLStaffNumber?

    /// The value of this element.
    public let value: MXLGroupSymbolValue
}

// MARK: - Equatable

extension MXLPartSymbol: Equatable {
}

// MARK: - Hashable

extension MXLPartSymbol: Hashable {
}

// MARK: - Sendable

extension MXLPartSymbol: Sendable {
}
