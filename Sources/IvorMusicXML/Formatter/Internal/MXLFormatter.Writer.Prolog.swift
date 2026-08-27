// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // The document type declaration written ahead of a root element. Each
    // root MusicXML defines as a document element has its own public and
    // system identifier pair; the identifiers are otherwise identical in
    // shape, differing only in the hierarchy word and the DTD file name.
    internal enum Prolog {

        // The prolog for an `<opus>` root.
        case opus

        // The prolog for a `<score-partwise>` root.
        case partwise

        // The prolog for a `<score-timewise>` root.
        case timewise
    }
}

// MARK: -

extension MXLFormatter.Writer.Prolog {

    // MARK: Internal Instance Properties

    // The word naming this root in the public identifier.
    internal var hierarchy: String {
        switch self {
        case .opus:
            "Opus"

        case .partwise:
            "Partwise"

        case .timewise:
            "Timewise"
        }
    }

    // The root element name, which is also the DTD file name stem.
    internal var name: String {
        switch self {
        case .opus:
            "opus"

        case .partwise:
            "score-partwise"

        case .timewise:
            "score-timewise"
        }
    }

    // The stem of the DTD file named by the system identifier.
    internal var systemIDStem: String {
        switch self {
        case .opus:
            "opus"

        case .partwise:
            "partwise"

        case .timewise:
            "timewise"
        }
    }
}
