// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseElision(_ node: Node) throws -> MXLElision {
        try MXLElision(value: node.value ?? "",
                       font: parseFont(node),
                       color: parseColor(node),
                       smufl: node.valueOfOptionalAttribute(.smufl, parseSmuflLyricsGlyphName))
    }

    internal static func parseExtend(_ node: Node) throws -> MXLExtend {
        try MXLExtend(kind: node.valueOfOptionalAttribute(.type, parseStartStopContinue),
                      position: parsePosition(node),
                      color: parseColor(node))
    }

    internal static func parseLyric(_ node: Node) throws -> MXLLyric {
        try MXLLyric(id: node.valueOfOptionalAttribute(.id),
                     content: parseLyricContent(node),
                     endsLine: node.hasChildElement(.endLine),
                     endsParagraph: node.hasChildElement(.endParagraph),
                     footnote: node.optionalChildElement(.footnote, parseFormattedText),
                     level: node.optionalChildElement(.level, parseLevel),
                     number: node.valueOfOptionalAttribute(.number),
                     name: node.valueOfOptionalAttribute(.name),
                     justify: node.valueOfOptionalAttribute(.justify, parseLeftCenterRight),
                     position: parsePosition(node),
                     placement: node.valueOfOptionalAttribute(.placement, parseAboveBelow),
                     color: parseColor(node),
                     printsObject: node.valueOfOptionalAttribute(.printObject, parseYesNo),
                     timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly))
    }

    internal static func parseLyricContent(_ node: Node) throws -> MXLLyric.Content {
        if node.hasChildElement(.laughing) {
            return .laughing
        }

        if node.hasChildElement(.humming) {
            return .humming
        }

        let items = node.allChildElements([.elision, .extend, .syllabic, .text])

        if !node.hasChildElement(.text) {
            return try .extend(node.requiredChildElement(.extend, parseExtend))
        }

        var index = 0
        var syllabic: MXLSyllabic?

        if index < items.count,
           items[index].element == .syllabic {
            syllabic = items[index].value.flatMap(parseSyllabic)
            index += 1
        }

        let text = try index < items.count ? parseTextElementData(items[index]) : emptyTextElementData()

        if index < items.count {
            index += 1
        }

        var syllabicGroup: [MXLLyric.Content.SyllabicGroup] = []

        while index < items.count,
              items[index].element == .elision {
            let elision = try parseElision(items[index])

            index += 1

            var groupSyllabic: MXLSyllabic?

            if index < items.count,
               items[index].element == .syllabic {
                groupSyllabic = items[index].value.flatMap(parseSyllabic)
                index += 1
            }

            guard index < items.count
            else { break }

            let groupText = try parseTextElementData(items[index])

            index += 1

            syllabicGroup.append(MXLLyric.Content.SyllabicGroup(group: MXLLyric.Content.SyllabicGroup.Group(elision: elision,
                                                                                                            syllabic: groupSyllabic),
                                                                text: groupText))
        }

        let extend = try node.optionalChildElement(.extend, parseExtend)

        return .syllabic(syllabic,
                         text: text,
                         group: syllabicGroup,
                         extend: extend)
    }

    internal static func parseLyricFont(_ node: Node) throws -> MXLLyricFont {
        try MXLLyricFont(number: node.valueOfOptionalAttribute(.number),
                         name: node.valueOfOptionalAttribute(.name),
                         font: parseFont(node))
    }

    internal static func parseLyricLanguage(_ node: Node) throws -> MXLLyricLanguage {
        try MXLLyricLanguage(number: node.valueOfOptionalAttribute(.number),
                             name: node.valueOfOptionalAttribute(.name),
                             xmlLang: node.valueOfOptionalAttribute(.xmlLang))
    }

    internal static func parseSyllabic(_ text: String) -> MXLSyllabic? {
        switch text {
        case "begin":
            .begin

        case "end":
            .end

        case "middle":
            .middle

        case "single":
            .single

        default:
            nil
        }
    }
}
