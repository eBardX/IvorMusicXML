// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDocument {

    /// The content of a top-level MusicXML document, one case per root element
    /// the parser accepts.
    ///
    /// These are exactly the three document elements a MusicXML root file may
    /// have (`container.xsd:128`). `<container>` is an archive implementation
    /// detail rather than a document, and `<sounds>` is a flat list of identifier
    /// strings rather than a score, so neither has a case here.
    public enum Content {
        /// A MusicXML opus.
        case opus(MXLOpus)

        /// A part-wise MusicXML score.
        case scorePartwise(MXLScorePartwise)

        /// A time-wise MusicXML score.
        case scoreTimewise(MXLScoreTimewise)
    }
}

// MARK: - Equatable

extension MXLDocument.Content: Equatable {
}

// MARK: - Hashable

extension MXLDocument.Content: Hashable {
}

// MARK: - Sendable

extension MXLDocument.Content: Sendable {
}
