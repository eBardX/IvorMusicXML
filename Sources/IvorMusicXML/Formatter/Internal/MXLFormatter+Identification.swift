// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeCredit(_ credit: MXLCredit) {
        var attributes: [(MXLAttributeName, String)] = []

        if let page = credit.page {
            attributes.append((.page, String(page)))
        }

        if let id = credit.id {
            attributes.append((.id, id))
        }

        openElement(.credit,
                    attributes: attributes)

        for kind in credit.kind {
            writeTextElement(.creditType, kind)
        }

        for link in credit.link {
            writeLink(link)
        }

        for bookmark in credit.bookmark {
            writeBookmark(bookmark)
        }

        writeCreditContent(credit.content)

        closeElement()
    }

    internal mutating func writeCreditContent(_ content: MXLCredit.Content) {
        switch content {
        case let .alternative(content, group):
            writeCreditContentAlternativeContent(content)

            for alternativeGroup in group {
                for link in alternativeGroup.link {
                    writeLink(link)
                }

                for bookmark in alternativeGroup.bookmark {
                    writeBookmark(bookmark)
                }

                writeCreditContentAlternativeGroupContent(alternativeGroup.content)
            }

        case let .creditImage(image):
            writeImage(.creditImage, image)
        }
    }

    internal mutating func writeCreditContentAlternativeContent(_ content: MXLCredit.Content.AlternativeContent) {
        switch content {
        case let .creditSymbol(symbol):
            writeFormattedSymbolID(.creditSymbol, symbol)

        case let .creditWords(words):
            writeFormattedTextID(.creditWords, words)
        }
    }

    internal mutating func writeCreditContentAlternativeGroupContent(_ content: MXLCredit.Content.AlternativeGroup.Content) {
        switch content {
        case let .creditSymbol(symbol):
            writeFormattedSymbolID(.creditSymbol, symbol)

        case let .creditWords(words):
            writeFormattedTextID(.creditWords, words)
        }
    }

    internal mutating func writeDefaults(_ defaults: MXLDefaults) {
        openElement(.defaults)

        if let scaling = defaults.scaling {
            writeScaling(scaling)
        }

        if defaults.isConcertScore {
            writeEmptyElement(.concertScore)
        }

        writeLayout(defaults.layout)

        if let appearance = defaults.appearance {
            writeAppearance(appearance)
        }

        if let musicFont = defaults.musicFont {
            writeEmptyElement(.musicFont,
                              attributes: fontAttributes(musicFont))
        }

        if let wordFont = defaults.wordFont {
            writeEmptyElement(.wordFont,
                              attributes: fontAttributes(wordFont))
        }

        for lyricFont in defaults.lyricFont {
            writeLyricFont(lyricFont)
        }

        for lyricLanguage in defaults.lyricLanguage {
            writeLyricLanguage(lyricLanguage)
        }

        closeElement()
    }

    internal mutating func writeEncoding(_ encoding: MXLEncoding) {
        openElement(.encoding)

        for item in encoding.items {
            writeEncodingItem(item)
        }

        closeElement()
    }

    internal mutating func writeEncodingItem(_ item: MXLEncoding.Item) {
        switch item {
        case let .encoder(text):
            writeTypedText(.encoder, text)

        case let .encodingDate(date):
            writeTextElement(.encodingDate, date)

        case let .encodingDescription(description):
            writeTextElement(.encodingDescription, description)

        case let .software(software):
            writeTextElement(.software, software)

        case let .supports(supports):
            writeSupports(supports)
        }
    }

    internal mutating func writeIdentification(_ identification: MXLIdentification) {
        openElement(.identification)

        for creator in identification.creator {
            writeTypedText(.creator, creator)
        }

        for rights in identification.rights {
            writeTypedText(.rights, rights)
        }

        if let encoding = identification.encoding {
            writeEncoding(encoding)
        }

        if let source = identification.source {
            writeTextElement(.source, source)
        }

        for relation in identification.relation {
            writeTypedText(.relation, relation)
        }

        if let miscellaneous = identification.miscellaneous {
            writeMiscellaneous(miscellaneous)
        }

        closeElement()
    }

    internal mutating func writeMiscellaneous(_ miscellaneous: MXLMiscellaneous) {
        openElement(.miscellaneous)

        for field in miscellaneous.field {
            writeMiscellaneousField(field)
        }

        closeElement()
    }

    internal mutating func writeMiscellaneousField(_ field: MXLMiscellaneous.Field) {
        writeTextElement(.miscellaneousField,
                         field.value,
                         attributes: [(.name, field.name)])
    }

    internal mutating func writeSupports(_ supports: MXLSupports) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatYesNo(supports.isSupported)),
                                                        (.element, supports.element)]

        if let attribute = supports.attribute {
            attributes.append((.attribute, attribute))
        }

        if let value = supports.value {
            attributes.append((.value, value))
        }

        writeEmptyElement(.supports,
                          attributes: attributes)
    }

    internal mutating func writeWork(_ work: MXLWork) {
        openElement(.work)

        if let number = work.number {
            writeTextElement(.workNumber, number)
        }

        if let title = work.title {
            writeTextElement(.workTitle, title)
        }

        if let opus = work.opus {
            writeEmptyElement(.opus,
                              attributes: xlinkAttributes(opus))
        }

        closeElement()
    }
}
