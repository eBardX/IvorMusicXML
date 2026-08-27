// © 2026 John Gary Pusey (see LICENSE.md)

/// The pedal type represents piano pedal marks, including damper and sostenuto pedal marks. The line attribute is
/// yes if pedal lines are used. The sign attribute is yes if Ped, Sost, and * signs are used. For compatibility
/// with older versions, the sign attribute is yes by default if the line attribute is no, and is no by default if
/// the line attribute is yes. If the sign attribute is set to yes and the type is start or sostenuto, the
/// abbreviated attribute is yes if the short P and S signs are used, and no if the full Ped and Sost signs are
/// used. It is no by default. Otherwise the abbreviated attribute is ignored. The alignment attributes are
/// ignored if the sign attribute is no.
///
/// Maps the MusicXML `<pedal>` element.
public struct MXLPedal {

    // MARK: Public Initializers

    /// Creates a new `MXLPedal`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter kind: Indicates the type of pedal mark, such as start, stop, sostenuto, or change.
    /// - Parameter number: Distinguishes multiple pedals occurring simultaneously.
    /// - Parameter usesLines: A Boolean value indicating whether pedal lines are used.
    /// - Parameter usesSigns: A Boolean value indicating whether Ped, Sost, and * signs are used.
    /// - Parameter isAbbreviated: A Boolean value indicating whether the short P and S signs are used instead of the full Ped and Sost signs, when the sign attribute is set and the type is start or sostenuto.
    /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font: The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color: The color attribute group indicates the color of an element.
    /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
    /// - Parameter valign: The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the text. Defaults are implementation-dependent.
    public init(id: String? = nil,
                kind: Kind,
                number: MXLNumberLevel? = nil,
                usesLines: Bool? = nil,
                usesSigns: Bool? = nil,
                isAbbreviated: Bool? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                halign: MXLLeftCenterRight? = nil,
                valign: MXLValign? = nil) {
        self.isAbbreviated = isAbbreviated
        self.color = color
        self.font = font
        self.halign = halign
        self.id = id
        self.usesLines = usesLines
        self.number = number
        self.position = position
        self.usesSigns = usesSigns
        self.valign = valign
        self.kind = kind
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names.The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
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

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// A Boolean value indicating whether the short P and S signs are used instead of the full Ped and Sost signs,
    /// when the sign attribute is set and the type is start or sostenuto.
    ///
    /// Maps to the MusicXML `abbreviated` attribute.
    public let isAbbreviated: Bool?

    /// Indicates the type of pedal mark, such as start, stop, sostenuto, or change.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let kind: Kind

    /// Distinguishes multiple pedals occurring simultaneously.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLNumberLevel?

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

    /// A Boolean value indicating whether pedal lines are used.
    ///
    /// Maps to the MusicXML `line` attribute.
    public let usesLines: Bool?

    /// A Boolean value indicating whether Ped, Sost, and * signs are used.
    ///
    /// Maps to the MusicXML `sign` attribute.
    public let usesSigns: Bool?

    /// The valign attribute is used to indicate vertical alignment to the top, middle, bottom, or baseline of the
    /// text. Defaults are implementation-dependent.
    ///
    /// Maps to the MusicXML `valign` attribute.
    public let valign: MXLValign?
}

// MARK: - Equatable

extension MXLPedal: Equatable {
}

// MARK: - Hashable

extension MXLPedal: Hashable {
}

// MARK: - Sendable

extension MXLPedal: Sendable {
}
