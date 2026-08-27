// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOpusItemTests {
}

// MARK: -

extension MXLOpusItemTests {
    @Test
    func equality() {
        let score = MXLOpus.Score(xlink: MXLXLink(href: "score1.xml"))

        #expect(MXLOpus.Item.score(score) == .score(score))
    }

    @Test
    func hashable() {
        let score = MXLOpus.Item.score(MXLOpus.Score(xlink: MXLXLink(href: "score1.xml")))
        let opusLink = MXLOpus.Item.opusLink(MXLXLink(href: "opus2.xml"))
        let values: Set<MXLOpus.Item> = [score, score, opusLink]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let score = MXLOpus.Item.score(MXLOpus.Score(xlink: MXLXLink(href: "score1.xml")))
        let opusLink = MXLOpus.Item.opusLink(MXLXLink(href: "opus2.xml"))

        #expect(score != opusLink)
    }
}
