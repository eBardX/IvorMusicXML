// © 2026 John Gary Pusey (see LICENSE.md)

/// The frame type represents a frame or fretboard diagram used together with a chord symbol. The representation
/// is based on the NIFF guitar grid with additional information. The frame type’s unplayed attribute indicates
/// what to display above a string that has no associated frame-note element. Typical values are x and the empty
/// string. If the attribute is not present, the display of the unplayed string is application-defined.
///
/// Maps the MusicXML `<frame>` element.
public struct MXLFrame {

    // MARK: Public Initializers

    /// Creates a new `MXLFrame`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter strings: The frame-strings element gives the overall size of the frame in vertical lines (strings).
    /// - Parameter frets: The frame-frets element gives the overall size of the frame in horizontal spaces (frets).
    /// - Parameter firstFret:  The fret shown in the top space of the frame. Fret 1 if not present.
    /// - Parameter note:  The individual notes included in the frame.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
    /// - Parameter valign: The valign-image attribute is used to indicate vertical alignment for images and graphics, so it removes the baseline value. Defaults are implementation-dependent.
    /// - Parameter height:  The height of the frame diagram.
    /// - Parameter width:  The width of the frame diagram.
    /// - Parameter unplayed:  Indicates what to display above a string that has no associated frame-note element. Typical values are `x` and the empty string. Application-defined if not present.
    public init(id: String? = nil,
                strings: Int,
                frets: Int,
                firstFret: MXLFirstFret? = nil,
                note: [Note] = [],
                position: MXLPosition = MXLPosition(),
                color: MXLColor? = nil,
                halign: MXLLeftCenterRight? = nil,
                valign: MXLValignImage? = nil,
                height: MXLTenths? = nil,
                width: MXLTenths? = nil,
                unplayed: String? = nil) {
        self.color = color
        self.firstFret = firstFret
        self.frets = frets
        self.halign = halign
        self.height = height
        self.id = id
        self.note = note
        self.position = position
        self.strings = strings
        self.unplayed = unplayed
        self.valign = valign
        self.width = width
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The fret shown in the top space of the frame. Fret 1 if not present.
    ///
    /// Maps to a nested MusicXML `<first-fret>` element.
    public let firstFret: MXLFirstFret?

    /// The frame-frets element gives the overall size of the frame in horizontal spaces (frets).
    ///
    /// Maps to a nested MusicXML `<frame-frets>` element.
    public let frets: Int

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

    /// The height of the frame diagram.
    ///
    /// Maps to the MusicXML `height` attribute.
    public let height: MXLTenths?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The individual notes included in the frame.
    ///
    /// Maps to nested MusicXML `<frame-note>` elements.
    public let note: [Note]

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

    /// The frame-strings element gives the overall size of the frame in vertical lines (strings).
    ///
    /// Maps to a nested MusicXML `<frame-strings>` element.
    public let strings: Int

    /// Indicates what to display above a string that has no associated frame-note element. Typical values are `x`
    /// and the empty string. Application-defined if not present.
    ///
    /// Maps to the MusicXML `unplayed` attribute.
    public let unplayed: String?

    /// The valign-image attribute is used to indicate vertical alignment for images and graphics, so it removes the
    /// baseline value. Defaults are implementation-dependent.
    ///
    /// Maps to the MusicXML `valign` attribute.
    public let valign: MXLValignImage?

    /// The width of the frame diagram.
    ///
    /// Maps to the MusicXML `width` attribute.
    public let width: MXLTenths?
}

// MARK: - Equatable

extension MXLFrame: Equatable {
}

// MARK: - Hashable

extension MXLFrame: Hashable {
}

// MARK: - Sendable

extension MXLFrame: Sendable {
}
