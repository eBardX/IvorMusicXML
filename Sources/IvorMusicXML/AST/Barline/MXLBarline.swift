// © 2026 John Gary Pusey (see LICENSE.md)

/// If a barline is other than a normal single barline, it should be represented by a barline type that describes
/// it. This includes information about repeats and multiple endings, as well as line style. Barline data is on
/// the same level as the other musical data in a score — a child of a measure in a partwise score, or a part in a
/// timewise score. This allows for barlines within measures, as in dotted barlines that subdivide measures in
/// complex meters. The two fermata elements allow for fermatas on both sides of the barline (the lower one
/// inverted).
///
/// Barlines have a location attribute to make it easier to process barlines independently of the other musical
/// data in a score. It is often easier to set up measures separately from entering notes. The location attribute
/// must match where the barline element occurs within the rest of the musical data in the score. If location is
/// left, it should be the first element in the measure, aside from the print, bookmark, and link elements. If
/// location is right, it should be the last element, again with the possible exception of the print, bookmark,
/// and link elements. If no location is specified, the right barline is the default. The segno, coda, and
/// divisions attributes work the same way as in the sound element. They are used for playback when barline
/// elements contain segno or coda child elements.
///
/// Maps the MusicXML `<barline>` element.
public struct MXLBarline {

    // MARK: Public Initializers

    /// Creates a new `MXLBarline`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter barStyle:  The style and color of the barline.
    /// - Parameter footnote: The footnote element specifies editorial information that appears in footnotes in the printed score. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter level: The level element specifies editorial information for different MusicXML elements. It is defined within a group due to its multiple uses within the MusicXML schema.
    /// - Parameter wavyLine:  A wavy line associated with the barline, such as for a trill or vibrato that continues across it.
    /// - Parameter segno:  The visual indicator of a segno sign appearing at this barline.
    /// - Parameter coda:  The visual indicator of a coda sign appearing at this barline.
    /// - Parameter fermata:  The fermata signs on either side of the barline, allowing fermatas on both sides (the lower one inverted).
    /// - Parameter ending:  The multiple-ending bracket associated with this barline.
    /// - Parameter repeat:  The repeat mark associated with this barline.
    /// - Parameter location: Defaults to `right`.
    /// - Parameter segnoAttribute:  Used the same way as the segno attribute of the sound element, to name and distinguish forward jumps to a segno sign for playback.
    /// - Parameter codaAttribute:  Used the same way as the coda attribute of the sound element, to name and distinguish forward jumps to a coda sign for playback.
    /// - Parameter divisions:  Used the same way as the divisions attribute of the sound element, to indicate the number of divisions per quarter note for playback when this barline contains a segno or coda child element.
    public init(id: String? = nil,
                barStyle: StyleColor? = nil,
                footnote: MXLFormattedText? = nil,
                level: MXLLevel? = nil,
                wavyLine: MXLWavyLine? = nil,
                segno: MXLSegno? = nil,
                coda: MXLCoda? = nil,
                fermata: [MXLFermata] = [],
                ending: MXLEnding? = nil,
                repeat: MXLRepeat? = nil,
                location: MXLRightLeftMiddle? = nil,
                segnoAttribute: String? = nil,
                codaAttribute: String? = nil,
                divisions: MXLDivisions? = nil) {
        self.barStyle = barStyle
        self.coda = coda
        self.codaAttribute = codaAttribute
        self.divisions = divisions
        self.ending = ending
        self.fermata = fermata
        self.footnote = footnote
        self.id = id
        self.level = level
        self.location = location ?? .right
        self.repeat = `repeat`
        self.segno = segno
        self.segnoAttribute = segnoAttribute
        self.wavyLine = wavyLine
    }

    // MARK: Public Instance Properties

    /// The style and color of the barline.
    ///
    /// Maps to a nested MusicXML `<bar-style>` element.
    public let barStyle: StyleColor?

    /// The visual indicator of a coda sign appearing at this barline.
    ///
    /// Maps to a nested MusicXML `<coda>` element.
    public let coda: MXLCoda?

    /// Used the same way as the coda attribute of the sound element, to name and distinguish forward jumps to a coda
    /// sign for playback.
    ///
    /// Maps to the MusicXML `coda` attribute.
    public let codaAttribute: String?

    /// Used the same way as the divisions attribute of the sound element, to indicate the number of divisions per
    /// quarter note for playback when this barline contains a segno or coda child element.
    ///
    /// Maps to the MusicXML `divisions` attribute.
    public let divisions: MXLDivisions?

    /// The multiple-ending bracket associated with this barline.
    ///
    /// Maps to a nested MusicXML `<ending>` element.
    public let ending: MXLEnding?

    /// The fermata signs on either side of the barline, allowing fermatas on both sides (the lower one inverted).
    ///
    /// Maps to nested MusicXML `<fermata>` elements.
    public let fermata: [MXLFermata]

    /// The footnote element specifies editorial information that appears in footnotes in the printed score. It is
    /// defined within a group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<footnote>` element.
    public let footnote: MXLFormattedText?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The level element specifies editorial information for different MusicXML elements. It is defined within a
    /// group due to its multiple uses within the MusicXML schema.
    ///
    /// Maps to a nested MusicXML `<level>` element.
    public let level: MXLLevel?

    /// Defaults to `right`.
    ///
    /// Maps to the MusicXML `location` attribute.
    public let location: MXLRightLeftMiddle

    /// The repeat mark associated with this barline.
    ///
    /// Maps to a nested MusicXML `<repeat>` element.
    public let `repeat`: MXLRepeat?

    /// The visual indicator of a segno sign appearing at this barline.
    ///
    /// Maps to a nested MusicXML `<segno>` element.
    public let segno: MXLSegno?

    /// Used the same way as the segno attribute of the sound element, to name and distinguish forward jumps to a
    /// segno sign for playback.
    ///
    /// Maps to the MusicXML `segno` attribute.
    public let segnoAttribute: String?

    /// A wavy line associated with the barline, such as for a trill or vibrato that continues across it.
    ///
    /// Maps to a nested MusicXML `<wavy-line>` element.
    public let wavyLine: MXLWavyLine?
}

// MARK: - Equatable

extension MXLBarline: Equatable {
}

// MARK: - Hashable

extension MXLBarline: Hashable {
}

// MARK: - Sendable

extension MXLBarline: Sendable {
}
