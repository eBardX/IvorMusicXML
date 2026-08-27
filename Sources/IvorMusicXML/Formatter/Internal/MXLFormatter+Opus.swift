// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeOpus(_ opus: MXLOpus) {
        openElement(.opus,
                    attributes: [(.version, "\(opus.version.major).\(opus.version.minor)")])

        if let title = opus.title {
            writeTextElement(.title, title)
        }

        for item in opus.items {
            writeOpusItem(item)
        }

        closeElement()
    }

    internal mutating func writeOpusItem(_ item: MXLOpus.Item) {
        switch item {
        case let .opus(opus):
            writeOpus(opus)

        case let .opusLink(link):
            writeEmptyElement(.opusLink,
                              attributes: xlinkAttributes(link))

        case let .score(score):
            writeOpusScore(score)
        }
    }

    internal mutating func writeOpusScore(_ score: MXLOpus.Score) {
        var attributes = xlinkAttributes(score.xlink)

        if let newPage = score.newPage {
            attributes.append((.newPage, formatYesNo(newPage)))
        }

        writeEmptyElement(.score,
                          attributes: attributes)
    }
}
