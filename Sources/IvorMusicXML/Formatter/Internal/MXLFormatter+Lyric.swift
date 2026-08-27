// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeElision(_ elision: MXLElision) {
        var attributes = fontAttributes(elision.font)

        attributes += colorAttributes(elision.color)

        if let smufl = elision.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.elision,
                         elision.value,
                         attributes: attributes)
    }

    internal mutating func writeExtend(_ extend: MXLExtend) {
        var attributes: [(MXLAttributeName, String)] = []

        if let kind = extend.kind {
            attributes.append((.type, formatStartStopContinue(kind)))
        }

        attributes += positionAttributes(extend.position)
        attributes += colorAttributes(extend.color)

        writeEmptyElement(.extend,
                          attributes: attributes)
    }

    internal mutating func writeLyric(_ lyric: MXLLyric) {
        openElement(.lyric,
                    attributes: _lyricAttributes(lyric))

        writeLyricContent(lyric.content)

        if lyric.endsLine {
            writeEmptyElement(.endLine)
        }

        if lyric.endsParagraph {
            writeEmptyElement(.endParagraph)
        }

        // The footnote and level children are written in a later phase.

        closeElement()
    }

    internal mutating func writeLyricContent(_ content: MXLLyric.Content) {
        switch content {
        case let .extend(extend):
            writeExtend(extend)

        case .humming:
            writeEmptyElement(.humming)

        case .laughing:
            writeEmptyElement(.laughing)

        case let .syllabic(syllabic, text, group, extend):
            if let syllabic {
                writeTextElement(.syllabic, _formatSyllabic(syllabic))
            }

            writeTextElementData(.text, text)

            for syllabicGroup in group {
                if let group = syllabicGroup.group {
                    writeElision(group.elision)

                    if let syllabic = group.syllabic {
                        writeTextElement(.syllabic, _formatSyllabic(syllabic))
                    }
                }

                writeTextElementData(.text, syllabicGroup.text)
            }

            if let extend {
                writeExtend(extend)
            }
        }
    }

    internal mutating func writeLyricFont(_ lyricFont: MXLLyricFont) {
        var attributes: [(MXLAttributeName, String)] = []

        if let number = lyricFont.number {
            attributes.append((.number, number))
        }

        if let name = lyricFont.name {
            attributes.append((.name, name))
        }

        attributes += fontAttributes(lyricFont.font)

        writeEmptyElement(.lyricFont,
                          attributes: attributes)
    }

    internal mutating func writeLyricLanguage(_ lyricLanguage: MXLLyricLanguage) {
        var attributes: [(MXLAttributeName, String)] = []

        if let number = lyricLanguage.number {
            attributes.append((.number, number))
        }

        if let name = lyricLanguage.name {
            attributes.append((.name, name))
        }

        if let xmlLang = lyricLanguage.xmlLang {
            attributes.append((.xmlLang, xmlLang))
        }

        writeEmptyElement(.lyricLanguage,
                          attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatSyllabic(_ value: MXLSyllabic) -> String {
        switch value {
        case .begin:
            "begin"

        case .end:
            "end"

        case .middle:
            "middle"

        case .single:
            "single"
        }
    }

    private func _lyricAttributes(_ lyric: MXLLyric) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = lyric.id {
            attributes.append((.id, id))
        }

        if let number = lyric.number {
            attributes.append((.number, number))
        }

        if let name = lyric.name {
            attributes.append((.name, name))
        }

        if let justify = lyric.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        attributes += positionAttributes(lyric.position)

        if let placement = lyric.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        attributes += colorAttributes(lyric.color)

        if let printsObject = lyric.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        if let timeOnly = lyric.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        return attributes
    }
}
