// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseAllMargins(_ node: Node) throws -> MXLAllMargins {
        try MXLAllMargins(leftRightMargins: parseLeftRightMargins(node),
                          topMargin: node.valueOfRequiredChildElement(.topMargin, parseTenths),
                          bottomMargin: node.valueOfRequiredChildElement(.bottomMargin, parseTenths))
    }

    internal static func parseAppearance(_ node: Node) throws -> MXLAppearance {
        try MXLAppearance(lineWidth: node.optionalChildElements(.lineWidth, parseLineWidth),
                          noteSize: node.optionalChildElements(.noteSize, parseNoteSize),
                          distance: node.optionalChildElements(.distance, parseDistance),
                          glyph: node.optionalChildElements(.glyph, parseGlyph),
                          otherAppearance: node.optionalChildElements(.otherAppearance, parseOtherAppearance))
    }

    internal static func parseDistance(_ node: Node) throws -> MXLDistance {
        try MXLDistance(value: node.value.flatMap(parseDouble) ?? 0,
                        kind: node.valueOfRequiredAttribute(.type))
    }

    internal static func parseGlyph(_ node: Node) throws -> MXLGlyph {
        try MXLGlyph(value: node.value ?? "",
                     kind: node.valueOfRequiredAttribute(.type))
    }

    internal static func parseLayout(_ node: Node) throws -> MXLLayout {
        try MXLLayout(pageLayout: node.optionalChildElement(.pageLayout, parsePageLayout),
                      systemLayout: node.optionalChildElement(.systemLayout, parseSystemLayout),
                      staffLayout: node.optionalChildElements(.staffLayout, parseStaffLayout))
    }

    internal static func parseLeftRightMargins(_ node: Node) throws -> MXLLeftRightMargins {
        try MXLLeftRightMargins(leftMargin: node.valueOfRequiredChildElement(.leftMargin, parseTenths),
                                rightMargin: node.valueOfRequiredChildElement(.rightMargin, parseTenths))
    }

    internal static func parseLineWidth(_ node: Node) throws -> MXLLineWidth {
        try MXLLineWidth(value: node.value.flatMap(parseDouble) ?? 0,
                         kind: node.valueOfRequiredAttribute(.type))
    }

    internal static func parseMeasureLayout(_ node: Node) throws -> MXLMeasureLayout {
        try MXLMeasureLayout(measureDistance: node.valueOfOptionalChildElement(.measureDistance, parseTenths))
    }

    internal static func parseMeasureNumbering(_ node: Node) throws -> MXLMeasureNumbering {
        try MXLMeasureNumbering(value: node.requiredValue(parseMeasureNumberingValue),
                                system: node.valueOfOptionalAttribute(.system, parseSystemRelationNumber),
                                staff: node.valueOfOptionalAttribute(.staff, parseStaffNumber),
                                alwaysShowsOnMultipleRest: node.valueOfOptionalAttribute(.multipleRestAlways, parseYesNo),
                                showsRangeOnMultipleRest: node.valueOfOptionalAttribute(.multipleRestRange, parseYesNo),
                                position: parsePosition(node),
                                font: parseFont(node),
                                color: parseColor(node),
                                halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                                valign: node.valueOfOptionalAttribute(.valign, parseValign))
    }

    internal static func parseMeasureNumberingValue(_ text: String) -> MXLMeasureNumbering.Value? {
        switch text {
        case "measure":
            .measure

        case "none":
            .never

        case "system":
            .system

        default:
            nil
        }
    }

    internal static func parseOtherAppearance(_ node: Node) throws -> MXLOtherAppearance {
        try MXLOtherAppearance(value: node.value ?? "",
                               kind: node.valueOfRequiredAttribute(.type))
    }

    internal static func parsePageLayout(_ node: Node) throws -> MXLPageLayout {
        try MXLPageLayout(group: node.hasChildElement(.pageHeight) ? parsePageLayoutGroup(node) : nil,
                          pageMargins: node.optionalChildElements(.pageMargins, parsePageMargins))
    }

    internal static func parsePageLayoutGroup(_ node: Node) throws -> MXLPageLayout.Group {
        try MXLPageLayout.Group(pageHeight: node.valueOfRequiredChildElement(.pageHeight, parseTenths),
                                pageWidth: node.valueOfRequiredChildElement(.pageWidth, parseTenths))
    }

    internal static func parsePageMargins(_ node: Node) throws -> MXLPageMargins {
        try MXLPageMargins(allMargins: parseAllMargins(node),
                           kind: node.valueOfOptionalAttribute(.type, parsePageMarginsKind))
    }

    internal static func parsePageMarginsKind(_ text: String) -> MXLPageMargins.Kind? {
        switch text {
        case "both":
            .both

        case "even":
            .even

        case "odd":
            .odd

        default:
            nil
        }
    }

    internal static func parsePrint(_ node: Node) throws -> MXLPrint {
        try MXLPrint(id: node.valueOfOptionalAttribute(.id),
                     layout: parseLayout(node),
                     measureLayout: node.optionalChildElement(.measureLayout, parseMeasureLayout),
                     measureNumbering: node.optionalChildElement(.measureNumbering, parseMeasureNumbering),
                     partNameDisplay: node.optionalChildElement(.partNameDisplay, parseNameDisplay),
                     partAbbreviationDisplay: node.optionalChildElement(.partAbbreviationDisplay, parseNameDisplay),
                     attributes: parsePrintAttributes(node))
    }

    internal static func parsePrintAttributes(_ node: Node) throws -> MXLPrint.Attributes {
        try MXLPrint.Attributes(staffSpacing: node.valueOfOptionalAttribute(.staffSpacing, parseTenths),
                                startsNewSystem: node.valueOfOptionalAttribute(.newSystem, parseYesNo),
                                startsNewPage: node.valueOfOptionalAttribute(.newPage, parseYesNo),
                                blankPage: node.valueOfOptionalAttribute(.blankPage, parseInt),
                                pageNumber: node.valueOfOptionalAttribute(.pageNumber))
    }

    internal static func parsePrintout(_ node: Node) throws -> MXLPrintout {
        try MXLPrintout(printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                        printsDot: node.valueOfOptionalAttribute(.printDot, parseYesNo),
                        printsSpacing: node.valueOfOptionalAttribute(.printSpacing, parseYesNo),
                        printsLyric: node.valueOfOptionalAttribute(.printLyric, parseYesNo))
    }

    internal static func parseScaling(_ node: Node) throws -> MXLScaling {
        try MXLScaling(millimeters: node.valueOfRequiredChildElement(.millimeters, parseMillimeters),
                       tenths: node.valueOfRequiredChildElement(.tenths, parseTenths))
    }

    internal static func parseStaffLayout(_ node: Node) throws -> MXLStaffLayout {
        try MXLStaffLayout(staffDistance: node.valueOfOptionalChildElement(.staffDistance, parseTenths),
                           number: node.valueOfOptionalAttribute(.number, parseStaffNumber))
    }

    internal static func parseSystemDividers(_ node: Node) throws -> MXLSystemDividers {
        try MXLSystemDividers(leftDivider: node.requiredChildElement(.leftDivider, parseEmptyPrintObjectStyleAlign),
                              rightDivider: node.requiredChildElement(.rightDivider, parseEmptyPrintObjectStyleAlign))
    }

    internal static func parseSystemLayout(_ node: Node) throws -> MXLSystemLayout {
        try MXLSystemLayout(systemMargins: node.optionalChildElement(.systemMargins, parseSystemMargins),
                            systemDistance: node.valueOfOptionalChildElement(.systemDistance, parseTenths),
                            topSystemDistance: node.valueOfOptionalChildElement(.topSystemDistance, parseTenths),
                            systemDividers: node.optionalChildElement(.systemDividers, parseSystemDividers))
    }

    internal static func parseSystemMargins(_ node: Node) throws -> MXLSystemMargins {
        try MXLSystemMargins(leftRightMargins: parseLeftRightMargins(node))
    }
}
