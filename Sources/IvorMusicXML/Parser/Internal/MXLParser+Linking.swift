// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseBookmark(_ node: Node) throws -> MXLBookmark {
        try MXLBookmark(id: node.valueOfRequiredAttribute(.id),
                        name: node.valueOfOptionalAttribute(.name),
                        elementPosition: parseElementPosition(node))
    }

    internal static func parseLink(_ node: Node) throws -> MXLLink {
        try MXLLink(xlink: parseXLink(node),
                    name: node.valueOfOptionalAttribute(.name),
                    elementPosition: parseElementPosition(node),
                    position: parsePosition(node))
    }

    internal static func parseXLink(_ node: Node) throws -> MXLXLink {
        try MXLXLink(href: node.valueOfRequiredAttribute(.xlinkHref),
                     actuate: node.valueOfOptionalAttribute(.xlinkActuate, parseXLinkActuate) ?? .onRequest,
                     role: node.valueOfOptionalAttribute(.xlinkRole),
                     show: node.valueOfOptionalAttribute(.xlinkShow, parseXLinkShow) ?? .replace,
                     title: node.valueOfOptionalAttribute(.xlinkTitle))
    }

    internal static func parseXLinkActuate(_ text: String) -> MXLXLink.Actuate? {
        switch text {
        case "none":
            .unspecified

        case "onLoad":
            .onLoad

        case "onRequest":
            .onRequest

        case "other":
            .other

        default:
            nil
        }
    }

    internal static func parseXLinkShow(_ text: String) -> MXLXLink.Show? {
        switch text {
        case "embed":
            .embed

        case "new":
            .new

        case "none":
            .undefined

        case "other":
            .other

        case "replace":
            .replace

        default:
            nil
        }
    }
}
