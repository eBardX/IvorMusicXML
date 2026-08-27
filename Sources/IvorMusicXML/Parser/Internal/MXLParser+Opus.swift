// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseOpus(_ node: Node,
                                   _ diagnostics: inout [Diagnostic]) throws -> MXLOpus {
        try node.expectElement(.opus)

        let version = try parseDocumentVersion(node, &diagnostics)
        let title: String? = try node.valueOfOptionalChildElement(.title)
        let items = try node.optionalChildElements([.opus, .opusLink, .score]) {
            try parseOpusItem($0, &diagnostics)
        }

        return MXLOpus(version: version,
                       title: title,
                       items: items)
    }

    internal static func parseOpusItem(_ node: Node,
                                       _ diagnostics: inout [Diagnostic]) throws -> MXLOpus.Item {
        switch node.element {
        case .opus:
            try .opus(parseOpus(node, &diagnostics))

        case .opusLink:
            try .opusLink(parseXLink(node))

        case .score:
            try .score(parseOpusScore(node))

        default:
            try node.unexpectedElement([.opus, .opusLink, .score])
        }
    }

    internal static func parseOpusScore(_ node: Node) throws -> MXLOpus.Score {
        try MXLOpus.Score(newPage: node.valueOfOptionalAttribute(.newPage, parseYesNo),
                          xlink: parseXLink(node))
    }
}
