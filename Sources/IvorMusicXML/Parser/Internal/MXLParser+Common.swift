// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

private import Foundation

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func emptyTextElementData() -> MXLTextElementData {
        MXLTextElementData(value: "",
                           font: MXLFont(family: nil, style: nil, size: nil, weight: nil),
                           color: nil,
                           underline: nil,
                           overline: nil,
                           lineThrough: nil,
                           rotation: nil,
                           letterSpacing: nil,
                           xmlLang: nil,
                           dir: nil)
    }

    internal static func parseAboveBelow(_ text: String) -> MXLAboveBelow? {
        switch text {
        case "above":
            .above

        case "below":
            .below

        default:
            nil
        }
    }

    internal static func parseColor(_ node: Node) throws -> MXLColor? {
        try node.valueOfOptionalAttribute(.color, parseColor)
    }

    internal static func parseColor(_ text: String) -> MXLColor? {
        MXLColor(stringValue: text)
    }

    internal static func parseCommaSeparatedText(_ text: String) -> MXLCommaSeparatedText? {
        text.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }
    }

    internal static func parseCssFontSize(_ text: String) -> MXLCssFontSize? {
        switch text {
        case "large":
            .large

        case "medium":
            .medium

        case "small":
            .small

        case "x-large":
            .xLarge

        case "x-small":
            .xSmall

        case "xx-large":
            .xxLarge

        case "xx-small":
            .xxSmall

        default:
            nil
        }
    }

    internal static func parseDouble(_ node: Node) throws -> MXLDouble {
        try MXLDouble(isAbove: node.valueOfOptionalAttribute(.above, parseYesNo))
    }

    internal static func parseDouble(_ text: String) -> Double? {
        Double(text)
    }

    internal static func parseElementPosition(_ node: Node) throws -> MXLElementPosition {
        try MXLElementPosition(element: node.valueOfOptionalAttribute(.element),
                               position: node.valueOfOptionalAttribute(.position, parseInt))
    }

    internal static func parseEmptyLine(_ node: Node) throws -> MXLEmptyLine {
        try MXLEmptyLine(shape: node.valueOfOptionalAttribute(.lineShape, parseLineShape),
                         kind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                         length: node.valueOfOptionalAttribute(.lineLength, parseLineLength),
                         dashedFormatting: parseDashedFormatting(node),
                         printStyle: parsePrintStyle(node),
                         placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseEmptyPlacement(_ node: Node) throws -> MXLEmptyPlacement {
        try MXLEmptyPlacement(printStyle: parsePrintStyle(node),
                              placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow))
    }

    internal static func parseEmptyPrintObjectStyleAlign(_ node: Node) throws -> MXLEmptyPrintObjectStyleAlign {
        try MXLEmptyPrintObjectStyleAlign(printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                                          printStyleAlign: parsePrintStyleAlign(node))
    }

    internal static func parseEmptyPrintStyleAlignID(_ node: Node) throws -> MXLEmptyPrintStyleAlignID {
        try MXLEmptyPrintStyleAlignID(id: node.valueOfOptionalAttribute(.id),
                                      printStyleAlign: parsePrintStyleAlign(node))
    }

    internal static func parseEnclosureShape(_ text: String) -> MXLEnclosureShape? {
        switch text {
        case "bracket":
            .bracket

        case "circle":
            .circle

        case "decagon":
            .decagon

        case "diamond":
            .diamond

        case "heptagon":
            .heptagon

        case "hexagon":
            .hexagon

        case "inverted-bracket":
            .invertedBracket

        case "nonagon":
            .nonagon

        case "none":
            .unenclosed

        case "octagon":
            .octagon

        case "oval":
            .oval

        case "pentagon":
            .pentagon

        case "rectangle":
            .rectangle

        case "square":
            .square

        case "triangle":
            .triangle

        default:
            nil
        }
    }

    internal static func parseFont(_ node: Node) throws -> MXLFont {
        try MXLFont(family: node.valueOfOptionalAttribute(.fontFamily, parseCommaSeparatedText),
                    style: node.valueOfOptionalAttribute(.fontStyle, parseFontStyle),
                    size: node.valueOfOptionalAttribute(.fontSize, parseFontSize),
                    weight: node.valueOfOptionalAttribute(.fontWeight, parseFontWeight))
    }

    internal static func parseFontSize(_ text: String) -> MXLFont.Size? {
        if let css = parseCssFontSize(text) {
            return .css(css)
        }

        return Double(text).map { .point($0) }
    }

    internal static func parseFontStyle(_ text: String) -> MXLFont.Style? {
        switch text {
        case "italic":
            .italic

        case "normal":
            .normal

        default:
            nil
        }
    }

    internal static func parseFontWeight(_ text: String) -> MXLFont.Weight? {
        switch text {
        case "bold":
            .bold

        case "normal":
            .normal

        default:
            nil
        }
    }

    internal static func parseFormattedSymbolID(_ node: Node) throws -> MXLFormattedSymbolID {
        try MXLFormattedSymbolID(id: node.valueOfOptionalAttribute(.id),
                                 value: node.value ?? "",
                                 justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight),
                                 position: parsePosition(node),
                                 font: parseFont(node),
                                 color: parseColor(node),
                                 halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                                 valign: node.valueOfOptionalAttribute(.valign, parseValign),
                                 underline: node.valueOfOptionalAttribute(.underline, parseNumberOfLines),
                                 overline: node.valueOfOptionalAttribute(.overline, parseNumberOfLines),
                                 lineThrough: node.valueOfOptionalAttribute(.lineThrough, parseNumberOfLines),
                                 rotation: node.valueOfOptionalAttribute(.rotation, parseRotationDegrees),
                                 letterSpacing: node.valueOfOptionalAttribute(.letterSpacing, parseNumberOrNormal),
                                 lineHeight: node.valueOfOptionalAttribute(.lineHeight, parseNumberOrNormal),
                                 dir: node.valueOfOptionalAttribute(.dir, parseTextDirection),
                                 enclosure: node.valueOfOptionalAttribute(.enclosure, parseEnclosureShape))
    }

    internal static func parseFormattedText(_ node: Node) throws -> MXLFormattedText {
        try MXLFormattedText(value: node.value ?? "",
                             justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight),
                             position: parsePosition(node),
                             font: parseFont(node),
                             color: parseColor(node),
                             halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                             valign: node.valueOfOptionalAttribute(.valign, parseValign),
                             underline: node.valueOfOptionalAttribute(.underline, parseNumberOfLines),
                             overline: node.valueOfOptionalAttribute(.overline, parseNumberOfLines),
                             lineThrough: node.valueOfOptionalAttribute(.lineThrough, parseNumberOfLines),
                             rotation: node.valueOfOptionalAttribute(.rotation, parseRotationDegrees),
                             letterSpacing: node.valueOfOptionalAttribute(.letterSpacing, parseNumberOrNormal),
                             lineHeight: node.valueOfOptionalAttribute(.lineHeight, parseNumberOrNormal),
                             xmlLang: node.valueOfOptionalAttribute(.xmlLang),
                             xmlSpace: node.valueOfOptionalAttribute(.xmlSpace, parseXmlSpace),
                             dir: node.valueOfOptionalAttribute(.dir, parseTextDirection),
                             enclosure: node.valueOfOptionalAttribute(.enclosure, parseEnclosureShape))
    }

    internal static func parseFormattedTextID(_ node: Node) throws -> MXLFormattedTextID {
        try MXLFormattedTextID(id: node.valueOfOptionalAttribute(.id),
                               value: node.value ?? "",
                               justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight),
                               position: parsePosition(node),
                               font: parseFont(node),
                               color: parseColor(node),
                               halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                               valign: node.valueOfOptionalAttribute(.valign, parseValign),
                               underline: node.valueOfOptionalAttribute(.underline, parseNumberOfLines),
                               overline: node.valueOfOptionalAttribute(.overline, parseNumberOfLines),
                               lineThrough: node.valueOfOptionalAttribute(.lineThrough, parseNumberOfLines),
                               rotation: node.valueOfOptionalAttribute(.rotation, parseRotationDegrees),
                               letterSpacing: node.valueOfOptionalAttribute(.letterSpacing, parseNumberOrNormal),
                               lineHeight: node.valueOfOptionalAttribute(.lineHeight, parseNumberOrNormal),
                               xmlLang: node.valueOfOptionalAttribute(.xmlLang),
                               xmlSpace: node.valueOfOptionalAttribute(.xmlSpace, parseXmlSpace),
                               dir: node.valueOfOptionalAttribute(.dir, parseTextDirection),
                               enclosure: node.valueOfOptionalAttribute(.enclosure, parseEnclosureShape))
    }

    internal static func parseImage(_ node: Node) throws -> MXLImage {
        try MXLImage(id: node.valueOfOptionalAttribute(.id),
                     attributes: parseImageAttributes(node))
    }

    internal static func parseImageAttributes(_ node: Node) throws -> MXLImage.Attributes {
        try MXLImage.Attributes(source: node.valueOfRequiredAttribute(.source),
                                kind: node.valueOfRequiredAttribute(.type),
                                height: node.valueOfOptionalAttribute(.height, parseTenths),
                                width: node.valueOfOptionalAttribute(.width, parseTenths),
                                position: parsePosition(node),
                                halign: node.valueOfOptionalAttribute(.halign, parseLeftCenterRight),
                                valign: node.valueOfOptionalAttribute(.valign, parseValignImage))
    }

    internal static func parseInt(_ text: String) -> Int? {
        Int(text)
    }

    internal static func parseLeftCenterRight(_ text: String) -> MXLLeftCenterRight? {
        switch text {
        case "center":
            .center

        case "left":
            .left

        case "right":
            .right

        default:
            nil
        }
    }

    internal static func parseLeftRight(_ text: String) -> MXLLeftRight? {
        switch text {
        case "left":
            .left

        case "right":
            .right

        default:
            nil
        }
    }

    internal static func parseLineDetail(_ node: Node) throws -> MXLLineDetail {
        try MXLLineDetail(line: node.valueOfRequiredAttribute(.line, parseStaffLine),
                          width: node.valueOfOptionalAttribute(.width, parseTenths),
                          color: parseColor(node),
                          lineKind: node.valueOfOptionalAttribute(.lineType, parseLineKind),
                          printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo))
    }

    internal static func parseLineEnd(_ text: String) -> MXLLineEnd? {
        switch text {
        case "arrow":
            .arrow

        case "both":
            .both

        case "down":
            .down

        case "none":
            .plain

        case "up":
            .up

        default:
            nil
        }
    }

    internal static func parseLineKind(_ text: String) -> MXLLineKind? {
        switch text {
        case "dashed":
            .dashed

        case "dotted":
            .dotted

        case "solid":
            .solid

        case "wavy":
            .wavy

        default:
            nil
        }
    }

    internal static func parseLineLength(_ text: String) -> MXLLineLength? {
        switch text {
        case "long":
            .long

        case "medium":
            .medium

        case "short":
            .short

        default:
            nil
        }
    }

    internal static func parseLineShape(_ text: String) -> MXLLineShape? {
        switch text {
        case "curved":
            .curved

        case "straight":
            .straight

        default:
            nil
        }
    }

    internal static func parseMillimeters(_ text: String) -> MXLMillimeters? {
        MXLMillimeters(text)
    }

    internal static func parseMilliseconds(_ text: String) -> MXLMilliseconds? {
        UInt(text).flatMap(MXLMilliseconds.init(uintValue:))
    }

    internal static func parseNonNegativeDecimal(_ text: String) -> MXLNonNegativeDecimal? {
        MXLNonNegativeDecimal(text)
    }

    internal static func parseNumberLevel(_ text: String) -> MXLNumberLevel? {
        UInt(text).flatMap(MXLNumberLevel.init(uintValue:))
    }

    internal static func parseNumberOfLines(_ text: String) -> MXLNumberOfLines? {
        UInt(text).flatMap(MXLNumberOfLines.init(uintValue:))
    }

    internal static func parseNumberOrNormal(_ text: String) -> MXLNumberOrNormal? {
        if text == "normal" {
            return .normal
        }

        return Double(text).map { .number($0) }
    }
}
