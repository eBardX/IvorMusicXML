// © 2026 John Gary Pusey (see LICENSE.md)

internal import Foundation
internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parse(_ data: Data) throws -> (MXLDocument, [Diagnostic]) {
        var diagnostics: [Diagnostic] = []

        let content = try parseContent(data, &diagnostics)

        return (MXLDocument(content: content), diagnostics)
    }

    internal static func parseContent(_ data: Data,
                                      _ diagnostics: inout [Diagnostic]) throws -> MXLDocument.Content {
        let rootNode = try BaseParser().parse(data).root

        switch rootNode.element {
        case .opus:
            return try .opus(parseOpus(rootNode, &diagnostics))

        case .scorePartwise:
            return try .scorePartwise(parseScorePartwise(rootNode, &diagnostics))

        case .scoreTimewise:
            return try .scoreTimewise(parseScoreTimewise(rootNode, &diagnostics))

        default:
            try rootNode.unexpectedRootElement()
        }
    }

    internal static func parseDocumentVersion(_ node: Node,
                                              _ diagnostics: inout [Diagnostic]) throws -> MXLDocument.Version? {
        guard let rawValue: String = try node.valueOfOptionalAttribute(.version)
        else {
            diagnostics.append(.defaultedVersion)

            return nil
        }

        let components = rawValue.split(separator: ".",
                                        omittingEmptySubsequences: false)

        guard components.count == 2,
              let major = UInt(components[0]),
              let minor = UInt(components[1])
        else {
            diagnostics.append(.malformedVersion(rawValue))

            return nil
        }

        return MXLDocument.Version(major: major,
                                   minor: minor)
    }
}
