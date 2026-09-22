// © 2026 John Gary Pusey (see LICENSE.md)

/// The score-partwise element is the root element for a partwise MusicXML score. It includes a score-header group
/// followed by a series of parts with measures inside. The document-attributes attribute group includes the
/// version attribute.
///
/// Maps the MusicXML `<score-partwise>` element.
public struct MXLScorePartwise {

    // MARK: Public Initializers

    /// Creates a new `MXLScorePartwise`.
    ///
    /// - Parameter version:      The document-attributes attribute group used to specify the attributes for an entire MusicXML document. Defaults to `1.0` if not specified.
    /// - Parameter work:            The work that identifies the piece, optionally including its number and title.
    /// - Parameter movementNumber:  The movement-number element specifies the number of a movement.
    /// - Parameter movementTitle:   The movement-title element specifies the title of a movement, not including its number.
    /// - Parameter identification:  The identification metadata for the score, such as creators, rights, source, and relation information.
    /// - Parameter defaults:        The score-wide defaults for scaling, layout, and default font and language values.
    /// - Parameter credit:          The credits — such as title, composer, and copyright notices — that appear on the first or following pages of the score.
    /// - Parameter partList:        The list of parts that make up the score, along with the part-group elements that indicate braces and brackets between them.
    /// - Parameter parts:         The parts that make up the score, in the same order as they appear in the part list.
    public init(version: MXLDocument.Version? = nil,
                work: MXLWork? = nil,
                movementNumber: String? = nil,
                movementTitle: String? = nil,
                identification: MXLIdentification? = nil,
                defaults: MXLDefaults? = nil,
                credit: [MXLCredit] = [],
                partList: MXLPartList,
                parts: [Part] = []) {
        self.credit = credit
        self.defaults = defaults
        self.identification = identification
        self.movementNumber = movementNumber
        self.movementTitle = movementTitle
        self.partList = partList
        self.parts = parts
        self.version = version ?? .v1_0
        self.work = work
    }

    // MARK: Public Instance Properties

    /// The credits — such as title, composer, and copyright notices — that appear on the first or following pages
    /// of the score.
    ///
    /// Maps to nested MusicXML `<credit>` elements.
    public let credit: [MXLCredit]

    /// The score-wide defaults for scaling, layout, and default font and language values.
    ///
    /// Maps to a nested MusicXML `<defaults>` element.
    public let defaults: MXLDefaults?

    /// The identification metadata for the score, such as creators, rights, source, and relation information.
    ///
    /// Maps to a nested MusicXML `<identification>` element.
    public let identification: MXLIdentification?

    /// The movement-number element specifies the number of a movement.
    ///
    /// Maps to a nested MusicXML `<movement-number>` element.
    public let movementNumber: String?

    /// The movement-title element specifies the title of a movement, not including its number.
    ///
    /// Maps to a nested MusicXML `<movement-title>` element.
    public let movementTitle: String?

    /// The list of parts that make up the score, along with the part-group elements that indicate braces and
    /// brackets between them.
    ///
    /// Maps to a nested MusicXML `<part-list>` element.
    public let partList: MXLPartList

    /// The parts that make up the score, in the same order as they appear in the part list.
    ///
    /// Maps to nested MusicXML `<part>` elements.
    public let parts: [Part]

    /// The document-attributes attribute group is used to specify the attributes for an entire MusicXML document.
    /// Currently this is used for the version attribute.
    ///
    /// The version attribute was added in Version 1.1 for the score-partwise and score-timewise documents. It
    /// provides an easier way to get version information than through the MusicXML public ID. The default value is
    /// 1.0 to make it possible for programs that handle later versions to distinguish earlier version files reliably.
    /// Programs that write MusicXML 1.1 or later files should set this attribute.
    ///
    /// Maps to the MusicXML `version` attribute.
    public let version: MXLDocument.Version

    /// The work that identifies the piece, optionally including its number and title.
    ///
    /// Maps to a nested MusicXML `<work>` element.
    public let work: MXLWork?
}

// MARK: - Equatable

extension MXLScorePartwise: Equatable {
}

// MARK: - Hashable

extension MXLScorePartwise: Hashable {
}

// MARK: - Sendable

extension MXLScorePartwise: Sendable {
}
