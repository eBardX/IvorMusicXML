// © 2026 John Gary Pusey (see LICENSE.md)

internal import Foundation
internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseContainer(_ data: Data) throws -> MXLContainer {
        try parseContainer(BaseParser().parse(data).root)
    }

    internal static func parseContainer(_ node: Node) throws -> MXLContainer {
        try node.expectElement(.container)

        return try MXLContainer(rootfiles: node.requiredChildElement(.rootfiles, parseContainerRootfiles))
    }

    internal static func parseContainerRootfile(_ node: Node) throws -> MXLContainer.Rootfile {
        try node.expectElement(.rootfile)

        return try MXLContainer.Rootfile(fullPath: node.valueOfRequiredAttribute(.fullPath),
                                         mediaType: node.valueOfOptionalAttribute(.mediaType))
    }

    internal static func parseContainerRootfiles(_ node: Node) throws -> [MXLContainer.Rootfile] {
        try node.expectElement(.rootfiles)

        return try node.requiredChildElements(.rootfile, parseContainerRootfile)
    }
}
