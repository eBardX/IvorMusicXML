// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseMeasureText(_ text: String) -> MXLMeasureText? {
        MXLMeasureText(stringValue: text)
    }

    internal static func parseScorePartwise(_ node: Node,
                                            _ diagnostics: inout [Diagnostic]) throws -> MXLScorePartwise {
        try node.expectElement(.scorePartwise)

        return try MXLScorePartwise(version: parseDocumentVersion(node, &diagnostics),
                                    work: node.optionalChildElement(.work, parseWork),
                                    movementNumber: node.valueOfOptionalChildElement(.movementNumber),
                                    movementTitle: node.valueOfOptionalChildElement(.movementTitle),
                                    identification: node.optionalChildElement(.identification, parseIdentification),
                                    defaults: node.optionalChildElement(.defaults, parseDefaults),
                                    credit: node.optionalChildElements(.credit, parseCredit),
                                    partList: node.requiredChildElement(.partList, parsePartList),
                                    parts: node.requiredChildElements(.part, parseScorePartwisePart))
    }

    internal static func parseScorePartwisePart(_ node: Node) throws -> MXLScorePartwise.Part {
        try MXLScorePartwise.Part(id: node.valueOfRequiredAttribute(.id),
                                  measures: node.requiredChildElements(.measure, parseScorePartwisePartMeasure))
    }

    internal static func parseScorePartwisePartMeasure(_ node: Node) throws -> MXLScorePartwise.Part.Measure {
        try MXLScorePartwise.Part.Measure(id: node.valueOfOptionalAttribute(.id),
                                          number: node.valueOfRequiredAttribute(.number),
                                          isImplicit: node.valueOfOptionalAttribute(.implicit, parseYesNo),
                                          isNonControlling: node.valueOfOptionalAttribute(.nonControlling, parseYesNo),
                                          text: node.valueOfOptionalAttribute(.text, parseMeasureText),
                                          width: node.valueOfOptionalAttribute(.width, parseTenths),
                                          items: parseMusicItems(node))
    }

    internal static func parseScoreTimewise(_ node: Node,
                                            _ diagnostics: inout [Diagnostic]) throws -> MXLScoreTimewise {
        try node.expectElement(.scoreTimewise)

        return try MXLScoreTimewise(version: parseDocumentVersion(node, &diagnostics),
                                    work: node.optionalChildElement(.work, parseWork),
                                    movementNumber: node.valueOfOptionalChildElement(.movementNumber),
                                    movementTitle: node.valueOfOptionalChildElement(.movementTitle),
                                    identification: node.optionalChildElement(.identification, parseIdentification),
                                    defaults: node.optionalChildElement(.defaults, parseDefaults),
                                    credit: node.optionalChildElements(.credit, parseCredit),
                                    partList: node.requiredChildElement(.partList, parsePartList),
                                    measures: node.requiredChildElements(.measure, parseScoreTimewiseMeasure))
    }

    internal static func parseScoreTimewiseMeasure(_ node: Node) throws -> MXLScoreTimewise.Measure {
        try MXLScoreTimewise.Measure(id: node.valueOfOptionalAttribute(.id),
                                     number: node.valueOfRequiredAttribute(.number),
                                     isImplicit: node.valueOfOptionalAttribute(.implicit, parseYesNo),
                                     isNonControlling: node.valueOfOptionalAttribute(.nonControlling, parseYesNo),
                                     text: node.valueOfOptionalAttribute(.text, parseMeasureText),
                                     width: node.valueOfOptionalAttribute(.width, parseTenths),
                                     parts: node.requiredChildElements(.part, parseScoreTimewiseMeasurePart))
    }

    internal static func parseScoreTimewiseMeasurePart(_ node: Node) throws -> MXLScoreTimewise.Measure.Part {
        try MXLScoreTimewise.Measure.Part(id: node.valueOfRequiredAttribute(.id),
                                          items: parseMusicItems(node))
    }
}
