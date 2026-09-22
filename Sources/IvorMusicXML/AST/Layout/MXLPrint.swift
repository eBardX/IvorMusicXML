// © 2026 John Gary Pusey (see LICENSE.md)

/// The print type contains general printing parameters, including layout elements. The part-name-display and
/// part-abbreviation-display elements may also be used here to change how a part name or abbreviation is
/// displayed over the course of a piece. They take effect when the current measure or a succeeding measure starts
/// a new system.
///
/// Layout group elements in a print element only apply to the current page, system, or staff. Music that follows
/// continues to take the default values from the layout determined by the defaults element.
///
/// Maps the MusicXML `<print>` element.
public struct MXLPrint {

    // MARK: Public Initializers

    /// Creates a new `MXLPrint`.
    ///
    /// - Parameter id:                       The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter layout:                   The layout group specifies the sequence of page, system, and staff layout elements that is common to both the defaults and print elements.
    /// - Parameter measureLayout:            Specifies the horizontal distance from the previous measure, in tenths.
    /// - Parameter measureNumbering:         Specifies details about measure numbering displayed at this point in the score.
    /// - Parameter partNameDisplay:          Changes how the part name is displayed, taking effect when the current measure or a succeeding measure starts a new system.
    /// - Parameter partAbbreviationDisplay:  Changes how the part abbreviation is displayed, taking effect when the current measure or a succeeding measure starts a new system.
    /// - Parameter attributes:               The print-attributes group is used by the print element. The new-system and new-page attributes indicate whether to force a system or page break, or to force the current music onto the same system or page as the preceding music. Normally this is the first music data within a measure. If used in multi-part music, they should be placed in the same positions within each part, or the results are undefined. The page-number attribute sets the number of a new page; it is ignored if new-page is not “yes”. Version 2.0 adds a blank-page attribute. This is a positive integer value that specifies the number of blank pages to insert before the current measure. It is ignored if new-page is not “yes”. These blank pages have no music, but may have text or images specified by the credit element. This is used to allow a combination of pages that are all text, or all text and images, together with pages of music.
    public init(id: String? = nil,
                layout: MXLLayout = MXLLayout(),
                measureLayout: MXLMeasureLayout? = nil,
                measureNumbering: MXLMeasureNumbering? = nil,
                partNameDisplay: MXLNameDisplay? = nil,
                partAbbreviationDisplay: MXLNameDisplay? = nil,
                attributes: Attributes) {
        self.attributes = attributes
        self.id = id
        self.layout = layout
        self.measureLayout = measureLayout
        self.measureNumbering = measureNumbering
        self.partAbbreviationDisplay = partAbbreviationDisplay
        self.partNameDisplay = partNameDisplay
    }

    // MARK: Public Instance Properties

    /// The print-attributes group is used by the print element. The new-system and new-page attributes indicate
    /// whether to force a system or page break, or to force the current music onto the same system or page as the
    /// preceding music. Normally this is the first music data within a measure. If used in multi-part music, they
    /// should be placed in the same positions within each part, or the results are undefined. The page-number
    /// attribute sets the number of a new page; it is ignored if new-page is not “yes”. Version 2.0 adds a blank-page
    /// attribute. This is a positive integer value that specifies the number of blank pages to insert before the
    /// current measure. It is ignored if new-page is not “yes”. These blank pages have no music, but may have text or
    /// images specified by the credit element. This is used to allow a combination of pages that are all text, or all
    /// text and images, together with pages of music.
    ///
    /// The staff-spacing attribute specifies spacing between multiple staves in tenths of staff space. This is
    /// deprecated as of Version 1.1; the staff-layout element should be used instead. If both are present, the staff-
    /// layout values take priority.
    public let attributes: Attributes

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// The layout group specifies the sequence of page, system, and staff layout elements that is common to both the
    /// defaults and print elements.
    public let layout: MXLLayout

    /// Specifies the horizontal distance from the previous measure, in tenths.
    ///
    /// Maps to a nested MusicXML `<measure-layout>` element.
    public let measureLayout: MXLMeasureLayout?

    /// Specifies details about measure numbering displayed at this point in the score.
    ///
    /// Maps to a nested MusicXML `<measure-numbering>` element.
    public let measureNumbering: MXLMeasureNumbering?

    /// Changes how the part abbreviation is displayed, taking effect when the current measure or a succeeding
    /// measure starts a new system.
    ///
    /// Maps to a nested MusicXML `<part-abbreviation-display>` element.
    public let partAbbreviationDisplay: MXLNameDisplay?

    /// Changes how the part name is displayed, taking effect when the current measure or a succeeding measure
    /// starts a new system.
    ///
    /// Maps to a nested MusicXML `<part-name-display>` element.
    public let partNameDisplay: MXLNameDisplay?
}

// MARK: - Equatable

extension MXLPrint: Equatable {
}

// MARK: - Hashable

extension MXLPrint: Hashable {
}

// MARK: - Sendable

extension MXLPrint: Sendable {
}
