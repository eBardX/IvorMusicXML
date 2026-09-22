// © 2026 John Gary Pusey (see LICENSE.md)

/// The harmonic type indicates natural and artificial harmonics. Allowing the type of pitch to be specified,
/// combined with controls for appearance/playback differences, allows both the notation and the sound to be
/// represented. Artificial harmonics can add a notated touching pitch; artificial pinch harmonics will usually
/// not notate a touching pitch. The attributes for the harmonic element refer to the use of the circular harmonic
/// symbol, typically but not always used with natural harmonics.
///
/// Maps the MusicXML `<harmonic>` element.
public struct MXLHarmonic {

    // MARK: Public Initializers

    /// Creates a new `MXLHarmonic`.
    ///
    /// - Parameter content:       One of the alternatives for Harmonic.
    /// - Parameter content2:      One of the alternatives for Harmonic.
    /// - Parameter printsObject:  A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    /// - Parameter position:      For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
    /// - Parameter font:          The font attribute group gathers together attributes for determining the font within a credit or direction. They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font vs. a music font.
    /// - Parameter color:         The color attribute group indicates the color of an element.
    /// - Parameter placement:     The placement attribute indicates whether something is above or below another element, such as a note or a notation.
    public init(content: Content? = nil,
                content2: Content2? = nil,
                printsObject: Bool? = nil,
                position: MXLPosition = MXLPosition(),
                font: MXLFont = MXLFont(),
                color: MXLColor? = nil,
                placement: MXLAboveBelow? = nil) {
        self.color = color
        self.content = content
        self.content2 = content2
        self.font = font
        self.placement = placement
        self.position = position
        self.printsObject = printsObject
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// One of the alternatives for Harmonic.
    public let content: Content?

    /// One of the alternatives for Harmonic.
    public let content2: Content2?

    /// The font attribute group gathers together attributes for determining the font within a credit or direction.
    /// They are based on the text styles for Cascading Style Sheets. The font-family is a comma-separated list of
    /// font names. The font-style can be normal or italic. The font-size can be one of the CSS sizes or a numeric
    /// point size. The font-weight can be normal or bold. The default is application-dependent, but is a text font
    /// vs. a music font.
    public let font: MXLFont

    /// The placement attribute indicates whether something is above or below another element, such as a note or a
    /// notation.
    ///
    /// Maps to the MusicXML `placement` attribute.
    public let placement: MXLAboveBelow?

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

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?
}

// MARK: - Equatable

extension MXLHarmonic: Equatable {
}

// MARK: - Hashable

extension MXLHarmonic: Hashable {
}

// MARK: - Sendable

extension MXLHarmonic: Sendable {
}
